package com.hk.base.dao;


import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.hk.base.support.Pages;


@Repository
public class HibernateBaseDao<T extends Object> extends HibernateDaoSupport implements IBaseDao
{
	@Override
	public HibernateTemplate getHT() {
		return super.getHibernateTemplate();
	}

	@Resource
	public void setSF(SessionFactory sessionFactory){  
		super.setSessionFactory(sessionFactory);
	}
	@Override
	public <T extends Object> T get(Class<T> modelClass, Serializable id) {
		if (id==null || id.toString().length()==0) {
			return null;
		}
		HibernateTemplate ht = getHT();
		T m = ht.get(modelClass, id);
		if (m == null) return m;
		ht.evict(m);
		return m;
	}

	@Override
	public <T extends Object> T save(T model) {
		HibernateTemplate ht = getHT();
		ht.saveOrUpdate(model);
		return model;
	}

	@Override
	public <L extends Collection<? extends Object>> L saveAll(L models) {
		for (Object m : models) {
			save(m);
		}
		return models;
	}
	@Override
	public <T extends Object> void remove(T model) {
		getHT().delete(model);
	}

	@Override
	public <L extends Collection<? extends Object>> void removeAll(L models) {
		getHT().deleteAll(models);
	}
	@Override
	public <T extends Object> void removeById(Class<T> modelClass, Serializable id) {
		remove(get(modelClass,id));
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T extends Object> List<T> criteria(Class<T> clazz, Criterion criterion,Projection projection,
			Order order, Pages pages) {
		Session session = getHT().getSessionFactory().getCurrentSession();
		Criteria criteria = session.createCriteria(clazz);
		if (projection != null) {
			criteria.setProjection(projection);
		}
		if(criterion != null){
			criteria.add(criterion);
		}
		if(order != null){
			criteria.addOrder(order);
		}
		if(pages != null){
			pages.setTotalCount(((Long)criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue());
			if (projection != null) {
				criteria.setProjection(projection);
			}else{
				criteria.setProjection(null);
			}
			if (pages.getPageSize() <= 0) {
				pages.setPageSize(10);
			}
			if (pages.getCurrentPage() > pages.getTotalCount()) {
				pages.setCurrentPage(pages.getTotalCount());
			}
			if (pages.getCurrentPage() <= 0) {
				pages.setCurrentPage(1);
			}
			criteria.setFirstResult(pages.getCurrentRow());
			criteria.setMaxResults(pages.getPageSize());
		}
		List<T> list = criteria.list();
		return list;
	}

}
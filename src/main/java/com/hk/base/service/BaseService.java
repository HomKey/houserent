package com.hk.base.service;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.persistence.Entity;
import javax.transaction.Transactional;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.base.dao.IBaseDao;
import com.hk.base.support.Pages;
import com.hk.base.support.ResultsData;

@Service
@Transactional
public class BaseService<T> {

	/**
     * Log variable for all child classes.
     */
    protected final Logger logger = LoggerFactory.getLogger(getClass());

    private Class<T> entityClass;

	@Autowired
	protected IBaseDao dao;
	
	protected IBaseDao getDao() {
		return this.dao;
	}

	@SuppressWarnings("unchecked")
	public BaseService() {
		Type genType = getClass().getGenericSuperclass();
		if (genType instanceof ParameterizedType) {
			Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
			Class<T> targetClass = (Class<T>) params[0];
			if (targetClass.getAnnotation(Entity.class) != null) {
				entityClass = targetClass;
			}
		}
	}

	public T get(String id) {
		if (entityClass == null) return null;
		return getDao().get(entityClass, id);
	}

	public  T get(Class<T> clazz, String id) {
		return getDao().get(clazz, id);
	}
	@Transactional
	public T save(T model){
		return getDao().save(model);
	}
	@Transactional
	public void remove(T model){
		getDao().remove(model);
	}
	@Transactional
	public void removeById(Class<T> clazz,String id){
		getDao().removeById(clazz, id);
	}
	
	public List<T> criteria(Class<T> clazz, Criterion criterion,Projection projection,
			Order order, Integer page,Integer pageSize){
		Pages pages = new Pages(pageSize,page);
		return getDao().criteria(clazz, criterion, projection, order, pages);
	}
	public List<T> criteria(Class<T> clazz, Criterion criterion,Projection projection,
			Order order){
		return getDao().criteria(clazz, criterion, projection, order, null);
	}
}

package com.hk.base.dao;


import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.springframework.orm.hibernate4.HibernateTemplate;

import com.hk.base.support.Pages;

/** 
* 基础数据库操作类 
*/
public interface IBaseDao{

	HibernateTemplate getHT();
	<T extends Object> T get(Class<T> clazz,Serializable id);
	<T extends Object> T save(T model);
	<L extends Collection<? extends Object>> L saveAll(L models);
	<T extends Object> void remove(T model);
	<L extends Collection<? extends Object>> void removeAll(L models);
	<T extends Object> void removeById(Class<T> clazz,Serializable id);
	<T extends Object> List<T> criteria(Class<T> clazz,Criterion criterion,Projection projection,Order order,Pages pages);
	List<?> queryByHQL(final String hql, final Object... params);
	int executeByHQL(final String hql, final Object... params);
	List<Map<String, Object>> queryBySQL(final String sql);
	<T extends Object> List<T> queryBySQL(final String sql,Class<T> clazz);
}
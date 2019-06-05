package com.innerest.common;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

/*
 * - select() : primary Key 가 INT인 경우 사용 권장
 * - selectList() :  
 */
public abstract class CrudDao<T> {
	
	@Inject
	protected SqlSession session;
	protected String ns;
	
	protected void setNs(String ns) {
		this.ns = ns;
	}
	protected String getNs() {
		return this.ns;
	}
	
	protected void insert(T t) {
		session.insert(ns+".insert", t);
	}
	protected void insert(Map<String,Object> map) {
		session.insert(ns+".insertMap", map);
	}
	
	protected T select(Integer num) {
		return session.selectOne(ns+".select", num);
	}
	protected List<T> selectList() {
		return session.selectList(ns+".selectList");
	}
	protected List<T> selectList(Integer num) {
		return session.selectList(ns+".selectList", num);
	}
	protected void update(T t) {
		session.update(ns+".update", t);
	}
	protected void update(Map<String, Object> map) {
		session.update(ns+".updateMap", map);
	}
	protected void delete(Integer num) {
		session.delete(ns+".delete", num);
	}

}

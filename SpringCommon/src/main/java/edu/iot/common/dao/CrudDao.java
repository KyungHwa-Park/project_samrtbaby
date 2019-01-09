package edu.iot.common.dao;

import java.util.List;

public interface CrudDao<M, K>{

//	Create (DML : INSERT)
	int insert(M m) throws Exception;
	
//	Read (DML : SELECT)
	int count() throws Exception;

	M findById(K k) throws Exception;
	
	List<M> getList() throws Exception;
	
//	Update (DML : UPDATE)
//	int update(M m) throws Exception;
	
//	Delete (DML : DELETE)
	int delete(K k) throws Exception;
}

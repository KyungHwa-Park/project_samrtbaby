package edu.iot.common.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import edu.iot.common.model.Board;

public interface BoardDao extends CrudDao<Board, Long> {
	
	List<Board> getPage1(Map map) throws Exception;
	List<Board> getPage2(String userId) throws Exception;
	Board getLastBoard(String userId) throws Exception;
	int count(String userId) throws Exception;
	
//	Update (DML : UPDATE)
	int updateWakeup(Board board) throws Exception;
	int updateMemo(Board board) throws Exception;
	
}

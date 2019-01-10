package edu.iot.common.dao;

import java.util.List;
import java.util.Map;

import edu.iot.common.model.Board;

public interface BoardDao extends CrudDao<Board, Long> {
	
	List<Board> getPage(Map map) throws Exception;
	int updateWTime(Board board) throws Exception;		// wakeupTime값 업데이트용
	int updateTTime(Board board) throws Exception;		// totalTime값 계산용
}

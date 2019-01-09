package edu.iot.common.dao;

import java.util.List;
import java.util.Map;

import edu.iot.common.model.Board;

public interface BoardDao extends CrudDao<Board, Long> {
	void delete (Board board) throws Exception;
	int update(Board board) throws Exception;
	List<Board> getPage(Map map) throws Exception;
}

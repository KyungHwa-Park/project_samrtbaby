package edu.iot.common.service;

import java.util.List;
import java.util.Map;

import edu.iot.common.model.Board;

public interface BoardService {
	
	Map<String, Object> getPage1(int page) throws Exception;	
	List<Board> getPage2() throws Exception;	
	public void create(Board board) throws Exception;
	public Board findById(long boardId) throws Exception;
	public Board getLastBoard(String userId) throws Exception;
	public void update(Board board) throws Exception;
	public void updateWakeup(Board board) throws Exception;
	public void delete(Board board) throws Exception;
	
	
}

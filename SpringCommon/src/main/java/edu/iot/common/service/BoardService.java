package edu.iot.common.service;

import java.util.ArrayList;
import java.util.Map;

import edu.iot.common.model.Board;

public interface BoardService {
	
	Map<String, Object> getPage1(int page, String userId) throws Exception;	
	ArrayList<Board> getPage2(String userId) throws Exception;	
	public void create(Board board) throws Exception;
	public Board findById(long boardId) throws Exception;
	public Board getLastBoard(String userId) throws Exception;
	public void updateMemo(Board board) throws Exception;
	public void updateWakeup(Board board) throws Exception;
	public void delete(Board board) throws Exception;
	
	
}

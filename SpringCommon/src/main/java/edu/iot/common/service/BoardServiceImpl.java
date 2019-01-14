package edu.iot.common.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.iot.common.dao.BoardDao;
import edu.iot.common.model.Board;
import edu.iot.common.model.Pagination;
import edu.iot.common.model.Search;
import edu.iot.common.model.SleepType;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDao dao;

	@Override
	public Map<String, Object> getPage1(int page, String userId) throws Exception {
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> map2 = new HashMap<>();

		int total = dao.count(userId);
		Pagination pagination = new Pagination(page, total);
		map.put("pagination", pagination);
		map2.put("pageMap", pagination.getPageMap());
		map2.put("userId", userId);
		map.put("list", dao.getPage1(map2));
		return map;
	}

	@Override
	public ArrayList<Board> getPage2(String userId) throws Exception {
		List<Board> array = dao.getPage2(userId);
		ArrayList<Board> result = new ArrayList<>();
		for (Board board : array) {
			if (board != null) {
				result.add(board);
			}
		}
		return result;
	}

	@Override
	public Board findById(long boardId) throws Exception {

		Board board = dao.findById(boardId);
		return board;
	}

	@Override
	public void updateMemo(Board board) throws Exception {
		dao.updateMemo(board);
//		if (result == 0) { // 비밀번호가 일치하지 않으면 sql update쿼리 적용 실패로 return값이 0 \
////							(==> DB에서 SQL update 실패면 결과=0/update성공이면 결과=1)
//			throw new Exception();
//		}
	}

	@Override
	public void updateWakeup(Board board) throws Exception {
		int result = dao.updateWakeup(board);
		if (result == 0) { // 비밀번호가 일치하지 않으면 sql update쿼리 적용 실패로 return값이 0 \
//			(==> DB에서 SQL update 실패면 결과=0/update성공이면 결과=1)
			throw new Exception();
		}

	}

//	@Override
//	// 일반 사용자에 의한 삭제
//	public void delete(Board board) throws Exception {
//
////		Board b = dao.findById(board.getId());
////		if(!b.getPassword().equals(board.getPassword())) {
////			throw new PasswordMissmatchException();
////		}
////		attachmentDao.deleteByBoardId(board.getBoardId());
//		dao.delete(board.getBoardId());
//	}

	@Override
	public boolean delete(long boardId) throws Exception {
		return dao.delete(boardId) == 1;
	}

	@Override
	public void create(Board board) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(board);
	}

	@Override
	public Board getLastBoard(String userId) throws Exception {
		Board board = dao.getLastBoard(userId);
		return board;
	}

	
	
	
	
//	@Override
//	public List<Board> search(Search search) throws Exception {
//		return dao.search(search);
//	}	

//	@Override
//	public Map<String, Object> getSearch(int page, String userId, SleepType dayNight) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		Map<String, Object> map2 = new HashMap<>();
//
//		int total = dao.count1(dayNight);
//		Pagination pagination = new Pagination(page, total);
//		map.put("pagination", pagination);
//		map2.put("pageMap", pagination.getPageMap());
//		map2.put("userId", userId);
//		map.put("list", dao.getPage1(map2));
//		return map;
//	}

}

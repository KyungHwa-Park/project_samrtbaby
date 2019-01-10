package edu.iot.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.iot.common.dao.BoardDao;
import edu.iot.common.exception.PasswordMissmatchException;
import edu.iot.common.model.Board;
import edu.iot.common.model.Pagination;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDao dao;
	
	@Override
	public Map<String, Object> getPage(int page) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		int total = dao.count();
		Pagination pagination = new Pagination(page, total);
		map.put("pagination", pagination);
		map.put("list", dao.getPage(pagination.getPageMap()));
		return map;
	}

	@Override
	public Board findById(long boardId) throws Exception {
		
		Board board = dao.findById(boardId);
		return board;
	}

	@Override
	public void update(Board board) throws Exception {
		int result = dao.update(board);
		if(result==0) {		//비밀번호가 일치하지 않으면 sql update쿼리 적용 실패로 return값이 0 \
//							(==> DB에서 SQL update 실패면 결과=0/update성공이면 결과=1)
			throw new PasswordMissmatchException();
		}		
	}


	@Override
	//일반 사용자에 의한 삭제
	public void delete(Board board) throws Exception {
		
//		Board b = dao.findById(board.getId());
//		if(!b.getPassword().equals(board.getPassword())) {
//			throw new PasswordMissmatchException();
//		}
//		attachmentDao.deleteByBoardId(board.getBoardId());
		dao.delete(board.getBoardId());
	}

	@Override
	public void create(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}
	

}

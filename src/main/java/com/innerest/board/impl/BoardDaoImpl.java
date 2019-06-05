package com.innerest.board.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.innerest.board.BoardDao;
import com.innerest.board.BoardVO;
import com.innerest.common.SearchVO;

@Repository
public class BoardDaoImpl implements BoardDao{

	public static final String ns = "board";
	
	@Inject
	private SqlSession session;
	
	@Override
	public void insertBoard(BoardVO boardVO) {
		session.insert(ns+".insertBoard", boardVO);
	}

	@Override
	public List<BoardVO> selectBoardList(SearchVO search) {
		return session.selectList(ns+".selectBoardList", search);
	}

	@Override
	public int selectCount(SearchVO searchVO) {
		return session.selectOne(ns+".selectCount", searchVO);
	}

	@Override
	public BoardVO selectBoard(int bnum) {
		return session.selectOne(ns+".selectBoard",bnum);
	}

	@Override
	public Integer selectNewestBoardOrder() {
		return session.selectOne("board.selectNewestBoardOrder");
	}

	@Override
	public void updateBoard(BoardVO boardVO) {
		session.update(ns+".updateBoard", boardVO);
	}

	@Override
	public void deleteBoard(int bnum) {
		session.delete(ns+".deleteBoard", bnum);
	}

}

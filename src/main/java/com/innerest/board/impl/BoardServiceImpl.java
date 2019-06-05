package com.innerest.board.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.innerest.board.BoardDao;
import com.innerest.board.BoardService;
import com.innerest.board.BoardVO;
import com.innerest.common.SearchVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDao boardDao;
	
	@Override
	public List<BoardVO> searchBoardList(SearchVO searchVO) {
		return boardDao.selectBoardList(searchVO);
	}

	@Override
	public void writeBoard(BoardVO boardVO) {
		Integer border = boardDao.selectNewestBoardOrder();
		boardVO.setType("Q");
		if(border == null) {
			boardVO.setBorder(2);
		} else {
			boardVO.setBorder(border+2);
		}
		boardDao.insertBoard(boardVO);
	}

	@Override
	public void writeReply(BoardVO boardVO) {
		BoardVO parent = boardDao.selectBoard(boardVO.getBnum());
		boardVO.setBorder(parent.getBorder()-1);
		boardVO.setType("A");
		boardVO.setOpen_flag(parent.getOpen_flag());
		boardDao.insertBoard(boardVO);
	}

	@Override
	public int selectCount(SearchVO searchVO) {
		return boardDao.selectCount(searchVO);
	}

	@Override
	public BoardVO readBoard(int bnum) {
		return boardDao.selectBoard(bnum);
	}

	@Override
	public void updateBoard(BoardVO boardVO) {
		boardDao.updateBoard(boardVO);
	}
	
}

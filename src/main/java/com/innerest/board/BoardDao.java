package com.innerest.board;

import java.util.List;

import com.innerest.common.SearchVO;

public interface BoardDao {
	public void insertBoard(BoardVO boardVO);
	
	public List<BoardVO> selectBoardList(SearchVO searchVO);

	public int selectCount(SearchVO searchVO);

	public BoardVO selectBoard(int bnum);
	
	public Integer selectNewestBoardOrder();
	
	public void updateBoard(BoardVO boardVO);
	
	public void deleteBoard(int bnum);
}

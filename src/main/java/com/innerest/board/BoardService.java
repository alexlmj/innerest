package com.innerest.board;
import java.util.List;

import com.innerest.common.SearchVO;

public interface BoardService {
	public List<BoardVO> searchBoardList(SearchVO searchVO);
	public void writeBoard(BoardVO boardVO);
	public void writeReply(BoardVO boardVO);
	public int selectCount(SearchVO searchVO);
	public BoardVO readBoard(int bnum);
	public void updateBoard(BoardVO boardVO);
}

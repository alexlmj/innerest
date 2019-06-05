package com.innerest.board.web;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.innerest.board.BoardService;
import com.innerest.board.BoardVO;
import com.innerest.common.SearchVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Inject
	private BoardService boardSrv;
	
	/*문의게시판 홈*/
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String boardHome(@ModelAttribute SearchVO searchVO, Model model) {
		searchVO.setTotalRecordNum(boardSrv.selectCount(searchVO));
		List<BoardVO> boardList = boardSrv.searchBoardList(searchVO);
		model.addAttribute("boardList",boardList);
		model.addAttribute("search",searchVO);
		return "board/board_home";
	}
	
	/*문의게시판 쓰기*/
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeForm(HttpSession session) {
		if(session.getAttribute("num") == null) {
			return "redirect:/login";
		}
		return "board/board_write";
	}
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@ModelAttribute BoardVO boardVO, HttpSession session) {
		boardVO.setUnum((Integer)session.getAttribute("num"));
		boardSrv.writeBoard(boardVO);
		return "redirect:/board";
	}
	
	/*문의게시판 답변 쓰기*/
	@RequestMapping(value = "/reply/{bnum}", method = RequestMethod.GET)
	public String writeReplyForm(@PathVariable int bnum, HttpSession session, Model model) {
		if(!session.getAttribute("id").equals("admin")) {
			return "redirect:/login";
		}
		BoardVO parent = boardSrv.readBoard(bnum);
		model.addAttribute("parent", parent);
		return "board/board_reply";
	}
	@RequestMapping(value = "/reply/{bnum}", method = RequestMethod.POST)
	public String writeReply(@PathVariable int bnum, @ModelAttribute BoardVO boardVO, HttpSession session) {
		if(!session.getAttribute("id").equals("admin")) {
			return "redirect:/login";
		}
		boardVO.setBnum(bnum);
		boardVO.setWriter((String)session.getAttribute("id"));
		boardVO.setUnum((Integer)session.getAttribute("num"));
		boardSrv.writeReply(boardVO);
		return "redirect:/board";
	}
	
	/*문의게시판 글 보기*/
	@RequestMapping(value = "/read/{bnum}", method = RequestMethod.GET)
	public String readForm(HttpSession session, @PathVariable int bnum, SearchVO search, Model model, RedirectAttributes rttr) {
		BoardVO board = boardSrv.readBoard(bnum);
		
		if(board == null) {
			//존재하지 않거나 사용자가 삭제한 경우
			return "redirect:/board";
		}
		
		//비밀글일 때
		if(board.getOpen_flag().equals("N")) {
			//권한이 없는 경우(관리자도 아니고 작성자도 아닌 경우)
			if(!"admin".equals(session.getAttribute("id")) && !board.getWriter().equals(session.getAttribute("id"))) {
				return "redirect:/board";
			} 
		}
		
		model.addAttribute("board", board);
		model.addAttribute("search", search);
		return "board/board_read";
	}
}

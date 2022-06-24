package com.example.trip.controller.board;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.trip.model.board.BoardDAO;
import com.example.trip.model.board.BoardDTO;
import com.example.trip.util.PageUtil;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	BoardDAO boardDao;
	
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue ="1") int curPage,
			@RequestParam(defaultValue ="all") String search_option,
			@RequestParam(defaultValue ="") String keyword) {
		int count = boardDao.count(search_option, keyword);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		List<BoardDTO> list = boardDao.list(start, end, search_option, keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/board");
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("page_info", page_info);
		mav.addObject("map",map);
		return mav;
	}
	
	@RequestMapping("detail.do")
	public ModelAndView detail(int board_idx) {
		boardDao.increase_hit(board_idx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/board_detail");
		mav.addObject("dto", boardDao.detail(board_idx));
		return mav;
	}
	
	@RequestMapping("insert.do")
	public String insert(BoardDTO dto, HttpSession session) {
		String writer = (String)session.getAttribute("id");
		dto.setWriter(writer);
		boardDao.insert(dto);
		return "redirect:/board/list.do";
	}	
	
	@RequestMapping("update.do")
	public String update(BoardDTO dto) {
		boardDao.update(dto);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(int board_idx) {
		boardDao.delete(board_idx);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "board/board_write";
	}
		
}

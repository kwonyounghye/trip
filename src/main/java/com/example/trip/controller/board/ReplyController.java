package com.example.trip.controller.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.trip.model.board.ReplyDAO;
import com.example.trip.model.board.ReplyDTO;
import com.example.trip.util.PageUtil;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Inject
	ReplyDAO replyDao;
	
	@RequestMapping("insert.do")
	public void insert(ReplyDTO dto, HttpSession session) {
		String adminid = (String)session.getAttribute("adminid");
		dto.setReplyer(adminid);
		replyDao.insert(dto);
	}
	
	@RequestMapping("/delete/{reply_idx}")
	public ResponseEntity<String> delete(@PathVariable("reply_idx") int reply_idx){
		ResponseEntity<String> entity = null;
		try {
			replyDao.delete(reply_idx);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/detail/{reply_idx}")
	public ModelAndView detail(@PathVariable("reply_idx") int reply_idx, ModelAndView mav) {
		ReplyDTO dto = replyDao.detail(reply_idx);
		mav.setViewName("board/reply_detail");
		mav.addObject("dto",dto);
		return mav;
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(int board_idx, @RequestParam(defaultValue = "1") int curPage, 
				ModelAndView mav) {
		int count = replyDao.count(board_idx);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		List<ReplyDTO> list = replyDao.list(board_idx, start, end);
		mav.setViewName("board/reply_list");
		mav.addObject("list", list);
		mav.addObject("page_info", page_info);
		return mav;
	}
	
	@RequestMapping("list_json.do")
	public @ResponseBody List<ReplyDTO> list_json(@RequestParam(defaultValue ="1") int curPage,
				@RequestParam int board_idx) {
		int count = replyDao.count(board_idx);
		PageUtil pager = new PageUtil(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<ReplyDTO> list = replyDao.list(board_idx, start, end);
		return list;
	}
	
	@RequestMapping("/update/{reply_idx}")
	public ResponseEntity<String> update(@PathVariable("reply_idx") int reply_idx,
			  @RequestBody ReplyDTO dto) {
		ResponseEntity<String> entity = null;
		try {
			dto.setReply_idx(reply_idx);
			replyDao.update(dto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);	
			System.out.println("entity" + entity);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}

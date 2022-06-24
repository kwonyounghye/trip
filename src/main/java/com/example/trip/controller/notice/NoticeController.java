package com.example.trip.controller.notice;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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

import com.example.trip.model.notice.NoticeDAO;
import com.example.trip.model.notice.NoticeDTO;
import com.example.trip.util.PageUtil;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Inject
	NoticeDAO noticeDao;

	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage, 
			@RequestParam(defaultValue ="all") String search_option,
			@RequestParam(defaultValue ="") String keyword) {
		int count = noticeDao.count(search_option, keyword);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		List<NoticeDTO> list = noticeDao.list(start, end, search_option, keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/notice");
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
	public ModelAndView detail(int idx) {
		noticeDao.increase_hit(idx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/notice_detail");
		mav.addObject("dto", noticeDao.detail(idx));
		return mav;		
	}	
	
	@RequestMapping("insert.do")
	public String insert(NoticeDTO dto, HttpServletRequest request) {
		noticeDao.insert(dto);
		return "redirect:/notice/list.do";
	}	
	
	@RequestMapping("update.do")
	public String update(NoticeDTO dto, HttpServletRequest request) {
		noticeDao.update(dto);
		return "redirect:/notice/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(int idx, HttpServletRequest request) {
		noticeDao.delete(idx);
		return "redirect:/notice/list.do";
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "notice/notice_write";
	}
	
}

package com.example.trip.controller.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.trip.model.mypage.MypageDAO;
import com.example.trip.model.mypage.MypageDTO;
import com.example.trip.model.product.ProductDTO;


@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Inject
	MypageDAO mypageDao;

	@RequestMapping("order_list.do")
	public ModelAndView order_list(HttpSession session, ModelAndView mav) {
		String id = (String) session.getAttribute("id");//로그인 한 사용자 아이디
		Map<String, Object> map = new HashMap<>();
		if(id != null) {
			List<MypageDTO> list = mypageDao.order_list(id);
			map.put("list", list);
			map.put("size", list.size());
			mav.setViewName("mypage/order_list");
			mav.addObject("map", map);
			return mav;
		}else {
			return new ModelAndView("member/login");
		}
	}//list
	
	@RequestMapping("order_detail/{order_id}")
	public ModelAndView order_detail(@PathVariable int order_id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/order_detail");
		mav.addObject("dto", mypageDao.order_detail(order_id));
		return mav;
	}//detail
	
	@RequestMapping("myProduct_list.do")
	public ModelAndView myProduct_list(HttpSession session, ModelAndView mav) {
		String writer = (String) session.getAttribute("id");//로그인 한 사용자 아이디 = 상품 작성자
		Map<String, Object> map = new HashMap<>();
		if(writer != null) {
			List<ProductDTO> list = mypageDao.myProduct_list(writer);
			map.put("list", list);
			map.put("size", list.size());
			mav.setViewName("mypage/myProduct_list");
			mav.addObject("map", map);
		}
		return mav;
		
	}
	
}

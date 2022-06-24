package com.example.trip.controller.shop;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.trip.model.product.ProductDTO;
import com.example.trip.model.shop.OrderDAO;
import com.example.trip.model.shop.OrderDTO;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@Inject 
	OrderDAO orderDao;
	
	@RequestMapping("orderPage.do")
	public ModelAndView orderPage(HttpSession session, int code) {
		ModelAndView mav = new ModelAndView();
		
		ProductDTO dto = orderDao.orderPage(code);
		
		mav.setViewName("shop/order"); 
		mav.addObject("dto", dto);
		return mav; 
	} 
	
	@RequestMapping("insert.do")
	public String insert(OrderDTO dto, HttpSession session) {
		String id = (String)session.getAttribute("id");

		dto.setId(id);
		orderDao.insert(dto);
		return "redirect:/mypage/order_list.do"; //주문페이지 수정
	}
}

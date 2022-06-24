package com.example.trip.controller.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.trip.model.shop.WishDAO;
import com.example.trip.model.shop.WishDTO;

@Controller
@RequestMapping("/wish/*")
public class WishController {
	
	@Inject
	WishDAO wishDao;
	
	@RequestMapping("delete.do") //부분 삭제
	public String delete(int wish_id) { //레코드 삭제
		wishDao.delete(wish_id);
		return "redirect:/wish/list.do"; //목록으로 이동
	}
	
	@RequestMapping("deleteAll.do") //전체 삭제
	public String deleteAll(HttpSession session) {
		String id = (String) session.getAttribute("id"); //세션 변수
		
		if(id != null) { //세션값이 있으면
			wishDao.delete_all(id); //장바구니 비우기
		}
		return "redirect:/wish/list.do";
	}
	
	@RequestMapping("update.do")
	public String update(int[] amount, int[] wish_id, HttpSession session) {
		//id 변수에 id값을 가져오고 String형으로 변환한다
		String id = (String) session.getAttribute("id");

		if(id == null) { //로그아웃 상태이면 
			return "redirect:/member/login.do"; //로그인 페이지 이동
		}
		  
		//i는 0부터 wish_id의 길이만큼 i씩 증가 
		for(int i=0; i<wish_id.length; i++) {
			if(amount[i] == 0) { //인원수가 0이면
				wishDao.delete(wish_id[i]); //레코드 삭제
			} else {
				WishDTO dto = new WishDTO();
				dto.setId(id);
				dto.setWish_id(wish_id[i]);
				dto.setAmount(amount[i]);
				
				wishDao.modify(dto); //인원 수 변경
			}
		}
		return "redirect:/wish/list.do";
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();
		String id = (String) session.getAttribute("id");
		
		if(id != null) { 
		
			List<WishDTO> list= wishDao.list(id);
			int sumMoney = wishDao.sum_money(id);
			
			//맵에 자료저장
			map.put("sumMoney", sumMoney);
			map.put("list", list);
			map.put("count", list.size());
			
			mav.setViewName("shop/wish_list"); //출력 페이지의 이름
			mav.addObject("map", map); //출력 페이지에 넘길 데이터
			return mav;
		} else { 
			return new ModelAndView("member/login"); 
		}		 
	}
	
	@RequestMapping("insert.do")
	public String insert(WishDTO dto, HttpSession session) {
		String id = (String) session.getAttribute("id");
		
		if(id == null) { 
			return "redirect:/member/login.do"; 
		}
		 
		dto.setId(id);
		wishDao.insert(dto);
		return "redirect:/wish/list.do";
	}
}



























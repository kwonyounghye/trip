package com.example.trip.controller.admin;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.trip.model.admin.AdminDAO;
import com.example.trip.model.admin.AdminDTO;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	@Inject
	AdminDAO adminDao;

	@RequestMapping("login.do")
	public String login() {
		return "admin/login";
	}

	@RequestMapping("login_check.do")
	public ModelAndView login_check(AdminDTO dto, HttpSession session) {
		String name = adminDao.login(dto);
		if (name != null) {
			session.setAttribute("adminid", dto.getId());
			session.setAttribute("name", name);
		}
		ModelAndView mav = new ModelAndView();
		if (name != null) {
			mav.setViewName("redirect:/"); // 로그인 성공 시 어디로 이동할지
		} else {
			mav.setViewName("admin/login");
			mav.addObject("message", "error");
		}
		return mav;
	}

	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		mav.setViewName("admin/login");
		mav.addObject("message", "logout");
		return mav;
	}
}

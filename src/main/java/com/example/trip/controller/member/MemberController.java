package com.example.trip.controller.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.trip.model.member.MemberDAO;
import com.example.trip.model.member.MemberDTO;

@Controller
public class MemberController {
	@Inject
	MemberDAO memberDao;

	@RequestMapping("member/list.do")
	public String memberList(Model model) {
		List<MemberDTO> list = memberDao.list();
		model.addAttribute("list", list);
		return "member/list";
	}

	@RequestMapping("member/write.do")
	public String write() {
		return "member/write";
	}

	@RequestMapping("member/join.do")
	public String join() {
		return "member/join";
	}

	@RequestMapping("member/insert.do")
	public String insert(@ModelAttribute MemberDTO dto) {
		memberDao.insert(dto);
		return "redirect:/";
	}

	@RequestMapping("member/view.do")
	public String view(@RequestParam String id, Model model) {
		model.addAttribute("dto", memberDao.detail(id));
		return "member/detail";
	}

	@RequestMapping("member/update.do")
	public String update(@ModelAttribute MemberDTO dto, Model model) {
		boolean result = memberDao.check_pw(dto.getId(), dto.getPw());
		if (result) {
			memberDao.update(dto);
			return "redirect:/member/list.do";
		} else {
			MemberDTO dto2 = memberDao.detail(dto.getId());
			model.addAttribute("dto", dto);
			model.addAttribute("message", "비밀번호 오류");
			return "member/detail";
		}
	}

	@RequestMapping("member/delete.do")
	public String delete(@RequestParam String id, @RequestParam String pw, Model model) {
		boolean result = memberDao.check_pw(id, pw);
		if (result) {
			memberDao.delete(id);
			return "redirect:/member/list.do";
		} else {
			model.addAttribute("message", "비밀번호 오류");
			model.addAttribute("dto", memberDao.detail(id));
			return "member/detail";
		}
	}

	@RequestMapping("member/login.do")
	public String login() {
		return "member/login";
	}

	@RequestMapping("member/login_check.do")
	public ModelAndView login_check(MemberDTO dto, HttpSession session) {
		String name = memberDao.login(dto);
		if (name != null) {
			session.setAttribute("id", dto.getId());
			session.setAttribute("name", name);
		}
		ModelAndView mav = new ModelAndView();
		if (name != null) {
			mav.setViewName("redirect:/"); // 로그인 성공 시 어디로 이동할지
		} else {
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		}
		return mav;
	}

	@RequestMapping("member/logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		mav.setViewName("member/login");
		mav.addObject("message", "logout");
		return mav;
	}

	@RequestMapping("join_check.do")
	public ModelAndView join_check(MemberDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("join.jsp");
		return mav;
	}

}

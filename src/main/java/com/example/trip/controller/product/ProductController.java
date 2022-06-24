package com.example.trip.controller.product;


import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.trip.model.product.ProductDAO;
import com.example.trip.model.product.ProductDTO;
import com.example.trip.util.PageUtil;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Inject
	ProductDAO productDao;

	@RequestMapping("registration.do")
	public String registration() {
		return "product/registration";
	}

	@RequestMapping("insert.do")
	public String insert(ProductDTO dto, HttpServletRequest request, HttpSession session) {
		String writer = (String) session.getAttribute("id");
		dto.setWriter(writer);
		String filename = "-";
		if (!dto.getFile1().isEmpty()) {

			filename = dto.getFile1().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/WEB-INF/views/images/");
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		dto.setFilename(filename);
		productDao.insert(dto);
		return "redirect:/product/list.do";

	}

	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "") String keyword) {
		int count = productDao.count(keyword);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		List<ProductDTO> list = productDao.list(start, end, keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/product/list");// /product/*->list.do->/product/list
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("keyword", keyword);
		map.put("page_info", page_info);
		mav.addObject("map", map);

//		mav.addObject("list", productDao.list());
		return mav;
	}

	@RequestMapping("edit/{code}")
	public ModelAndView edit(@PathVariable("code") int code, ModelAndView mav) {
		mav.setViewName("/product/edit");
		mav.addObject("dto", productDao.detail(code));
		return mav;
	}

	@RequestMapping("update.do")
	public String update(ProductDTO dto, HttpServletRequest request, HttpSession session) {
		session.setAttribute("writer", dto.getWriter());
		String filename = "-";
		if (!dto.getFile1().isEmpty()) {
			filename = dto.getFile1().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/WEB-INF/views/images/");
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
			dto.setFilename(filename);
		} else {
			ProductDTO dto2 = productDao.detail(dto.getCode());
			dto.setFilename(dto2.getFilename());
		}
		// System.out.println("dto:" + dto);
		productDao.update(dto);
		return "redirect:/product/list.do";
	}

	@RequestMapping("delete.do")
	public String delete(int code, HttpServletRequest request) {
		String filename = productDao.file_info(code);// 첨부파일의 이름
		System.out.println("code:"+code);
		if (filename != null && !filename.equals("-")) {// 첨부파일이 있으면
			ServletContext application = request.getSession().getServletContext();
			String path = application.getRealPath("/WEB-INF/views/images/");
			File f = new File(path + filename);
			if (f.exists())// 파일이 존재하면 삭제 처리
				f.delete();
		}
		productDao.delete(code);// 레코드 삭제
		return "redirect:/product/list.do";
	}

	@RequestMapping("detail/{code}")
	public ModelAndView detail(@PathVariable int code, ModelAndView mav) {
		mav.setViewName("/product/detail");
		mav.addObject("dto", productDao.detail(code));
		return mav;
	}

}

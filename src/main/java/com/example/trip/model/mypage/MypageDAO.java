package com.example.trip.model.mypage;

import java.sql.Date;
import java.util.List;

import com.example.trip.model.product.ProductDTO;

public interface MypageDAO {
	List<MypageDTO> order_list(String id); //주문목록(회원 아이디 (member(id)))
	
	MypageDTO order_detail (int order_id); //주문상세화면(주문 번호)
	
	List<ProductDTO> myProduct_list(String writer); //내 상품 목록 (작성자)
	
	int order_count (int id, Date order_date);
}

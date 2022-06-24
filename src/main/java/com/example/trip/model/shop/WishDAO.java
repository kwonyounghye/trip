package com.example.trip.model.shop;

import java.util.List;

public interface WishDAO {
	List<WishDTO> wish_money(); //품목별 금액
	
	void insert(WishDTO dto); //추가
	
	List<WishDTO> list(String id); //목록
	 
	void delete(int wish_id); //개별 삭제
	
	void delete_all(String id); //전체 삭제
	
	int sum_money(String id); //전체 금액
	
	void modify(WishDTO dto); //수정
}

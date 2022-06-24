package com.example.trip.model.shop;

import com.example.trip.model.product.ProductDTO;

//DAO가 가져야할 기능들의 목록을 정의
public interface OrderDAO {
	
	ProductDTO orderPage(int code); //상품 상세 정보
	
	void insert(OrderDTO dto); //추가 
}

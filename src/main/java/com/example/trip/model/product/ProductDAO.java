package com.example.trip.model.product;

import java.util.List;

public interface ProductDAO {
	List<ProductDTO> list();
	List<ProductDTO> list( int start, int end, String keyword);
	ProductDTO detail(int code);
	void update(ProductDTO dto);
	void delete(int code);
	void insert(ProductDTO dto);
	String file_info(int code);
	int count(String keyword);
}

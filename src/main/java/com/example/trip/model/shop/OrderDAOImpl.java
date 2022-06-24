package com.example.trip.model.shop;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.trip.model.product.ProductDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public ProductDTO orderPage(int code) { //상품 정보
		return sqlSession.selectOne("order.orderPage", code);
	}

	@Override
	public void insert(OrderDTO dto) { //추가
		sqlSession.update("order.insert", dto);
	}

}

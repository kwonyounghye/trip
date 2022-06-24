package com.example.trip.model.home;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.trip.model.product.ProductDTO;

@Repository
public class HomeDAOImpl implements HomeDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ProductDTO> list() {
		return sqlSession.selectList("home.list");
	}

}

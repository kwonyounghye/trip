package com.example.trip.model.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Inject
	SqlSession sqlSession;
	

	@Override
	public ProductDTO detail(int code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.detail", code);
	}

	@Override
	public void update(ProductDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("product.update", dto);
	}

	@Override
	public void delete(int code) {
		sqlSession.delete("product.delete", code);
		// TODO Auto-generated method stub

	}

	@Override
	public void insert(ProductDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("product.insert", dto);

	}

	@Override
	public String file_info(int code) {
		return sqlSession.selectOne("product.file_info", code);
	}

	@Override
	public List<ProductDTO> list( int start, int end, String keyword ) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("start", start-1);
		map.put("end", end);
		System.out.println(map);
		return sqlSession.selectList("product.list", map);
	}


	@Override
	public int count(String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.count", keyword);
	}

	@Override
	public List<ProductDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.list");
	}

}

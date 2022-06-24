package com.example.trip.model.mypage;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.trip.model.product.ProductDTO;

@Repository
public class MypageDAOImpl implements MypageDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public List<MypageDTO> order_list(String id) {// 회원 아이디 (member(id))
		return sqlSession.selectList("mypage.order_list", id);
	}

	@Override
	public MypageDTO order_detail(int order_id) {//주문 번호
		return sqlSession.selectOne("mypage.order_detail", order_id);
	}
	
	@Override
	public List<ProductDTO> myProduct_list(String writer) {
		return sqlSession.selectList("mypage.myProduct_list", writer);
	}

	@Override
	public int order_count(int id, Date order_date) { //주문 개수
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("order_date", order_date);
		return sqlSession.selectOne("mypage.order_count",map);
	}

}

package com.example.trip.model.shop;

import java.util.List;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class WishDAOImpl implements WishDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<WishDTO> wish_money() {
		return sqlSession.selectList("wish.wish_money"); //품목별 금액
	}

	@Override
	public void insert(WishDTO dto) {
		sqlSession.insert("wish.insert", dto); //장바구니 추가
	}

	@Override
	public List<WishDTO> list(String id) {
		return sqlSession.selectList("wish.list", id); //목록
	}

	@Override
	public void delete(int wish_id) {
		sqlSession.delete("wish.delete", wish_id); //개별삭제
	}

	@Override
	public void delete_all(String id) {
		sqlSession.delete("wish.delete_all", id); //장바구니 비우기
	}

	@Override
	public int sum_money(String id) {
		return sqlSession.selectOne("wish.sum_money", id); //합계금액
	}

	@Override
	public void modify(WishDTO dto) {
		sqlSession.update("wish.modify", dto); //수량 변경
	}
}

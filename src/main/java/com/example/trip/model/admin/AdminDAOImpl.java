package com.example.trip.model.admin;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{
	@Inject
	SqlSession sqlSession;

	@Override
	public String login(AdminDTO dto) {
		return sqlSession.selectOne("admin.login", dto);
	}

	@Override
	public List<AdminDTO> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(AdminDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public AdminDTO detail(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(AdminDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean check_passwd(String id, String pw) {
		// TODO Auto-generated method stub
		return false;
	}
}

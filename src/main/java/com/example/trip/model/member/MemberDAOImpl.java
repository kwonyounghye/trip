package com.example.trip.model.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MemberDTO> list() {
		return sqlSession.selectList("member.list");
	}

	@Override
	public void insert(MemberDTO dto) {
		sqlSession.insert("member.insert", dto);
	}

	@Override
	public MemberDTO detail(String id) {
		return sqlSession.selectOne("member.detail", id);
	}

	@Override
	public void delete(String id) {
		sqlSession.delete("member.delete", id);
	}

	@Override
	public void update(MemberDTO dto) {
		sqlSession.update("member.update", dto);
	}

	@Override
	public boolean check_pw(String id, String pw) {
		boolean result=false;
		Map<String,Object> map=new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		int count=sqlSession.selectOne("member.check_pw", map);
		if(count==1) result=true;
		return false;
	}

	@Override
	public String login(MemberDTO dto) {
		return sqlSession.selectOne("member.login", dto);
	}

}

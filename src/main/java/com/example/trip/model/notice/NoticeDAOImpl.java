package com.example.trip.model.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<NoticeDTO> list(int start, int end, String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start-1); // mySql에서 limit 사용할때 1이 아니라 0 부터 시작
		map.put("end", end); // mySql에서는 사용하지 않지만 셋팅해둠
		return sqlSession.selectList("notice.list", map);
	}
	
	@Override
	public NoticeDTO detail(int idx) {
		return sqlSession.selectOne("notice.detail", idx);
	}

	@Override
	public void insert(NoticeDTO dto) {
		sqlSession.insert("notice.insert", dto);
	}

	@Override
	public void update(NoticeDTO dto) {
		sqlSession.update("notice.update", dto);
		
	}

	@Override
	public void delete(int idx) {
		sqlSession.delete("notice.delete", idx);
	}
	
	@Override
	public int count(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("notice.count", map);
	}

	@Override
	public void increase_hit(int idx) {
		sqlSession.update("notice.increase_hit",idx);
	}

	@Override
	public String file_info(int idx) {
		return sqlSession.selectOne("notice.file_info", idx);
	}

}

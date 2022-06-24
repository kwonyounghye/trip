package com.example.trip.model.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> list(int start, int end, String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start-1); // mySql에서 limit 사용할때 1이 아니라 0 부터 시작
		map.put("end", end); // mySql에서는 사용하지 않지만 셋팅해둠
		return sqlSession.selectList("board.list", map);
	}

	@Override
	public BoardDTO detail(int board_idx) {
		return sqlSession.selectOne("board.detail", board_idx);
	}
	
	@Override
	public void insert(BoardDTO dto) {
		sqlSession.insert("board.insert", dto);
	}

	@Override
	public void update(BoardDTO dto) {
		sqlSession.update("board.update", dto);
	}

	@Override
	public void delete(int board_idx) {
		sqlSession.delete("board.delete", board_idx);
	}
	
	@Override
	public int count(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("board.count", map);
	}

	@Override
	public void increase_hit(int board_idx) {
		sqlSession.update("board.increase_hit", board_idx);
	}

}

package com.example.trip.model.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public List<ReplyDTO> list(int board_idx, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start-1); // mySql에서 limit 사용할때 1이 아니라 0 부터 시작
		map.put("end", end); // mySql에서는 사용하지 않지만 셋팅해둠
		map.put("board_idx", board_idx);
		List<ReplyDTO> items = sqlSession.selectList("reply.list", map);
		return items;
	}

	@Override
	public ReplyDTO detail(int reply_idx) {
		return sqlSession.selectOne("reply.detail",reply_idx);
	}
	
	@Override
	public void insert(ReplyDTO dto) {
		sqlSession.insert("reply.insert", dto);
	}

	@Override
	public void update(ReplyDTO dto) {
		System.out.println("replydto:" + dto);
		sqlSession.update("reply.update", dto);		
	}

	@Override
	public void delete(int reply_idx) {
		sqlSession.delete("reply.delete", reply_idx);
	}

	@Override
	public int count(int board_idx) {
		return sqlSession.selectOne("reply.count", board_idx);
	}

}

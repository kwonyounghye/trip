package com.example.trip.model.board;

import java.util.List;

public interface ReplyDAO {
	List<ReplyDTO> list(int board_idx, int start, int end);
	int count(int board_idx);
	void insert(ReplyDTO dto);
	void update(ReplyDTO dto);
	void delete(int reply_idx);
	ReplyDTO detail(int reply_idx);
}

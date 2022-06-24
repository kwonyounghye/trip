package com.example.trip.model.board;

import java.util.List;

public interface BoardDAO {
	List<BoardDTO> list(int start, int end, String search_option, String keyword);
	
	BoardDTO detail(int board_idx);
	
	void insert(BoardDTO dto);
	
	void update (BoardDTO dto);
	
	void delete (int idx);
	
	int count(String search_option, String keyword);
	
	void increase_hit(int board_idx);
	
}

package com.example.trip.model.notice;

import java.util.List;

public interface NoticeDAO {
	List<NoticeDTO> list(int start, int end, String search_option, String keyword);
	
	NoticeDTO detail(int idx);
	
	int count(String search_option, String keyword);
	
	void increase_hit(int idx);

	void insert(NoticeDTO dto);
	
	void update (NoticeDTO dto);
	
	void delete (int idx);
	
	String file_info(int idx);
	
}

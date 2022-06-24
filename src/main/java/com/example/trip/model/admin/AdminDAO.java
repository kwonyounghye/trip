package com.example.trip.model.admin;

import java.util.List;

public interface AdminDAO {
	String login(AdminDTO dto);
	
	List<AdminDTO> list();
	void insert(AdminDTO dto);
	AdminDTO detail(String id);
	void delete(String id);
	void update(AdminDTO dto);
	boolean check_passwd(String id, String pw);
}

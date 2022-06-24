package com.example.trip.model.member;

import java.util.List;

public interface MemberDAO {
	String login(MemberDTO dto);
	List<MemberDTO> list();
	void insert(MemberDTO dto);
	MemberDTO detail(String id);
	void delete(String id);
	void update(MemberDTO dto);
	boolean check_pw(String id, String pw);
}

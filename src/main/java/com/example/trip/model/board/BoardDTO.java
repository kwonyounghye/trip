package com.example.trip.model.board;

import java.util.Date;

public class BoardDTO {
	
	private int board_idx;
	private String title;
	private String writer; //id
	private String contents;
	private Date regdate;
	private int hit;
	private String name; //writer 이름
	private int cnt; //댓글 갯수
	
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "BoardDTO [board_idx=" + board_idx + ", title=" + title + ", writer=" + writer + ", contents=" + contents
				+ ", regdate=" + regdate + ", hit=" + hit + ", name=" + name + ", cnt=" + cnt + "]";
	}
}

package com.example.trip.model.board;

import java.util.Date;

public class ReplyDTO {
	private int reply_idx;
	private String reply_text;
	private String replyer;
	private Date regdate;
	private int board_idx;
	
	private String writer;
	private String name;
	
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public String getReply_text() {
		return reply_text;
	}
	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "ReplyDTO [reply_idx=" + reply_idx + ", reply_text=" + reply_text + ", replyer=" + replyer + ", regdate="
				+ regdate + ", board_idx=" + board_idx + ", writer=" + writer + ", name=" + name + "]";
	}

}

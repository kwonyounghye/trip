package com.example.trip.model.notice;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDTO {
	private int idx;
	private String title;
	private String contents;
	private Date regdate;
	private int hit;
	private String filename;
	private MultipartFile file1;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	@Override
	public String toString() {
		return "NoticeDTO [idx=" + idx + ", title=" + title + ", contents=" + contents + ", regdate=" + regdate
				+ ", hit=" + hit + ", filename=" + filename + ", file1=" + file1 + "]";
	}
		
}

package com.example.trip.model.admin;

public class AdminDTO {
	private String id;
	private String pw;
	private String name;
	private String position;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	@Override
	public String toString() {
		return "AdminDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", position=" + position + "]";
	}
	
	
	
}

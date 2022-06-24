package com.example.trip.model.shop;

public class WishDTO {
	
	private int wish_id; //위시리스트 일련번호
	private String id; //사용자 아이디
	private String name; //사용자 이름
	private int code; //상품 코드
	private String title; //여행 제목
	private int price; //여행 가격
	private int money; //가격
	private int amount; //인원수
	
	public int getWish_id() {
		return wish_id;
	}
	public void setWish_id(int wish_id) {
		this.wish_id = wish_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "WishDTO [wish_id=" + wish_id + ", id=" + id + ", name=" + name + ", code=" + code + ", title=" + title
				+ ", price=" + price + ", money=" + money + ", amount=" + amount + "]";
	}
}

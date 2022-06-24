package com.example.trip.model.shop;

public class OrderDTO {

	private int order_id; //주문 일련번호
	private String id; //사용자 아이디
	private int wish_id;
	private String name; //사용자 이름
	private int code; //상품코드
	private String title; //여행 제목
	private int price; //여행 가격
	private int amount; //총 인원수
	private String address; //주소
	private String phone; //전화번호
	private int pay; //결제 방법
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getWish_id() {
		return wish_id;
	}
	public void setWish_id(int wish_id) {
		this.wish_id = wish_id;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	@Override
	public String toString() {
		return "OrderDTO [order_id=" + order_id + ", id=" + id + ", wish_id=" + wish_id + ", name=" + name + ", code="
				+ code + ", title=" + title + ", price=" + price + ", amount=" + amount + ", address=" + address
				+ ", phone=" + phone + ", pay=" + pay + "]";
	}

}

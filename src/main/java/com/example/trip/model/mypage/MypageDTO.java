package com.example.trip.model.mypage;

import java.sql.Date;

public class MypageDTO {
	//orderList 정보
	private int order_id; //주문 일련번호 
	private String id ; //회원 아이디 
	private int code; //상품코드 
	private String name; //예약자 성함
	private String address; //주소 
	private String phone; //핸트폰 번호 
	private int amount; //총인원 
	private Date order_date; //주문 날짜
	private int pay; //결제 방법 
	
	//product 정보
	private String title; //상품명 
	private String description; //상품설명
	private int price; //가격
	private String starttime; //여행 시작 시간
	private String endtime; //여행 끝 시간
	private String date; //여행 날짜
	private String area; //여행 지역
	private String filename; //파일 이름
	private String writer; //상품 작성자 id
	private String writer_name; //상품 작성자 이름
	
	private int money; //총금액 (amount*price)

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

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriter_name() {
		return writer_name;
	}

	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	@Override
	public String toString() {
		return "MypageDTO [order_id=" + order_id + ", id=" + id + ", code=" + code + ", name=" + name + ", address="
				+ address + ", phone=" + phone + ", amount=" + amount + ", order_date=" + order_date + ", pay=" + pay
				+ ", title=" + title + ", description=" + description + ", price=" + price + ", starttime=" + starttime
				+ ", endtime=" + endtime + ", date=" + date + ", area=" + area + ", filename=" + filename + ", writer="
				+ writer + ", writer_name=" + writer_name + ", money=" + money + "]";
	}

}

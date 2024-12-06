package com.jybmaker.dto;

public class studentDto {

	private int hakbun;  //학번
	private String name; //이름
	private int grade;   //학년
	private String address;  //주소
	
	public studentDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public studentDto(int hakbun, String name, int grade, String address) {
		super();
		this.hakbun = hakbun;
		this.name = name;
		this.grade = grade;
		this.address = address;
	}

	public int getHakbun() {
		return hakbun;
	}

	public void setHakbun(int hakbun) {
		this.hakbun = hakbun;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
	
	
}

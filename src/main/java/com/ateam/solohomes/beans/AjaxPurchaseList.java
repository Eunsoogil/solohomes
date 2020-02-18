package com.ateam.solohomes.beans;

import java.util.ArrayList;

public class AjaxPurchaseList {
	int count; // 데이터 개수
	String status; // 처리 결과
	ArrayList<PaymentDTO> list; // 데이터
	
	
	public AjaxPurchaseList() {
		
	}


	public AjaxPurchaseList(int count, String status, ArrayList<PaymentDTO> list) {
		super();
		this.count = count;
		this.status = status;
		this.list = list;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public ArrayList<PaymentDTO> getList() {
		return list;
	}


	public void setList(ArrayList<PaymentDTO> list) {
		this.list = list;
	}
	
	
}

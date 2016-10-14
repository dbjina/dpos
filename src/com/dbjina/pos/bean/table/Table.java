package com.dbjina.pos.bean.table;

public class Table {
	private int table_seq;
	private int table_hold_customer_amount;
	private String table_name;
	
	public int getTable_seq() {
		return table_seq;
	}
	public void setTable_seq(int table_seq) {
		this.table_seq = table_seq;
	}
	public int getTable_hold_customer_amount() {
		return table_hold_customer_amount;
	}
	public void setTable_hold_customer_amount(int table_hold_customer_amount) {
		this.table_hold_customer_amount = table_hold_customer_amount;
	}
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
}

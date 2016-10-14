package com.dbjina.pos.bean.order;


import com.dbjina.pos.bean.menu.JoinedMenu;
import com.google.gson.annotations.SerializedName;

public class Order {
	
	/*@SerializedName("table_seq")
	private int table_seq;
	
	@SerializedName("table_hold_customer_amount")
	private int table_hold_customer_amount;
	
	@SerializedName("table_name")
	private String table_name;*/
	
	@SerializedName("menu_order_seq")
	private int order_seq;
	
	@SerializedName("menu_order_quantity")
	private int order_quantity;
	
	@SerializedName("menu")
	private JoinedMenu menu;
	
	/*public int getTable_seq() {
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
	}*/
	public int getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	public JoinedMenu getMenu() {
		return menu;
	}
	public void setMenu(JoinedMenu menu) {
		this.menu = menu;
	}
}

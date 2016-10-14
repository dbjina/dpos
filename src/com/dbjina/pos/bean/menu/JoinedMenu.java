package com.dbjina.pos.bean.menu;

import com.google.gson.annotations.SerializedName;

public class JoinedMenu {
	@SerializedName("menu_seq")
	private int menu_seq;
	@SerializedName("menu_name")
	private String menu_name;
	@SerializedName("menu_description")
	private String menu_description;
	@SerializedName("menu_recipe")
	private String menu_recipe;
	@SerializedName("menu_type_seq")
	private int menu_type_seq;
	@SerializedName("menu_type")
	private String menu_type;
	@SerializedName("menu_price_seq")
	private int menu_price_seq;
	@SerializedName("menu_price")
	private float menu_price;
	@SerializedName("menu_size_seq")
	private int menu_size_seq;
	@SerializedName("menu_size")
	private String menu_size;
	@SerializedName("menu_price_group_seq")
	private int menu_price_group_seq;
	@SerializedName("menu_price_group_name")
	private String menu_price_group_name;
	
	public int getMenu_price_seq() {
		return menu_price_seq;
	}
	public void setMenu_price_seq(int menu_price_seq) {
		this.menu_price_seq = menu_price_seq;
	}
	public float getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(float menu_price) {
		this.menu_price = menu_price;
	}
	public int getMenu_size_seq() {
		return menu_size_seq;
	}
	public void setMenu_size_seq(int menu_size_seq) {
		this.menu_size_seq = menu_size_seq;
	}
	public String getMenu_size() {
		return menu_size;
	}
	public void setMenu_size(String menu_size) {
		this.menu_size = menu_size;
	}
	public int getMenu_price_group_seq() {
		return menu_price_group_seq;
	}
	public void setMenu_price_group_seq(int menu_price_group_seq) {
		this.menu_price_group_seq = menu_price_group_seq;
	}
	public String getMenu_price_group_name() {
		return menu_price_group_name;
	}
	public void setMenu_price_group_name(String menu_price_group_name) {
		this.menu_price_group_name = menu_price_group_name;
	}
	public int getMenu_seq() {
		return menu_seq;
	}
	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_description() {
		return menu_description;
	}
	public void setMenu_description(String menu_description) {
		this.menu_description = menu_description;
	}
	public String getMenu_recipe() {
		return menu_recipe;
	}
	public void setMenu_recipe(String menu_recipe) {
		this.menu_recipe = menu_recipe;
	}
	public int getMenu_type_seq() {
		return menu_type_seq;
	}
	public void setMenu_type_seq(int menu_type_seq) {
		this.menu_type_seq = menu_type_seq;
	}
	public String getMenu_type() {
		return menu_type;
	}
	public void setMenu_type(String menu_type) {
		this.menu_type = menu_type;
	}
	
	
}

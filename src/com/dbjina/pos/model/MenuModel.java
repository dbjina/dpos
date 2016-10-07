package com.dbjina.pos.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.menu.JoinedMenu;
import com.dbjina.pos.bean.menu.Menu;
import com.dbjina.pos.dao.MenuDAO;

public class MenuModel {
	private HttpServletRequest req = null;
	private MenuDAO dao = null; 
	 
	public MenuModel(HttpServletRequest req) {
		this.req = req;
		dao = new MenuDAO(req);
	}
	
	public List<Menu> findAll() {
		return dao.findAll();
	}
	
	public List<JoinedMenu> findAllByJoinTable() {
		return dao.findAllByJoinTable();
	}
}

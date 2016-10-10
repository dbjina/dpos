package com.dbjina.pos.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.Supplier;
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
	
	public List<JoinedMenu> findJoinedMenuByMenuSeq() {
		String value = req.getParameter("menu_seq");
		
		JoinedMenu menu = new JoinedMenu();
		menu.setMenu_seq(Integer.parseInt(value));

		return dao.findJoinedMenuByMenuSeq(menu);
	}
	
	public int[] deleteFoodByMenuSeq() {
		String[] values = req.getParameterValues("menu_seq");
		List<JoinedMenu> list = new ArrayList<>();
		JoinedMenu menu = null;
		for(String value : values) {
			menu = new JoinedMenu();
			menu.setMenu_seq(Integer.parseInt(value));

			list.add(menu);
		}
		return dao.deleteFoodByMenuSeq(list);
	}
	
	public int[] deleteFoodByMenuPriceSeq() {
		String[] values = req.getParameterValues("menu_price_seq");
		List<JoinedMenu> list = new ArrayList<>();
		JoinedMenu menu = null;
		for(String value : values) {
			menu = new JoinedMenu();
			menu.setMenu_price_seq(Integer.parseInt(value));

			list.add(menu);
		}
		return dao.deleteFoodByMenuPriceSeq(list);
	}
}

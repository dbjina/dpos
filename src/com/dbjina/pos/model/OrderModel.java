package com.dbjina.pos.model;


import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.order.Order;
import com.dbjina.pos.dao.OrderDAO;
import com.dbjina.pos.util.Common;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class OrderModel {
	private HttpServletRequest req = null;
	private OrderDAO dao = null; 
	 
	public OrderModel(HttpServletRequest req) {
		this.req = req;
		dao = new OrderDAO(req);
	}
	
	/*public List<Menu> findAll() {
		return dao.findAll();
	}*/
	
	public int[] saveOrder() {
		List<Order> list = new ArrayList<>();
		dao = new OrderDAO(req);
		
		Gson gson = new Gson();
		 
		Type type = new TypeToken<Collection<Order>>(){}.getType();
		Collection<Order> collection = gson.fromJson(req.getParameter("order"), type);
		
		Iterator<Order> e = collection.iterator();
		while(e.hasNext()) {
			list.add(e.next());
		}
		
		return dao.saveOrder(list);
	}
}

package com.dbjina.pos.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.Supplier;
import com.dbjina.pos.dao.SupplierDAO;

public class SupplierModel {
	private HttpServletRequest req = null;
	private SupplierDAO supDAO = null; 
	 
	public SupplierModel(HttpServletRequest req) {
		this.req = req;
		supDAO = new SupplierDAO(req);
	}
	
	public List<Supplier> findAll() {
		return supDAO.findAll();
	}
	
}

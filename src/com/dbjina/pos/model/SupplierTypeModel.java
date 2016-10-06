package com.dbjina.pos.model;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.SupplierType;
import com.dbjina.pos.dao.SupplierTypeDAO;


public class SupplierTypeModel {
	private HttpServletRequest req;
	private SupplierTypeDAO supTypeDAO;
	private Connection con;
	
	public SupplierTypeModel(HttpServletRequest req) {
		this.req = req;
		supTypeDAO = new SupplierTypeDAO(req);
	}
	
	public SupplierTypeModel(Connection con) {
		if(con != null) {
			this.con = con;
			supTypeDAO = new SupplierTypeDAO(this.con);
		}
	}
	
	public List<SupplierType> findAll() {
		return supTypeDAO.findAll();
	}
	
}

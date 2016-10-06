package com.dbjina.pos.model;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.SupplierTypeTag;
import com.dbjina.pos.dao.SupplierTypeTagDAO;



public class SupplierTypeTagModel {
	private HttpServletRequest req;
	private SupplierTypeTagDAO supTypeTagDAO;
	private Connection con;
	
	public SupplierTypeTagModel(HttpServletRequest req) {
		this.req = req;
		supTypeTagDAO = new SupplierTypeTagDAO(req);
	}
	
	public SupplierTypeTagModel(Connection con) {
		if(con != null) {
			this.con = con;
			supTypeTagDAO = new SupplierTypeTagDAO(this.con);
		}
	}
	
	public List<SupplierTypeTag> findAll() {
		return supTypeTagDAO.findAll();
	}
	
}

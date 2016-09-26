package com.dbjina.pos.model;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.EmployeePosition;
import com.dbjina.pos.dao.EmployeeDAO;
import com.dbjina.pos.dao.EmployeePositionDAO;

public class EmployeePositionModel {
	private HttpServletRequest req;
	private EmployeePositionDAO empPositionDAO;
	private Connection con;
	
	public EmployeePositionModel(HttpServletRequest req) {
		this.req = req;
		empPositionDAO = new EmployeePositionDAO(req);
	}
	
	public EmployeePositionModel(Connection con) {
		if(con != null) {
			this.con = con;
			empPositionDAO = new EmployeePositionDAO(this.con);
		}
	}
	
	public List<EmployeePosition> findAll() {
		List<EmployeePosition> listEmpPosition = null;
		
		listEmpPosition = empPositionDAO.findAll();
		
		return listEmpPosition;
	}
	
}

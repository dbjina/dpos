package com.dbjina.pos.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.Employee;
import com.dbjina.pos.dao.EmployeeDAO;

public class EmployeeModel {
	private HttpServletRequest req;
	private EmployeeDAO empDAO;
	
	public EmployeeModel(HttpServletRequest req) {
		this.req = req;
		empDAO = new EmployeeDAO(req);
	}
	
	public List<Employee> findAll() {
		return empDAO.findAll();
	}
}

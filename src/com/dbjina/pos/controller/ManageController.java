package com.dbjina.pos.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbjina.pos.bean.Employee;
import com.dbjina.pos.dao.EmployeeDAO;
import com.dbjina.pos.model.EmployeeModel;

public class ManageController extends HttpServlet {
	EmployeeModel empModel;
	RequestDispatcher rd;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rootPath = req.getContextPath();
		String servletPath = req.getServletPath();
		
		if(servletPath.equals("/Manage/EmpManage.do")) {
			empModel = new EmployeeModel(req);
			List<Employee> listEmp = empModel.findAll();
			
			if(listEmp != null) {
				req.setAttribute("listEmp", listEmp);
			}
			
			rd = req.getRequestDispatcher("/empManage.jsp");
			rd.forward(req, resp);
		}
		else if(servletPath.equals("/Manage/SalesManage.do")) {
			empModel = new EmployeeModel(req);
			
			rd = req.getRequestDispatcher("/salesManage.jsp");
			rd.forward(req, resp);
			
		}
		else {
			System.out.println("매칭 없음");
		}
	}
}

package com.dbjina.pos.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbjina.pos.bean.Employee;
import com.dbjina.pos.bean.Supplier;
import com.dbjina.pos.dao.EmployeeDAO;
import com.dbjina.pos.model.EmployeeModel;
import com.dbjina.pos.model.SupplierModel;

public class ManageController extends HttpServlet {
	private EmployeeModel empModel;
	private SupplierModel supModel;
	private RequestDispatcher rd;
	private PrintWriter out;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rootPath = req.getContextPath();
		String servletPath = req.getServletPath();
		empModel = new EmployeeModel(req);
		
		/*out = resp.getWriter();*/
		
		resp.setCharacterEncoding("UTF-8");
		
		if(servletPath.equals("/Manage/EmpManage.do")) {
			
			List<Employee> listEmp = empModel.findAll();
			
			if(listEmp != null) {
				req.setAttribute("listEmp", listEmp);
			}
			
			rd = req.getRequestDispatcher("/empManage.jsp");
			rd.forward(req, resp);
		}
		else if(servletPath.equals("/Manage/EmpManage/DeleteEmp.do")) {
			int result = empModel.deleteEmpBySeq();
			
			resp.sendRedirect(rootPath + "/Manage/EmpManage.do");
		}
		else if(servletPath.equals("/Manage/EmpManage/ModifyFormEmp.do")) {
			List<Employee> listEmp = empModel.findEmployeeBySeq();
			
			req.setAttribute("listEmp", listEmp);
			
			rd = req.getRequestDispatcher("/empModifyForm.jsp");
			rd.forward(req, resp);
		}
		else if(servletPath.equals("/Manage/EmpManage/ModifyEmp.do")) {
			empModel.updateEmployeeBySeq();
			
			resp.sendRedirect(rootPath + "/Manage/EmpManage.do");
		}
		else if(servletPath.equals("/Manage/SalesManage.do")) {
			rd = req.getRequestDispatcher("/salesManage.jsp");
			rd.forward(req, resp);
			
		}
		else if(servletPath.equals("/Manage/FoodManage.do")) {
			
			rd = req.getRequestDispatcher("/foodManage.jsp");
			rd.forward(req, resp);
		}
		else if(servletPath.equals("/Manage/SupManage.do")) {
			supModel = new SupplierModel(req);
			List<Supplier> listSup = supModel.findAll();
			
			req.setAttribute("listSup", listSup);
			
			rd = req.getRequestDispatcher("/supManage.jsp");
			rd.forward(req, resp);
		}
		else {
			System.out.println("매칭 없음, " + this.getClass());
		}
	}
}

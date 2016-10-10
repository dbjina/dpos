package com.dbjina.pos.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbjina.pos.bean.Employee;
import com.dbjina.pos.bean.Supplier;
import com.dbjina.pos.bean.menu.JoinedMenu;
import com.dbjina.pos.bean.menu.Menu;
import com.dbjina.pos.dao.EmployeeDAO;
import com.dbjina.pos.listener.CommonContextListener;
import com.dbjina.pos.model.EmployeeModel;
import com.dbjina.pos.model.MenuModel;
import com.dbjina.pos.model.SupplierModel;

public class UtilController extends HttpServlet {
	private MenuModel menuModel;
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
		
		out = resp.getWriter();
		resp.setCharacterEncoding("UTF-8");
		
		if(servletPath.equals("/Util/SayNum.do")) {
/*			menuModel = new MenuModel(req);
			List<JoinedMenu> list = menuModel.findJoinedMenuByMenuSeq();
			StringBuffer result = new StringBuffer();
			
			result.append("{");
			result.append("'menu_price' : '" + joinedMenu.getMenu_price() + "'");
			result.append("}");*/
			
			
		}
		
		
		
		
	}
}

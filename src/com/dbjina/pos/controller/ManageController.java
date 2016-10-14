package com.dbjina.pos.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbjina.pos.bean.Employee;
import com.dbjina.pos.bean.Supplier;
import com.dbjina.pos.bean.menu.JoinedMenu;
import com.dbjina.pos.bean.order.Order;
import com.dbjina.pos.model.EmployeeModel;
import com.dbjina.pos.model.MenuModel;
import com.dbjina.pos.model.OrderModel;
import com.dbjina.pos.model.SupplierModel;
import com.dbjina.pos.model.TableModel;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;


public class ManageController extends HttpServlet {
	private EmployeeModel empModel;
	private SupplierModel supModel;
	private MenuModel menuModel;
	private TableModel tableModel;
	private OrderModel orderModel;
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
		
		resp.setCharacterEncoding("UTF-8");
		out = resp.getWriter();
		
		
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
			menuModel = new MenuModel(req);
			tableModel = new TableModel(req);
			
			req.setAttribute("listMenu", menuModel.findAllByJoinTable());
			req.setAttribute("listTable", tableModel.findAll());
			
			rd = req.getRequestDispatcher("/salesManage.jsp");
			rd.forward(req, resp);
		}
		else if(servletPath.equals("/Manage/SalesManage/SendOrder.do")) {
			orderModel = new OrderModel(req);			
			int[] result = orderModel.saveOrder();
			
			out.println(result);
		}
		else if(servletPath.equals("/Manage/FoodManage.do")) {
			menuModel = new MenuModel(req);
			List<JoinedMenu> listMenu = menuModel.findAllByJoinTable();
			
			req.setAttribute("listMenu", listMenu);
			
			rd = req.getRequestDispatcher("/foodManage.jsp");
			rd.forward(req, resp);
		}
		else if(servletPath.equals("/Manage/FoodManage/DeleteFood.do")) {
			menuModel = new MenuModel(req);
			
			int[] result = menuModel.deleteFoodByMenuSeq();
			
			resp.sendRedirect(rootPath + "/Manage/FoodManage.do");
		}
		else if(servletPath.equals("/Manage/FoodManage/DeleteFoodPrice.do")) {
			menuModel = new MenuModel(req);
			
			int[] result = menuModel.deleteFoodByMenuPriceSeq();
			
			resp.sendRedirect(rootPath + "/Manage/FoodManage.do");
		}
		else if(servletPath.equals("/Manage/SupManage.do")) {
			supModel = new SupplierModel(req);
			List<Supplier> listSup = supModel.findAll();
			
			req.setAttribute("listSup", listSup);
			
			rd = req.getRequestDispatcher("/supManage.jsp");
			rd.forward(req, resp);
		}
		else if(servletPath.equals("/Manage/SupManage/DeleteSup.do")) {
			supModel = new SupplierModel(req);
			int[] result = supModel.deleteSupBySeq();
			
			resp.sendRedirect(rootPath + "/Manage/SupManage.do");
		}
		else if(servletPath.equals("/Manage/SupManage/ModifySup.do")) {
			supModel = new SupplierModel(req);
			int[] result = supModel.updateSupBySeq();
			
			resp.sendRedirect(rootPath + "/Manage/SupManage.do");
		}
		else {
			System.out.println("매칭 없음, " + this.getClass());
		}
	}
}

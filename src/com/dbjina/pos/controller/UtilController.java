package com.dbjina.pos.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UtilController extends HttpServlet {
//	private MenuModel menuModel;
//	private RequestDispatcher rd;
//	private PrintWriter out;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1730350753000992181L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String rootPath = req.getContextPath();
		String servletPath = req.getServletPath();
		
//		out = resp.getWriter();
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

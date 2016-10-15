package com.dbjina.pos.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbjina.pos.bean.Employee;
import com.dbjina.pos.model.SignModel;

public class SignController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1779281467482224915L;
	private SignModel signModel;
	private PrintWriter out;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rootPath = req.getContextPath();
		String servletPath = req.getServletPath();

		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");	// TODO 필터를 이용해서 UTF-8 세팅 할것
		HttpSession session = req.getSession(false);
		signModel = new SignModel(req);
		
		if (servletPath.equals("/Sign/SignUp.do")) {
			boolean result = signModel.addEmployee();

			if (result == true) {
				resp.sendRedirect(rootPath);
			} else {
				/*
				 * RequestDispatcher rd = req.getRequestDispatcher(rootPath);
				 * req.setAttribute("alertMsg", "회원 가입에 실패하였습니다.");
				 * rd.forward(req, resp);
				 */
			}
		}
		else if (servletPath.equals("/Sign/CheckValidSignUp.do")) {
			out = resp.getWriter();

			// Email check
			if (req.getParameter("emp_email") != null) {
				Employee emp = signModel.findEmployeeEmailByEmail();
				if (emp != null && emp.getEmp_email() != null) {
					String json = "{ \"emp_email_message\" : \"<span class='glyphicon glyphicon-remove text-danger' aria-hidden='true'></span>\", ";
					json += "\"message\" : \"The email is already exist\" }";
					out.print(json);
					// out.print("<span class='glyphicon glyphicon-remove
					// text-danger' aria-hidden='true'></span>");
				} else {
					String json = "{ \"emp_email_message\" : \"<span class='glyphicon glyphicon-ok text-success' aria-hidden='true'></span>\", ";
					json += "\"message\" : \"\" }";
					out.print(json);
				}
			}
		} 
		else if(servletPath.equals("/Sign/SignIn.do")) {
			Employee emp = signModel.findEmployeeByIdAndPassword();

			if(emp != null) {
				session = req.getSession(false);
				session.setAttribute("emp", emp);
				RequestDispatcher rd = req.getRequestDispatcher("/mainPOS.jsp");
				rd.forward(req, resp);
			}
			else {
				System.out.println("로그인 실패");
			}
		}
		else {
			System.out.println("매칭 없음");
		}
	}
}

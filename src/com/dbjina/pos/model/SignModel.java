package com.dbjina.pos.model;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.Employee;
import com.dbjina.pos.dao.SignDAO;
import com.dbjina.pos.util.Common;

public class SignModel {
	private HttpServletRequest req;
	private SignDAO signDAO;
	
	public SignModel(HttpServletRequest req) {
		this.req = req;
		signDAO = new SignDAO(req);
	}
	
	public boolean addEmployee() {
		boolean result = false;
		
		// TODO 유효성 검사
		/* 이메일 유효성 검사
		 * 이름 유효성 검사(숫자나 특수문자(.만 허용) 제외하기)
		 * 핸드폰 유효성 검사(호주 번호 체계를 따름)
		 * ID 유효성 검사(최대 4자리의 숫자만 허용)
		 * 비밀번호 유효성 검사(최소 6자리 최대 18자리)
		 */
		
		Employee emp = new Employee();
		Common.setDTO(req, emp);
		
		int intResult = signDAO.addEmployee(emp);
		
		if(intResult > 0) {
			result = true;
		}
		
		return result;
	}
	
	public Employee findEmployeeEmailByEmail() {
		Employee emp = null;
		
		emp = signDAO.findEmployeeEmailByEmail(req.getParameter("emp_email"));
		
		return emp;
	}
	
	public Employee findEmployeeByIdAndPassword() {
		Employee emp = new Employee();
		
		// TODO : 유효성 검사
		/*
		 * ID 유효성 검사
		 * PASSWORD 유효성 검사
		 */
		/*emp.setEmployeeDTO(req);*/
		Common.setDTO(req, emp);
		
		emp = signDAO.findEmployeeByIdAndPassword(emp);
		
		return emp;
	}
}

package com.dbjina.pos.model;

import java.util.ArrayList;
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
	
	public List<Employee> findEmployeeBySeq() {
		String[] values = req.getParameterValues("emp_seqs");
		List<Employee> listEmp = new ArrayList<>();
		Employee emp = null;
		for(String value : values) {
			emp = new Employee();
			emp.setEmp_seq(Integer.parseInt(value));

			listEmp.add(emp);
		}
		return empDAO.findEmployeeBySeq(listEmp);
	}
	
	public int deleteEmpBySeq() {
		String[] values = req.getParameterValues("emp_seqs");
		List<Employee> listEmp = new ArrayList<>();
		Employee emp = null;
		for(String value : values) {
			emp = new Employee();
			emp.setEmp_seq(Integer.parseInt(value));

			listEmp.add(emp);
		}
		return empDAO.deleteEmpBySeq(listEmp);
	}
	
	public void updateEmployeeBySeq() {
		String[] emp_seqs = req.getParameterValues("emp_seq");
		String[] emp_ids = req.getParameterValues("emp_id");
		String[] emp_names = req.getParameterValues("emp_name");
		String[] emp_mobiles = req.getParameterValues("emp_mobile");
		String[] emp_emails = req.getParameterValues("emp_email");
		String[] emp_position_seqs = req.getParameterValues("emp_position_seq");
		String[] emp_memos = req.getParameterValues("emp_memo");
		
		String[] original_emp_seqs = req.getParameterValues("original_emp_seq");
		int[] ori_emp_seqs = new int[original_emp_seqs.length];
		int [] emp_position_seqs_converted = new int[emp_position_seqs.length];
		
		for(int i=0; i<original_emp_seqs.length; i++) {
			ori_emp_seqs[i] = Integer.parseInt(original_emp_seqs[i]);
		}
		for(int i=0; i<original_emp_seqs.length; i++) {
			emp_position_seqs_converted[i] = Integer.parseInt(emp_position_seqs[i]);
		}
		
		List<Employee> empList = new ArrayList<>();
		Employee emp = null;
		for(int i=0; i<emp_seqs.length; i++) {
			emp = new Employee();
			emp.setEmp_seq(Integer.parseInt(emp_seqs[i]));
			emp.setEmp_id(Integer.parseInt(emp_ids[i]));
			emp.setEmp_name(emp_names[i]);
			emp.setEmp_mobile(emp_mobiles[i]);
			emp.setEmp_email(emp_emails[i]);
			emp.setEmp_position_seq(emp_position_seqs_converted[i]);
			emp.setEmp_memo(emp_memos[i]);
			
			empList.add(emp);
		}
		
		empDAO.updateEmployeeBySeq(empList, ori_emp_seqs);
	}
}

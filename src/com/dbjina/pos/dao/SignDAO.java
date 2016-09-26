package com.dbjina.pos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.Employee;
import com.dbjina.pos.define.DBTableDefine;

public class SignDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private HttpServletRequest req = null;
	private String sql = null;
	
	public SignDAO(HttpServletRequest req) {
		this.req = req;
		if (con == null) {
			con = (Connection) req.getServletContext().getAttribute("con");
		}
	}
	
	// Save one employee
	public int addEmployee(Employee emp) {
		int result = 0;
		sql = String.format(DBTableDefine.INSERT_TEMPLATE, DBTableDefine.EMPLOYEE_TABLE, DBTableDefine.ADD_EMPLOYEE_COLUMNS, "?, ?, ?, ?, ?, ?, ?");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, emp.getEmp_id());
			pstmt.setString(2, emp.getEmp_name());
			pstmt.setString(3, emp.getEmp_mobile());
			pstmt.setString(4, emp.getEmp_email());
			pstmt.setInt(5, emp.getEmp_position_seq());
			pstmt.setString(6, emp.getEmp_memo());
			pstmt.setString(7, emp.getEmp_password());
			
			result = pstmt.executeUpdate();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			destory();
		}
		
		return result;
	}
	
	// Find one employee by email
	public Employee findEmployeeEmailByEmail(String emp_email) {
		sql = String.format(DBTableDefine.SELECT_TEMPLATE, DBTableDefine.EMP_EMAIL_COLUMN, DBTableDefine.EMPLOYEE_TABLE);
		sql = String.format(DBTableDefine.WHERE_AND_TEMPLATE, sql, DBTableDefine.EMP_EMAIL_COLUMN, "?");
		Employee emp = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, emp_email);
			
			rs = pstmt.executeQuery();
			emp = new Employee();
			while(rs.next()) {
				emp.setEmp_email(rs.getString(DBTableDefine.EMP_EMAIL_COLUMN));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			destory();
		}
		
		return emp;
	}
	
	public Employee findEmployeeByIdAndPassword(Employee emp) {
		sql = String.format(DBTableDefine.SELECT_TEMPLATE, DBTableDefine.ALL_EMPLOYEE_COLUMNS, DBTableDefine.EMPLOYEE_TABLE);
		sql = String.format(DBTableDefine.WHERE_AND_TEMPLATE, sql, DBTableDefine.EMP_ID_COLUMN, "?");
		sql = String.format(DBTableDefine.WHERE_AND_TEMPLATE, sql, DBTableDefine.EMP_PASSWORD_COLUMN, "?");
		Employee employee = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, emp.getEmp_id());
			pstmt.setString(2, emp.getEmp_password());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				employee = new Employee();
				employee.setEmp_id(rs.getInt("emp_id"));
				employee.setEmp_name(rs.getString("emp_name"));
				employee.setEmp_position_seq(rs.getInt("emp_position_seq"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			destory();
		}
		
		return employee;
	}
	
	private void destory() {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (Exception e) {
		}
	}
	
}

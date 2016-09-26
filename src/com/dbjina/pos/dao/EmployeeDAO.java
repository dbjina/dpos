package com.dbjina.pos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.Employee;
import com.dbjina.pos.define.DBTableDefine;

public class EmployeeDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private HttpServletRequest req = null;
	private String sql = null;
	
	public EmployeeDAO(HttpServletRequest req) {
		this.req = req;
		if (con == null) {
			con = (Connection) req.getServletContext().getAttribute("con");
		}
	}
	
	public List<Employee> findAll() {
		List<Employee> listEmp = new ArrayList<>();
		
		sql = String.format(DBTableDefine.SELECT_TEMPLATE, DBTableDefine.ALL_EMPLOYEE_COLUMNS, DBTableDefine.EMPLOYEE_TABLE);
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			Employee emp;
			while(rs.next()) {
				emp = new Employee();
				emp.setEmp_seq(rs.getInt(DBTableDefine.EMP_SEQ_COLUMN));
				emp.setEmp_id(rs.getInt(DBTableDefine.EMP_ID_COLUMN));
				emp.setEmp_name(rs.getString(DBTableDefine.EMP_NAME_COLUMN));
				emp.setEmp_mobile(rs.getString(DBTableDefine.EMP_MOBILE_COLUMN));
				emp.setEmp_email(rs.getString(DBTableDefine.EMP_EMAIL_COLUMN));
				emp.setEmp_position_seq(rs.getInt(DBTableDefine.EMP_POSITION_SEQ_COLUMN));
				emp.setEmp_memo(rs.getString(DBTableDefine.EMP_MEMO_COLUMN));
				
				listEmp.add(emp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			destory();
		}
		
		return listEmp;
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

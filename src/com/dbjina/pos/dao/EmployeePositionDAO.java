package com.dbjina.pos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.EmployeePosition;
import com.dbjina.pos.define.DBTableDefine;

public class EmployeePositionDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private HttpServletRequest req = null;
	private String sql = null;
	
	public EmployeePositionDAO(HttpServletRequest req) {
		this.req = req;
		if (con == null) {
			con = (Connection) req.getServletContext().getAttribute("con");
		}
	}
	
	public EmployeePositionDAO(Connection con) {
		if (this.con == null) {
			this.con = con;
		}
	}
	
	public List<EmployeePosition> findAll() {
		List<EmployeePosition> list = new ArrayList<>();
		
		sql = String.format(DBTableDefine.SELECT_TEMPLATE, DBTableDefine.ALL_EMPLOYEE_POSITION_COLUMNS, DBTableDefine.EMPLOYEE_POSITION_TABLE);
		
		EmployeePosition empPosition = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				empPosition = new EmployeePosition();
				empPosition.setEmp_position_seq(rs.getInt("emp_position_seq"));
				empPosition.setEmp_position(rs.getString("emp_position"));
				list.add(empPosition);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			destory();
		}
		
		return list;
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

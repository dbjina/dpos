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
	@SuppressWarnings("unused")
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
	
	public List<Employee> findEmployeeBySeq(List<Employee> employees) {
		List<Employee> listEmp = new ArrayList<>();
		
		sql = String.format(DBTableDefine.SELECT_TEMPLATE, DBTableDefine.ALL_EMPLOYEE_COLUMNS, DBTableDefine.EMPLOYEE_TABLE);
		sql = String.format(DBTableDefine.WHERE_AND_TEMPLATE, sql, DBTableDefine.EMP_SEQ_COLUMN, "?");
		
		if(employees.size() > 1) {
			for(int i=0; i<employees.size()-1; i++) {
				sql = String.format(DBTableDefine.WHERE_OR_TEMPLATE, sql, DBTableDefine.EMP_SEQ_COLUMN, "?");
			}
		}
		try {
			pstmt = con.prepareStatement(sql);
			
			for(int i=0; i<employees.size(); i++) {
				pstmt.setInt(i+1, employees.get(i).getEmp_seq());
			}
			
			rs = pstmt.executeQuery();
			Employee emp = null;
			
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
	
	public int deleteEmpBySeq(List<Employee> employees) {
		int result = 0;
		sql = "DELETE FROM employee WHERE emp_seq = ?";
		
		if(employees.size() > 1) {
			for(int i=0; i<employees.size()-1; i++) {
				sql += " OR emp_seq = ?";
			}
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			for(int i=0; i<employees.size(); i++) {
				pstmt.setInt(i+1, employees.get(i).getEmp_seq());
			}
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			destory();
		}
		
		return result;
	}
	
	public void updateEmployeeBySeq(List<Employee> employees, int[] original_emp_seq) {
		
		/*sql = "INSERT INTO employee (emp_seq, emp_id) "
				+ "VALUES (?,?) %1$s "
				+ "ON DUPLICATE KEY UPDATE emp_seq=VALUES(emp_seq), emp_id=VALUES(emp_id)";*/
		sql = "UPDATE " + DBTableDefine.EMPLOYEE_TABLE + " SET "
				+ DBTableDefine.EMP_SEQ_COLUMN + " = ?, "
				+ DBTableDefine.EMP_ID_COLUMN + " = ?, "
				+ DBTableDefine.EMP_NAME_COLUMN + " = ?, "
				+ DBTableDefine.EMP_MOBILE_COLUMN + " = ?, "
				+ DBTableDefine.EMP_EMAIL_COLUMN + " = ?, "
				+ DBTableDefine.EMP_POSITION_SEQ_COLUMN + " = ?, "
				+ DBTableDefine.EMP_MEMO_COLUMN + " = ? "
				+ "WHERE " + DBTableDefine.EMP_SEQ_COLUMN + " = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			for(int i=0; i<employees.size(); i++) {
				pstmt.setInt(1, employees.get(i).getEmp_seq());
				pstmt.setInt(2, employees.get(i).getEmp_id());
				pstmt.setString(3, employees.get(i).getEmp_name());
				pstmt.setString(4, employees.get(i).getEmp_mobile());
				pstmt.setString(5,  employees.get(i).getEmp_email());
				pstmt.setInt(6, employees.get(i).getEmp_position_seq());
				pstmt.setString(7, employees.get(i).getEmp_memo());
				pstmt.setInt(8, original_emp_seq[i]);
				pstmt.addBatch();
			}
			System.out.println(this.getClass());
			int[] result = pstmt.executeBatch();
			for(int r : result) {
				System.out.println(r);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			destory();
		}
		
		/*return result;*/
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

package com.dbjina.pos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.Supplier;
import com.dbjina.pos.define.DBTableDefine;

public class SupplierDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private HttpServletRequest req = null;
	private String sql = null;
	
	public SupplierDAO(HttpServletRequest req) {
		this.req = req;
		if (con == null) {
			con = (Connection) req.getServletContext().getAttribute("con");
		}
	}
	
	public List<Supplier> findAll() {
		List<Supplier> listSup = new ArrayList<>();
		
		sql = String.format(DBTableDefine.SELECT_TEMPLATE, DBTableDefine.ALL_SUPPLIER_COLUMNS, DBTableDefine.SUPPLIER_TABLE);

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			Supplier sup = null;
			while(rs.next()) {
				sup = new Supplier();
				
				sup.setSup_seq(rs.getInt(DBTableDefine.SUP_SEQ));
				sup.setSup_name(rs.getString(DBTableDefine.SUP_NAME));
				sup.setSup_contact_number(rs.getString(DBTableDefine.SUP_CONTACT_NUMBER));
				sup.setSup_website(rs.getString(DBTableDefine.SUP_WEBSITE));
				sup.setSup_email(rs.getString(DBTableDefine.SUP_EMAIL));
				sup.setSup_memo(rs.getString(DBTableDefine.SUP_MEMO));
				
				listSup.add(sup);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			destory();
		}
		
		return listSup;
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

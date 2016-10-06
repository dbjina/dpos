package com.dbjina.pos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.SupplierType;
import com.dbjina.pos.define.DBTableDefine;

public class SupplierTypeDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private HttpServletRequest req = null;
	private String sql = null;
	
	public SupplierTypeDAO(HttpServletRequest req) {
		this.req = req;
		if (con == null) {
			con = (Connection) req.getServletContext().getAttribute("con");
		}
	}
	
	public SupplierTypeDAO(Connection con) {
		if (this.con == null) {
			this.con = con;
		}
	}
	
	public List<SupplierType> findAll() {
		List<SupplierType> listSupType = new ArrayList<>();
		
		sql = String.format(DBTableDefine.SELECT_TEMPLATE, DBTableDefine.ALL_SUPPLIER_TYPE_COLUMNS, DBTableDefine.SUPPLIER_TYPE_TABLE);
		
		SupplierType supType = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				supType = new SupplierType();
				supType.setSup_type_seq(rs.getInt(DBTableDefine.SUP_TYPE_SEQ_COLUMN));
				supType.setSup_type(rs.getString(DBTableDefine.SUP_TYPE_COLUMN));

				listSupType.add(supType);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			destory();
		}
		
		return listSupType;
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

package com.dbjina.pos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.SupplierTypeTag;
import com.dbjina.pos.define.DBTableDefine;

public class SupplierTypeTagDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private HttpServletRequest req = null;
	private String sql = null;
	
	public SupplierTypeTagDAO(HttpServletRequest req) {
		this.req = req;
		if (con == null) {
			con = (Connection) req.getServletContext().getAttribute("con");
		}
	}
	
	public SupplierTypeTagDAO(Connection con) {
		if (this.con == null) {
			this.con = con;
		}
	}
	
	public List<SupplierTypeTag> findAll() {
		List<SupplierTypeTag> listSupTypeTag = new ArrayList<>();
		
		sql = String.format(DBTableDefine.SELECT_TEMPLATE, DBTableDefine.ALL_SUPPLIER_TYPE_TAG_COLUMNS, DBTableDefine.SUPPLIER_TYPE_TAG_TABLE);
		
		SupplierTypeTag supTypeTag = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				supTypeTag = new SupplierTypeTag();
				supTypeTag.setSup_seq(rs.getInt(DBTableDefine.SUP_SEQ_COLUMN));
				supTypeTag.setSup_type_seq(rs.getInt(DBTableDefine.SUP_TYPE_SEQ_COLUMN));

				listSupTypeTag.add(supTypeTag);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			destory();
		}
		
		return listSupTypeTag;
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

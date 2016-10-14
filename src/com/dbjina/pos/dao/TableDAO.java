package com.dbjina.pos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.table.Table;
import com.dbjina.pos.define.DBTableDefine;

public class TableDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private HttpServletRequest req = null;
	private String sql = null;
	
	public TableDAO(HttpServletRequest req) {
		this.req = req;
		if (con == null) {
			con = (Connection) req.getServletContext().getAttribute("con");
		}
	}
	
	public TableDAO(Connection con) {
		if (this.con == null) {
			this.con = con;
		}
	}
	
	public List<Table> findAll() {
		List<Table> list = new ArrayList<>();
		
		sql = String.format(DBTableDefine.SELECT_TEMPLATE, DBTableDefine.ALL_TABLE_COLUMNS, DBTableDefine.TABLE_TABLE);
		
		Table table = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				table = new Table();
				table.setTable_seq(rs.getInt(DBTableDefine.TABLE_SEQ_COLUMN));
				table.setTable_hold_customer_amount(rs.getInt(DBTableDefine.TABLE_HOLD_CUSTOMER_AMOUNT_COLUMN));
				table.setTable_name(rs.getString(DBTableDefine.TABLE_NAME_COLUMN));

				list.add(table);
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

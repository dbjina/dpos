package com.dbjina.pos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.menu.Menu;
import com.dbjina.pos.bean.order.Order;
import com.dbjina.pos.define.DBTableDefine;

public class OrderDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private HttpServletRequest req = null;
	private String sql = null;

	public OrderDAO(HttpServletRequest req) {
		this.req = req;
		if (con == null) {
			con = (Connection) req.getServletContext().getAttribute("con");
		}
	}

	/*public List<Order> findAll() {
		List<Order> list = new ArrayList<>();

		sql = String.format(DBTableDefine.SELECT_TEMPLATE, DBTableDefine.ALL_MENU_COLUMNS,
				DBTableDefine.MENU_TABLE);

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			Order order = null;
			while (rs.next()) {
				order = new Order();
				order
				order.
				order.
				order.
				order.
				
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			destory();
		}

		return list;
	}*/
	
	public int[] saveOrder(List<Order> order) {
		int[] result = null;
		
		sql = String.format(DBTableDefine.INSERT_TEMPLATE, DBTableDefine.ORDER_TABLE, DBTableDefine.ALL_ORDER_COLUMNS_EXCEPT_ORDER_DATE_COLUMN, "?, ?, ?, ?");
		try {
			pstmt = con.prepareStatement(sql);
			
			for(Order o : order) {
				pstmt.setInt(1, o.getMenu().getMenu_price_seq());
				pstmt.setInt(2, 1);	// TODO emp_seq 로 바꿔줄것
				pstmt.setInt(3, o.getTable_seq());
				pstmt.setInt(4, o.getOrder_quantity());
				
				pstmt.addBatch();
			}
			
			result = pstmt.executeBatch();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			destory();
		}
		
		return result;
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

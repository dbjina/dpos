package com.dbjina.pos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.menu.JoinedMenu;
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
		
		sql = String.format(DBTableDefine.INSERT_TEMPLATE, DBTableDefine.ORDER_TABLE, DBTableDefine.ALL_ORDER_COLUMNS_EXCEPT_ORDER_DATE_COLUMN, "?, ?, ?, ?, ?");
		try {
			pstmt = con.prepareStatement(sql);
			
			for(Order o : order) {
				pstmt.setInt(1, o.getOrder_group_seq());	// 값이 0일 경우 디비에 등록된 Trigger가 처리함
				pstmt.setInt(2, o.getMenu().getMenu_price_seq());
				pstmt.setInt(3, 1);	// TODO emp_seq 로 바꿔줄것
				pstmt.setInt(4, o.getTable_seq());
				pstmt.setInt(5, o.getOrder_quantity());
				
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
	
	// TODO 작업중 10.17 5:18 PM
	public int[] moveOrder(List<Order> order) {
		int[] result = null;
		sql = String.format(DBTableDefine.INSERT_TEMPLATE, DBTableDefine.ORDER_TABLE, DBTableDefine.ALL_ORDER_COLUMNS_EXCEPT_ORDER_DATE_COLUMN, "?, ?, ?, ?");
		try {
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
			for(Order o : order) {
				pstmt.setInt(1, o.getMenu().getMenu_price_seq());
				pstmt.setInt(2, 1);	// TODO emp_seq 로 바꿔줄것
				pstmt.setInt(3, o.getTable_seq());
				pstmt.setInt(4, o.getOrder_quantity());
				
				pstmt.addBatch();
			}
			
			result = pstmt.executeBatch();
			
			con.commit();
		} catch (SQLException e) {
			if(con != null) {
				try {
					con.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			e.printStackTrace();
			
		} finally {
			try {
				con.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			destory();
		}
		
		
		return result;
	}
	
	public List<Order> findOrderByTableSeq(int table_seq) {
		List<Order> list = new ArrayList<>();
		
		sql = String.format(DBTableDefine.SELECT_TEMPLATE, DBTableDefine.ALL_ORDER_VIEW_COLUMNS,
				DBTableDefine.ORDER_VIEW);
		
		sql = String.format(DBTableDefine.WHERE_AND_TEMPLATE, sql, DBTableDefine.TABLE_SEQ_COLUMN, "?");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, table_seq);
			
			rs = pstmt.executeQuery();
			Order order = null;
			JoinedMenu joinedMenu = null;
			while (rs.next()) {
				order = new Order();
				joinedMenu = new JoinedMenu();
				
				order.setOrder_seq(rs.getInt("order_seq"));
				order.setOrder_quantity(rs.getInt("order_quantity"));
				order.setTable_seq(rs.getInt("table_seq"));
				
				joinedMenu.setMenu_seq(rs.getInt("menu_seq"));
				joinedMenu.setMenu_description(rs.getString("menu_description"));
				joinedMenu.setMenu_name(rs.getString("menu_name"));
				joinedMenu.setMenu_price(rs.getFloat("menu_price"));
				joinedMenu.setMenu_price_group_seq(rs.getInt("menu_price_group_seq"));
				joinedMenu.setMenu_price_group_name(rs.getString("menu_price_group_name"));
				joinedMenu.setMenu_price_seq(rs.getInt("menu_price_seq"));
				joinedMenu.setMenu_recipe(rs.getString("menu_recipe"));
				joinedMenu.setMenu_size(rs.getString("menu_size"));
				joinedMenu.setMenu_size_seq(rs.getInt("menu_size_seq"));
				joinedMenu.setMenu_type(rs.getString("menu_type"));
				joinedMenu.setMenu_type_seq(rs.getInt("menu_type_seq"));
				order.setMenu(joinedMenu);
				
				list.add(order);
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

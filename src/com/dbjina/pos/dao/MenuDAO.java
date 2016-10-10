package com.dbjina.pos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.Supplier;
import com.dbjina.pos.bean.menu.JoinedMenu;
import com.dbjina.pos.bean.menu.Menu;
import com.dbjina.pos.define.DBTableDefine;

public class MenuDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private HttpServletRequest req = null;
	private String sql = null;

	public MenuDAO(HttpServletRequest req) {
		this.req = req;
		if (con == null) {
			con = (Connection) req.getServletContext().getAttribute("con");
		}
	}

	public List<Menu> findAll() {
		List<Menu> list = new ArrayList<>();

		sql = String.format(DBTableDefine.SELECT_TEMPLATE, DBTableDefine.ALL_MENU_COLUMNS,
				DBTableDefine.MENU_TABLE);

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			Menu menu = null;
			while (rs.next()) {
				menu = new Menu();
				menu.setMenu_seq(rs.getInt(DBTableDefine.MENU_SEQ_COLUMN));
				menu.setMenu_name(rs.getString(DBTableDefine.MENU_NAME_COLUMN));
				menu.setMenu_description(rs.getString(DBTableDefine.MENU_DESCRIPTION_COLUMN));
				menu.setMenu_recipe(rs.getString(DBTableDefine.MENU_RECIPE_COLUMN));
				menu.setMenu_type_seq(rs.getInt(DBTableDefine.MENU_TYPE_SEQ_COLUMN));
				
				list.add(menu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			destory();
		}

		return list;
	}
	
	public List<JoinedMenu> findAllByJoinTable() {
		List<JoinedMenu> list = new ArrayList<>();

		sql = String.format(DBTableDefine.SELECT_TEMPLATE, DBTableDefine.ALL_JOINED_MENU_COLUMNS,
				DBTableDefine.MENU_ALL_VIEW);

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			JoinedMenu menu = null;
			while (rs.next()) {
				menu = new JoinedMenu();
				menu.setMenu_seq(rs.getInt(DBTableDefine.MENU_SEQ_COLUMN));
				menu.setMenu_name(rs.getString(DBTableDefine.MENU_NAME_COLUMN));
				menu.setMenu_description(rs.getString(DBTableDefine.MENU_DESCRIPTION_COLUMN));
				menu.setMenu_recipe(rs.getString(DBTableDefine.MENU_RECIPE_COLUMN));
				menu.setMenu_type_seq(rs.getInt(DBTableDefine.MENU_TYPE_SEQ_COLUMN));
				menu.setMenu_type(rs.getString(DBTableDefine.MENU_TYPE_COLUMN));
				menu.setMenu_price_seq(rs.getInt(DBTableDefine.MENU_PRICE_SEQ_COLUMN));
				menu.setMenu_price(rs.getFloat(DBTableDefine.MENU_PRICE_COLUMN));
				menu.setMenu_size_seq(rs.getInt(DBTableDefine.MENU_SIZE_SEQ_COLUMN));
				menu.setMenu_size(rs.getString(DBTableDefine.MENU_SIZE_COLUMN));
				menu.setMenu_price_group_seq(rs.getInt(DBTableDefine.MENU_PRICE_GROUP_SEQ_COLUMN));
				menu.setMenu_price_group_name(rs.getString(DBTableDefine.MENU_PRICE_GROUP_NAME_COLUMN));
				
				list.add(menu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			destory();
		}

		return list;
	}
	
	public List<JoinedMenu> findJoinedMenuByMenuSeq(JoinedMenu menu) {
		List<JoinedMenu> mu = null;
		
		/*sql = String.format(DBTableDefine.SELECT_TEMPLATE, DBTableDefine.ALL_JOINED_MENU_COLUMNS,
				DBTableDefine.ALL_JOINED_MENU_TABLE);
		sql = String.format(DBTableDefine.WHERE_AND_TEMPLATE, sql, "m." + DBTableDefine.MENU_SEQ_COLUMN, "?");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, menu.getMenu_seq());
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				mu = new JoinedMenu();
				mu.setMenu_seq(rs.getInt(DBTableDefine.MENU_SEQ_COLUMN));
				mu.setMenu_name(rs.getString(DBTableDefine.MENU_NAME_COLUMN));
				mu.setMenu_description(rs.getString(DBTableDefine.MENU_DESCRIPTION_COLUMN));
				mu.setMenu_recipe(rs.getString(DBTableDefine.MENU_RECIPE_COLUMN));
				mu.setMenu_type_seq(rs.getInt(DBTableDefine.MENU_TYPE_SEQ_COLUMN));
				mu.setMenu_type(rs.getString(DBTableDefine.MENU_TYPE_COLUMN));
				mu.setMenu_price_seq(rs.getInt(DBTableDefine.MENU_PRICE_SEQ_COLUMN));
				mu.setMenu_price(rs.getFloat(DBTableDefine.MENU_PRICE_COLUMN));
				mu.setMenu_size_seq(rs.getInt(DBTableDefine.MENU_SIZE_SEQ_COLUMN));
				mu.setMenu_size(rs.getString(DBTableDefine.MENU_SIZE_COLUMN));
				mu.setMenu_price_group_seq(rs.getInt(DBTableDefine.MENU_PRICE_GROUP_SEQ_COLUMN));
				mu.setMenu_price_group_name(DBTableDefine.MENU_PRICE_GROUP_NAME_COLUMN);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			destory();
		}*/
		
		return mu;
	}
	
	
	public int[] deleteFoodByMenuSeq(List<JoinedMenu> list) {
		int[] result = null;
		sql = String.format(DBTableDefine.DELETE_TEMPLATE, DBTableDefine.MENU_TABLE, DBTableDefine.MENU_SEQ_COLUMN, "?");

		try {
			pstmt = con.prepareStatement(sql);

			for (int i = 0; i < list.size(); i++) {
				pstmt.setInt(1, list.get(i).getMenu_seq());
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
	
	public int[] deleteFoodByMenuPriceSeq(List<JoinedMenu> list) {
		int[] result = null;
		sql = String.format(DBTableDefine.DELETE_TEMPLATE, DBTableDefine.MENU_PRICE_TABLE, DBTableDefine.MENU_PRICE_SEQ_COLUMN, "?");

		try {
			pstmt = con.prepareStatement(sql);

			for (int i = 0; i < list.size(); i++) {
				pstmt.setInt(1, list.get(i).getMenu_price_seq());
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

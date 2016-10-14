package com.dbjina.pos.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.table.Table;
import com.dbjina.pos.dao.TableDAO;

public class TableModel {
	private HttpServletRequest req;
	private TableDAO tableDAO;
	
	public TableModel(HttpServletRequest req) {
		this.req = req;
		tableDAO = new TableDAO(req);
	}
	
	public List<Table> findAll() {
		return tableDAO.findAll();
	}
}

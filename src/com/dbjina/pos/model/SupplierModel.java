package com.dbjina.pos.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dbjina.pos.bean.Supplier;
import com.dbjina.pos.dao.SupplierDAO;

public class SupplierModel {
	private HttpServletRequest req = null;
	private SupplierDAO supDAO = null; 
	 
	public SupplierModel(HttpServletRequest req) {
		this.req = req;
		supDAO = new SupplierDAO(req);
	}
	
	public List<Supplier> findAll() {
		return supDAO.findAll();
	}
	
	public int deleteSupBySeq() {
		String[] values = req.getParameterValues("sup_seqs");
		List<Supplier> listSup = new ArrayList<>();
		Supplier sup = null;
		for(String value : values) {
			sup = new Supplier();
			sup.setSup_seq(Integer.parseInt(value));

			listSup.add(sup);
		}
		return supDAO.deleteSupBySeq(listSup);
	}
	
}

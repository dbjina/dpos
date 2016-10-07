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
	
	public int[] deleteSupBySeq() {
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
	
	public int[] updateSupBySeq() {
		String[] sup_seqs = req.getParameterValues("sup_seq");
		String[] sup_names = req.getParameterValues("sup_name");
		String[] sup_contact_numbers = req.getParameterValues("sup_contact_number");
		String[] sup_websites = req.getParameterValues("sup_website");
		String[] sup_emails = req.getParameterValues("sup_email");
		String[] sup_memos = req.getParameterValues("sup_memo");
		
		List<Supplier> listSup = new ArrayList<>();
		Supplier sup = null;
		for(int i=0; i<sup_seqs.length; i++) {
			sup = new Supplier();
			
			sup.setSup_seq(Integer.parseInt(sup_seqs[i]));
			sup.setSup_name(sup_names[i]);
			sup.setSup_contact_number(sup_contact_numbers[i]);
			sup.setSup_website(sup_websites[i]);
			sup.setSup_memo(sup_memos[i]);

			listSup.add(sup);
		}
		return supDAO.updateSupBySeq(listSup);
	}
	
}

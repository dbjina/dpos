package com.dbjina.pos.listener;

import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.startup.Tomcat;

import com.dbjina.pos.bean.EmployeePosition;
import com.dbjina.pos.bean.SupplierType;
import com.dbjina.pos.bean.SupplierTypeTag;
import com.dbjina.pos.model.EmployeePositionModel;
import com.dbjina.pos.model.SupplierTypeModel;
import com.dbjina.pos.model.SupplierTypeTagModel;

public class CommonContextListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent event) {

	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		System.out.println("START :: Common Context Listener ");
		ServletContext sc = event.getServletContext();
		Connection con = (Connection)sc.getAttribute("con");
		// Root Path
		sc.setAttribute("rootPath", sc.getContextPath());
		
		// Employee Position
		List<EmployeePosition> listEmpPosition = null;
		listEmpPosition = new EmployeePositionModel(con).findAll();
		
		if(listEmpPosition != null) {
			sc.setAttribute("listEmpPosition", listEmpPosition);
		}
		else {
			System.err.println("Failed to bind the Employee Positions");
		}
		
		// Supplier Type
		List<SupplierType> listSupType = null;
		listSupType = new SupplierTypeModel(con).findAll();
		
		if(listSupType != null) {
			sc.setAttribute("listSupType", listSupType);
		}
		else {
			System.err.println("Failed to bind the Supplier Type");
		}
		
		// Supplier Type Tag
		List<SupplierTypeTag> listSupTypeTag = null;
		listSupTypeTag = new SupplierTypeTagModel(con).findAll();
		
		if(listSupTypeTag != null) {
			sc.setAttribute("listSupTypeTag", listSupTypeTag);
		}
		else {
			System.err.println("Failed to bind the Supplier Type Tag");
		}
		
		
		System.out.println("END :: Common Context Listener ");
	}
}

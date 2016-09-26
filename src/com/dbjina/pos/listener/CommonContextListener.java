package com.dbjina.pos.listener;

import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.dbjina.pos.bean.EmployeePosition;
import com.dbjina.pos.model.EmployeePositionModel;

public class CommonContextListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent event) {

	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		System.out.println("START :: Common Context Listener ");
		ServletContext sc = event.getServletContext();
		
		// Root Path
		sc.setAttribute("rootPath", sc.getContextPath());
		
		// Employee Position
		List<EmployeePosition> listEmpPosition = null;
		listEmpPosition = new EmployeePositionModel((Connection)sc.getAttribute("con")).findAll();
		
		if(listEmpPosition != null) {
			sc.setAttribute("listEmpPosition", listEmpPosition);
		}
		
		System.out.println("END :: Common Context Listener ");
	}
}

package com.dbjina.pos.listener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DbContextListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent event) {

	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		System.out.println("START :: DB Context Listener ");
		ServletContext sc = event.getServletContext();
		String url = sc.getInitParameter("URL");
		String id = sc.getInitParameter("ID");
		String password = sc.getInitParameter("PASSWORD");
		String className = sc.getInitParameter("CLASSNAME");
		Connection con = null;
		
		try {
			Class.forName(className);
			con = DriverManager.getConnection(url, id, password);
			if(con != null) {
				System.out.println("데이터베이스 연결 완료 :: " + new Date().toString());
			}
			sc.setAttribute("con", con);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		System.out.println("END :: DB Context Listener ");
	}
}

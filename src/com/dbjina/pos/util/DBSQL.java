package com.dbjina.pos.util;

public class DBSQL {
	public static String generateSQL(String type, String table, String[] columns, String... params) {
		StringBuffer sql = new StringBuffer();
		
		if(type.equalsIgnoreCase("select")) {
			/*sql.append("SELECT ");
			for(int i=0; i<columns.length; i++) {
				sql.append(columns[i]);
				if(i != (columns.length - 1)) {
					sql.append(", ");
				}
			}
			sql.append("FROM ");
			sql.append(table);
			sql.append(" WHERE 1=1 ");*/
		}
		else if(type.equalsIgnoreCase("insert")) {
			sql.append("INSERT INTO ");
			sql.append(table);
			sql.append("(");
			for(int i=0; i<columns.length; i++) {
				sql.append(columns[i]);
				if(i != (columns.length - 1)) {
					sql.append(", ");
				}
			}
			sql.append(") VALUES(");
			for(int i=0; i<params.length; i++) {
				
			}
			sql.append(")");
		}
		
		return sql.toString();
	}
}

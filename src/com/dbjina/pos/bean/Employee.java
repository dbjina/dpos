package com.dbjina.pos.bean;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;



public class Employee {
	private int emp_seq;
	private String emp_name;
	private int emp_id;
	private String emp_mobile;
	private String emp_email;
	private String emp_memo;
	private int emp_position_seq = 99;	// 초기화를 여기서 시켜주는건 안좋음. DB에서 처리하게끔 하거나 다른 방법 필요함
	private String emp_password;
	
	public String getEmp_password() {
		return emp_password;
	}
	public void setEmp_password(String emp_password) {
		this.emp_password = emp_password;
	}
	public int getEmp_seq() {
		return emp_seq;
	}
	public void setEmp_seq(int emp_seq) {
		this.emp_seq = emp_seq;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_mobile() {
		return emp_mobile;
	}
	public void setEmp_mobile(String emp_mobile) {
		this.emp_mobile = emp_mobile;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	public String getEmp_memo() {
		return emp_memo;
	}
	public void setEmp_memo(String emp_memo) {
		this.emp_memo = emp_memo;
	}
	public int getEmp_position_seq() {
		return emp_position_seq;
	}
	public void setEmp_position_seq(int emp_position_seq) {
		this.emp_position_seq = emp_position_seq;
	}
	
	public void setEmployeeDTO(HttpServletRequest request) {
	        Map<String, String[]> parameterMap = request.getParameterMap();
	        Field[] fields = this.getClass().getDeclaredFields();
	        for(Field field : fields) {
	            if(Modifier.isStatic(field.getModifiers())) {
	                continue;
	            }
	            
	            if(Modifier.isFinal(field.getModifiers())) {
	                continue;
	            }
	            
	            try {
	                field.setAccessible(true);    // If a field of class is private, the accessible must be true
	                if(parameterMap.get(field.getName()) != null) {
	                	if(field.getType() == String.class) {
		                    field.set(this, ((parameterMap.get(field.getName()) != null) ? String.valueOf(parameterMap.get(field.getName())[0]) : null ) );
	                		//field.set(this, parameterMap.get(field.getName()));
		                }
		                else {
		                	field.set(this, ((parameterMap.get(field.getName()) != null) ? Integer.valueOf(parameterMap.get(field.getName())[0]) : 0 ) );
		                	//field.set(this, Integer.parseInt(parameterMap.get(field.getName())[0]));
		                }
	                }
	            } catch (IllegalArgumentException e) {
	                e.printStackTrace();
	            } catch (IllegalAccessException e) {
	                e.printStackTrace();
	            }
	            
	        }
	    }

}

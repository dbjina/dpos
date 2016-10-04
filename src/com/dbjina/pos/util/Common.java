package com.dbjina.pos.util;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class Common {
	/**
	 * Set the value of fields of the object dynamically with the request
	 * @param request - the request which has a parameterMap that you want to set up into the fields of the object
	 * @param obj - the object whose field should be modified
	 */
	public static void setDTO(HttpServletRequest request, Object obj) {
		if(obj == null) {
			System.out.println("The object should not be null");
			return;
		}
		Map<String, String[]> parameterMap = request.getParameterMap();
		/*Field[] fields = this.getClass().getDeclaredFields();*/
		Field[] fields = obj.getClass().getDeclaredFields();
		for (Field field : fields) {
			if (Modifier.isStatic(field.getModifiers())) {
				continue;
			}

			if (Modifier.isFinal(field.getModifiers())) {
				continue;
			}

			try {
				if (parameterMap.get(field.getName()) != null) {
					field.setAccessible(true);
					if (field.getType() == String.class) {
						field.set(obj, String.valueOf(parameterMap.get(field.getName())[0]));
					} 
					else if (field.getType() == int.class) {
						field.set(obj, Integer.parseInt(parameterMap.get(field.getName())[0]));
					} 
					else {
						System.out.println("Not macthing type( " + field.getType() + " )");
					}
					field.setAccessible(false);
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
	}
}

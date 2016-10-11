<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Test</title>
		
	</head>
	<body>
		<script>
			var map = new Map();
			var map2 = new Map();
			
			var set1 = new Set();
			
			set1.add(1);
			set1.add(2);
			set1.add(1);
			
			set1.forEach(function(value) {
				  alert(value);
				});
		
		</script>
		
	</body>
</html>
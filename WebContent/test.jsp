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
		<script type="text/javascript">
			var map = new Map();
			
			alert(map.get("k1"));
			
			map.set("k1", "c1");
			map.set("k2", "c2");
			map.set("k3", "c3");
			
			alert(map.size);
			
			map.delete("k1");
			
			alert(map.size);
		</script>
	</body>
</html>
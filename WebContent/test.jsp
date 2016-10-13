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
			var arr = ["a", "b", "c"];
			
			arr.forEach(function(index, value) {
				alert(value + ", " + index);
			});
		</script>
	</body>
</html>
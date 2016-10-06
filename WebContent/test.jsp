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
		<c:forEach var="val" begin="1" end="10" varStatus="loop">
			<c:if test="${ not loop.last }">
				${ val }<br>
			</c:if>			
		</c:forEach>
	</body>
</html>
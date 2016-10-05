<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=500, initial-scale=1">
		<title>${ initParam.BRAND }</title>
		<c:import url="/include/cssLoad.jsp"></c:import>
	</head>
	<body>
		<c:import url="/include/adminNav.jsp"></c:import>

		<div class="container-fluid">
			<div class="table-supplier">
				<table class="table">
					<thead>
						<tr>
							<th>Name</th>
							<th><span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span></th>
							<th>Website</th>
							<th>Email</th>
							<th>Type</th>
							<th>Memo</th>
						</tr>	
					</thead>
					<tbody>
					
					</tbody>	
				</table>			
			</div>
		</div>
		
		<c:import url="/include/jsLoad.jsp"></c:import>
	</body>
</html>
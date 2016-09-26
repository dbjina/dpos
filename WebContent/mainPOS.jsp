<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<c:import url="/include/meta.html"></c:import>
		<title>${ initParam.BRAND }</title>
		<c:import url="/include/cssLoad.jsp"></c:import>
	</head>
	<body>
		<div class="container-fluid">
			<div class="table-responsive center-horizontal">
				<table class="table table-hover table-bordered text-center table-menu">
					<tr>
						<td><h4 class="text-info">${ emp["emp_name"] }</h4></td>
					</tr>
	  				<tr>
	  					<td><h4>판매 관리</h4></td>
	  				</tr>
	  				<tr onclick="location.href='${ rootPath }/Manage/EmpManage.do'">
	  					<td><h4>직원 관리</h4></td>
	  				</tr>
	  				<tr>
	  					<td><h4>메뉴 관리</h4></td>
	  				</tr>
	  				<tr>
	  					<td><h4>재고 관리</h4></td>
	  				</tr>
	  				<tr>
	  					<td><h4>공급처 관리</h4></td>
	  				</tr>
	  				<tr>
	  					<td><h4>통계</h4></td>
	  				</tr>
	  				<tr>
	  					<td><h4 id="time"></h4></td>
	  				</tr>
				</table>
			</div>
		</div>
		<c:import url="/include/jsLoad.jsp"></c:import>
		<script type="text/javascript">
			
			$(document).ready(function() {
				printTime();
				setInterval(printTime, 1000);	
			});
			
			// TODO 보여주는 시간을 서버 시간으로 고칠 것(처음에 한번만 서버 시간을 가져와서 셋팅)
			function printTime() {
				$("#time").html(new Date($.now('yyyy')).toLocaleTimeString());
			}
			
		</script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
	<head>
		<c:import url="/include/meta.html"></c:import>
		<title>${ initParam.BRAND }</title>
		<c:import url="/include/cssLoad.jsp"></c:import>
	</head>
	<body style="height:100%;">
		<c:import url="/include/adminNav.jsp"></c:import>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">
					<table class="table table-responsive">
						<thead>
							<tr>
								<th class="col-xs-1">Seq</th>
								<th class="col-xs-1">ID</th>
								<th class="col-xs-2">Name</th>
								<th class="col-xs-2">Mobile</th>
								<th class="col-xs-2">Email</th>
								<th class="col-xs-2">Position</th>
								<th class="col-xs-2">Memo</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="emp" items="${ listEmp }">
								<tr>
									<td>${ emp.emp_seq }</td>
									<td>${ emp.emp_id }</td>
									<td>${ emp.emp_name }</td>
									<td>${ emp.emp_mobile }</td>
									<td>${ emp.emp_email }</td>
									<td>
										<c:forEach var="empPosition" items="${ listEmpPosition }" varStatus="status">
											<c:if test="${ emp.emp_position_seq eq empPosition.emp_position_seq }">
												${ empPosition.emp_position }
												<c:set var="status.index" value="${ fn:length(listEmpPosition) }"/>
											</c:if>
										</c:forEach>
									</td>
									<td>
										<c:choose>
											<c:when test="${ emp.emp_memo.length() gt 10 }">
												${ fn:substring(emp.emp_memo, 0, 10) }...
											</c:when>
											<c:otherwise>
												${ emp.emp_memo }
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>					
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-8 center-horizontal text-center center-block function-pad">
							<button class="col-md-2 btn btn-default">Delete</button>
							<button class="col-md-2 btn btn-default">Modify</button>
							<button class="col-md-2 btn btn-default">Punch in</button>
							<button class="col-md-2 btn btn-default">Punch out</button>
							<button class="col-md-2 btn btn-default">Register</button>
				</div>
				<div class="col-xs-4" id="keyPad">
					<div class="row">
						<div class="col-xs-3">
							$
						</div>
						<div class="col-xs-3">
							1
						</div>
						<div class="col-xs-3">
							2
						</div>
						<div class="col-xs-3">
							3
						</div>
					</div>
					<div class="row">
						<div class="col-xs-3">
							$
						</div>
						<div class="col-xs-3">
							4
						</div>
						<div class="col-xs-3">
							5
						</div>
						<div class="col-xs-3">
							6
						</div>
					</div>
					<div class="row">
						<div class="col-xs-3">
							$
						</div>
						<div class="col-xs-3">
							7
						</div>
						<div class="col-xs-3">
							8
						</div>
						<div class="col-xs-3">
							9
						</div>
					</div>
					<div class="row">
						<div class="col-xs-3">
							$
						</div>
						<div class="col-xs-3">
							.
						</div>
						<div class="col-xs-3">
							0
						</div>
						<div class="col-xs-3">
							,
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/include/jsLoad.jsp"></c:import>
		<script type="text/javascript">
			function clicked(tr) {
				if($(tr).hasClass("bg-danger")) {
					$(tr).removeClass("bg-danger");
				}
				else {
					$(tr).addClass("bg-danger");
				}
			}
			$("tbody").find("tr").mouseup(function() {
				if($(this).hasClass("bg-danger")) {
					$(this).removeClass("bg-danger");
				}
				else {
					$(this).addClass("bg-danger");
				}
			});
			
			$("tbody").find("tr").mouseup(function() {
					  // Clear timeout
					  clearTimeout(pressTimer);
					  return false;
					})
					.mousedown(function(){
				  			// Set timeout
						  pressTimer = window.setTimeout(function() {
								alert($(this).find("td").find(":nth-child(2)").text()); // TODO 수정해야함 
							},500);
						  return false; 
					});
				
		</script>
	</body>
</html>
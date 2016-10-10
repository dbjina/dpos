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
			<div class="row table-list">
				<div class="col-xs-12">
					<table class="table table-responsive" id="empTable">
						<thead>
							<tr>
								<th class="col-sm-1">Seq</th>
								<th class="col-sm-1">ID</th>
								<th class="col-sm-2 ">Name</th>
								<th class="col-sm-2">Mobile</th>
								<th class="col-sm-2">Email</th>
								<th class="col-sm-2">Position</th>
								<th class="col-sm-2">Memo</th>
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
					<button class="col-md-2 btn btn-default" onclick="deleteEmp()">Delete</button>
					<button class="col-md-2 btn btn-default" onclick="modifyEmp()">Modify</button>
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
		<form action="" method="post" id="empForm">
			
		</form>
		<c:import url="/include/jsLoad.jsp"></c:import>
		<script type="text/javascript">
			$(document).ready(function() {
				if($(window).width() <= 765) {
					$("thead").find("tr").find("th:first-child").addClass("hidden-xs");
					/* $("thead").find("tr").find("th:nth-child(2)").addClass("hidden-xs"); */
					$("thead").find("tr").find("th:nth-child(4)").addClass("hidden-xs");
					$("thead").find("tr").find("th:nth-child(5)").addClass("hidden-xs");
					$("thead").find("tr").find("th:nth-child(7)").addClass("hidden-xs");
					
					$("tbody").find("tr").find("td:first-child").addClass("hidden-xs");
					/* $("tbody").find("tr").find("td:nth-child(2)").addClass("hidden-xs"); */
					$("tbody").find("tr").find("td:nth-child(4)").addClass("hidden-xs");
					$("tbody").find("tr").find("td:nth-child(5)").addClass("hidden-xs");
					$("tbody").find("tr").find("td:nth-child(7)").addClass("hidden-xs");
				}
				
				makeTableHightlightByClick($(".table-list"), "bg-danger");
				
				$("tbody").find("tr").find("td:last-child")
				.mouseup(function() {
					  // Clear timeout
					  clearTimeout(pressTimer);
					  return false;
				})
				.mousedown(function(){
				  			// Set timeout
						  pressTimer = window.setTimeout(function() {
								//alert($(this).find("td :last-child").text()); // TODO 수정해야함
								alert($(this).text())
							},500);
						  return false; 
				});
			});
			
			
			
			// Manage Employees Functions
			function deleteEmp() {
				var array_name = new Array();
				
				$("#empTable").find(".bg-danger").find("td:nth-child(3)").each(function(index) {
					array_name[index] = $(this).text();
				})
				var isContinue = confirm("Would you like to delete below employees?\n" + array_name);
				
				if(isContinue == false) {
					return;
				}
				
				$("#empTable").find(".bg-danger").find("td:first-child").each(function(index) {
					$("<input type='hidden' value='" + $(this).text() + "' />")
				     .attr("name", "emp_seqs")
				     .appendTo("#empForm");
				})
				     
				$("#empForm").attr("action", "${ rootPath }/Manage/EmpManage/DeleteEmp.do");
				$("#empForm").submit();
			}
			
			function modifyEmp() {
				var array_name = new Array();
				
				$("#empTable").find(".bg-danger").find("td:nth-child(3)").each(function(index) {
					array_name[index] = $(this).text();
				})

				var isContinue = confirm("Would you like to modify below employees?\n" + array_name);
				
				if(isContinue == false) {
					return;
				}
				
				$("#empTable").find(".bg-danger").find("td:first-child").each(function(index) {
					$("<input type='hidden' value='" + $(this).text() + "' />")
				     .attr("name", "emp_seqs")
				     .appendTo("#empForm");
				})
				
				$("#empForm").attr("action", "${ rootPath }/Manage/EmpManage/ModifyFormEmp.do");
				$("#empForm").submit();
			}
			
			
		</script>
	</body>
</html>
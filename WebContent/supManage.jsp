<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<div class="row table-list">
				<form method="post" id="supForm">
				<table class="table" id="supTable">
					<thead>
						<tr>
							<th class="hidden">Seq</th>
							<th>Name</th>
							<th><span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span></th>
							<th>Website</th>
							<th>Email</th>
							<th>Type</th>
							<th>Memo</th>
						</tr>	
					</thead>
					<tbody>
						<c:forEach var="sup" items="${ listSup }">
								<tr>
									<td class="hidden">${ sup.sup_seq }</td>
									<td>${ sup.sup_name }</td>
									<td>${ sup.sup_contact_number }</td>
									<td>${ sup.sup_website }</td>
									<td>${ sup.sup_email }</td>
									<td>
										<c:forEach var="supTypeTag" items="${ listSupTypeTag }" varStatus="i">
											<c:if test="${ supTypeTag.sup_seq eq sup.sup_seq }">
												<c:forEach var="supType" items="${ listSupType }" varStatus="j">
													<c:if test="${ supType.sup_type_seq eq supTypeTag.sup_type_seq}">
														${ supType.sup_type }
													</c:if>
												</c:forEach>
											</c:if>
											
										</c:forEach>
									</td>
									<td>
										<c:choose>
											<c:when test="${ sup.sup_memo.length() gt 10 }">
												<span class="hidden">${ sup.sup_memo }</span>
												${ fn:substring(sup.sup_memo, 0, 10) }...
											</c:when>
											<c:otherwise>
												${ sup.sup_memo }
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
						</c:forEach>
					</tbody>	
				</table>		
				</form>
			</div>
			<div class="row functions">
				<div class="swiper-container">
				    <div class="swiper-wrapper text-center">
				        <div class="swiper-slide">
				        	<button class="btn btn-default btn-lg" onclick="deleteSup()">Delete</button>
				        	<button class="btn btn-default btn-lg" id="btnModify" onclick="modifySup()">Modify</button>
				        	<button class="btn btn-default btn-lg">Register</button>
				        </div>
				    </div>
				    <!-- Add Pagination -->
				    <!-- <div class="swiper-pagination"></div> -->
				</div> <!-- End Swiper -->
			</div>
		</div>
		
		<c:import url="/include/jsLoad.jsp"></c:import>
		<script type="text/javascript">
		
			$(function() {
				
				makeTableHightlightByClick($(".table-list"), "bg-danger");
				
			});
			
			function deleteSup() {
				var array_name = new Array();
				if(array_name.length <= 0) {
					alert("Please click at least one supplier on the table");
					return;
				}
				
				$("#supTable").find(".bg-danger").find("td:nth-child(2)").each(function(index) {
					array_name[index] = $(this).text();
				});
				var isContinue = confirm("Would you like to delete below suppliers?\n" + array_name);
				
				if(isContinue == false) {
					return;
				}
				
				$("#supTable").find(".bg-danger").find("td:first-child").each(function(index) {
					$("<input type='hidden' value='" + $(this).text() + "' />")
				     .attr("name", "sup_seq")
				     .appendTo("#supForm");
				});
				
				
				     
				$("#supForm").attr("action", "${ rootPath }/Manage/SupManage/DeleteSup.do");
				$("#supForm").submit();
			}
			
			function modifySup() {
				var btnText = $("#btnModify").text();
				var array_name = new Array();
				
				$("#supTable").find(".bg-danger").find("td:nth-child(2)").each(function(index) {
					array_name[index] = $(this).text().replace(/\s+/g, " ").trim();
				});
				
				if(array_name.length <= 0) {
					alert("Please click at least one supplier on the table");
					return;
				}
				
				if(btnText.toUpperCase() == "MODIFY") {
					$("#btnModify").text("Save");
					
					var isContinue = confirm("Would you like to modify below suppliers?\n" + array_name);
					
					if(isContinue == false) {
						return;
					}
					
					var array_columns = new Array();
					array_columns.push("sup_seq");
					array_columns.push("sup_name");
					array_columns.push("sup_contact_number");
					array_columns.push("sup_website");
					array_columns.push("sup_email");
					array_columns.push("sup_type");
					array_columns.push("sup_memo");
					
					
					$("#supTable").find(".bg-danger").each(function() {
						$(this).find("td").each(function(index) {
							var idx = index;
							if(index != 5) {
								var value = $(this).text().replace(/\s+/g, " ").trim();
								$(this).text("");
								$("<input type='text' value='" + value + "' class='form-control' />")
								 .attr("name", array_columns[index])
							     .appendTo($(this));
							}
						});
					});
				}
				else {
					$("#btnModify").text("Modify");

					isContinue = confirm("Would you like to save them?");

					if(isContinue == false) {
						return;
					}
					
					$("#supForm").attr("action", "${ rootPath }/Manage/SupManage/ModifySup.do");
					$("#supForm").submit();
				}
			}
			
	    </script>
	</body>
</html>
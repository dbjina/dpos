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
			<div class="row table-supplier">
				
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
										T
									</td>
									<td>
										<c:choose>
											<c:when test="${ sup.sup_memo.length() gt 10 }">
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
					
			</div>
			<div class="row functions">
				<div class="swiper-container">
				    <div class="swiper-wrapper text-center">
				        <div class="swiper-slide">
				        	<button class="btn btn-default btn-lg" onclick="deleteSup()">Delete</button>
				        	<button class="btn btn-default btn-lg">Modify</button>
				        	<button class="btn btn-default btn-lg">Register</button>
				        </div>
				    </div>
				    <!-- Add Pagination -->
				    <!-- <div class="swiper-pagination"></div> -->
				</div> <!-- End Swiper -->
			</div>
		</div>
		<form method="post" id="supForm">
		</form>
		<c:import url="/include/jsLoad.jsp"></c:import>
		<script type="text/javascript">
		
			$(function() {
				$("tbody").find("tr").mouseup(function() {
					if($(this).hasClass("bg-danger")) {
						$(this).removeClass("bg-danger");
					}
					else {
						$(this).addClass("bg-danger");
					}
				});
				
			});
			
			function deleteSup() {
				var array_name = new Array();
				
				$("#supTable").find(".bg-danger").find("td:nth-child(1)").each(function(index) {
					array_name[index] = $(this).text();
				})
				var isContinue = confirm("Would you like to delete below suppliers?\n" + array_name);
				
				if(isContinue == false) {
					return;
				}
				
				$("#supTable").find(".bg-danger").find("td:first-child").each(function(index) {
					$("<input type='hidden' value='" + $(this).text() + "' />")
				     .attr("name", "sup_seqs")
				     .appendTo("#supForm");
				})
				     
				$("#supForm").attr("action", "${ rootPath }/Manage/SupManage/DeleteSup.do");
				$("#supForm").submit();
			}
			
	    </script>
	</body>
</html>
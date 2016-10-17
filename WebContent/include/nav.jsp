<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">${ initParam.BRAND }</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#menu">Menu</a>
                    </li>
                    <c:choose>
                    	<c:when test="${ sessionScope.emp.emp_name == null }">
                    		<li>
                        		<a class="page-scroll" href="#signup">SignUp</a>
		                    </li>
		                    <li>
		                        <a class="page-scroll" href="#signup">SignIn</a>
		                    </li>
                    	</c:when>
                    	<c:otherwise>
                    		<li>
		                        <a class="page-scroll" href="${ rootPath }/mainPOS.jsp">GO POS</a>
		                    </li>
                    	</c:otherwise>
                    </c:choose>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<nav id="adminNav" class="navbar navbar-inverse">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="${ rootPath }">${ initParam.BRAND }</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<li>
                        <a href="${ rootPath }/mainPOS.jsp">Main</a>
                    </li>
                    <li>
                        <a href="${ rootPath }/Manage/SalesManage.do">Sales</a>
                    </li>
                    <li>
                        <a href="${ rootPath }/Manage/EmpManage.do">Employee</a>
                    </li>
                    <li>
                        <a href="${ rootPath }/Manage/FoodManage.do">Food Menu</a>
                    </li>
                    <li class="disabled">
                        <a href="#">Stock</a>
                    </li>
                    <li>
                         <a href="${ rootPath }/Manage/SupManage.do">Supplier</a>
                    </li>
                    <li class="disabled">
                        <a href="#">Statistics</a>
                    </li>
                    <li>
                    	<a href="${ rootPath }/Sign/SignOut.do">Sign out</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
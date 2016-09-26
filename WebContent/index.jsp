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
	<body id="page-top">
		<c:import url="/include/nav.jsp"></c:import>
		
		<header>
	        <div class="header-content">
	            <div class="header-content-inner">
	                <h1 id="homeHeading">Cafe name</h1>
	                <hr>
	                <p>Welcome</p>
	                <a href="#about" class="btn btn-primary btn-xl page-scroll">About</a>
	            </div>
	        </div>
   		</header>
   		
   		<section class="bg-primary" id="about">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-8 col-lg-offset-2 text-center">
	                    <h2 class="section-heading">About cafe</h2>
	                    <hr class="light">
	                    <p class="text-faded">Our cafe is _______</p>
	                    <a href="#menu" class="page-scroll btn btn-default btn-xl sr-button">Check menu</a>
	                </div>
	            </div>
	        </div>
   		</section>
   		
	   	<section class="no-padding" id="menu">
	        <div class="container-fluid">
	            <div class="row no-gutter popup-gallery">
	                <div class="col-lg-4 col-sm-6">
	                    <a href="${ pageContext.servletContext.contextPath }/img/menu/fullsize/1.jpg" class="portfolio-box">
	                        <img src="${ pageContext.servletContext.contextPath }/img/menu/thumbnail/1.jpg" class="img-responsive" alt="Breakfast">
	                        <div class="portfolio-box-caption">
	                            <div class="portfolio-box-caption-content">
	                                <div class="project-category text-faded">
	                                    Category
	                                </div>
	                                <div class="project-name">
	                                    Breakfast
	                                </div>
	                            </div>
	                        </div>
	                    </a>
	                </div>
	                <div class="col-lg-4 col-sm-6">
	                    <a href="${ pageContext.servletContext.contextPath }/img/menu/fullsize/2.jpg" class="portfolio-box">
	                        <img src="${ pageContext.servletContext.contextPath }/img/menu/thumbnail/2.jpg" class="img-responsive" alt="Lunch">
	                        <div class="portfolio-box-caption">
	                            <div class="portfolio-box-caption-content">
	                                <div class="project-category text-faded">
	                                    Category
	                                </div>
	                                <div class="project-name">
	                                    Lunch
	                                </div>
	                            </div>
	                        </div>
	                    </a>
	                </div>
	                <div class="col-lg-4 col-sm-6">
	                    <a href="${ pageContext.servletContext.contextPath }/img/menu/fullsize/3.jpg" class="portfolio-box">
	                        <img src="${ pageContext.servletContext.contextPath }/img/menu/thumbnail/3.jpg" class="img-responsive" alt="Coffee">
	                        <div class="portfolio-box-caption">
	                            <div class="portfolio-box-caption-content">
	                                <div class="project-category text-faded">
	                                    Category
	                                </div>
	                                <div class="project-name">
	                                    Coffee
	                                </div>
	                            </div>
	                        </div>
	                    </a>
	                </div>
	                <div class="col-lg-4 col-sm-6">
	                    <a href="${ pageContext.servletContext.contextPath }/img/menu/fullsize/4.jpg" class="portfolio-box">
	                        <img src="${ pageContext.servletContext.contextPath }/img/menu/thumbnail/4.jpg" class="img-responsive" alt="">
	                        <div class="portfolio-box-caption">
	                            <div class="portfolio-box-caption-content">
	                                <div class="project-category text-faded">
	                                    Category
	                                </div>
	                                <div class="project-name">
	                                    Smoothie
	                                </div>
	                            </div>
	                        </div>
	                    </a>
	                </div>
	                <div class="col-lg-4 col-sm-6">
	                    <a href="${ pageContext.servletContext.contextPath }/img/menu/fullsize/5.jpg" class="portfolio-box">
	                        <img src="${ pageContext.servletContext.contextPath }/img/menu/thumbnail/5.jpg" class="img-responsive" alt="">
	                        <div class="portfolio-box-caption">
	                            <div class="portfolio-box-caption-content">
	                                <div class="project-category text-faded">
	                                    Category
	                                </div>
	                                <div class="project-name">
	                                    Sandwich
	                                </div>
	                            </div>
	                        </div>
	                    </a>
	                </div>
	                <div class="col-lg-4 col-sm-6">
	                    <a href="${ pageContext.servletContext.contextPath }/img/menu/fullsize/6.jpg" class="portfolio-box">
	                        <img src="${ pageContext.servletContext.contextPath }/img/menu/thumbnail/6.jpg" class="img-responsive" alt="">
	                        <div class="portfolio-box-caption">
	                            <div class="portfolio-box-caption-content">
	                                <div class="project-category text-faded">
	                                    Category
	                                </div>
	                                <div class="project-name">
	                                    Salad
	                                </div>
	                            </div>
	                        </div>
	                    </a>
	                </div>
	            </div>
	        </div>
	    </section>
	    
	    <section class="bg-dark" id="signup">
        <div class="container text-center">
            <div class="call-to-action">
                <h2 class="text-uppercase">Staff only</h2>
                <a href="#" class="btn btn-default btn-xl sr-button"  data-toggle="modal" data-target="#signUpModalForm">Sign Up</a>
                <a href="#" class="btn btn-default btn-xl sr-button"  data-toggle="modal" data-target="#signInModalForm">Sign in</a>
            </div>
        </div>
    	</section>
		
		<c:import url="/include/footer.jsp"></c:import>
		<c:import url="/include/signUpModalForm.jsp" charEncoding="UTF-8"></c:import>
		<c:import url="/include/signInModalForm.jsp" charEncoding="UTF-8"></c:import>
		<c:import url="/include/jsLoad.jsp"></c:import>
	</body>
</html>
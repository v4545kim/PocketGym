<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- whologin 변수는 로그인 상태를 저장하고 있는 변수입니다. -->
<c:set var="whologin" value="0" />
<c:if test="${empty sessionScope.loginfo}">
	<!-- 로그인 하지 않은 경우 -->
	<c:set var="whologin" value="0" />
</c:if>
<c:if test="${not empty sessionScope.loginfo}">
	<c:if test="${sessionScope.loginfo.id == 'admin'}">
		<!-- 관리자로 로그인한 경우 -->
		<c:set var="whologin" value="2" />
	</c:if>
	<c:if test="${sessionScope.loginfo.id != 'admin'}">
		<!-- 일반 사용자로 로그인한 경우 -->
		<c:set var="whologin" value="1" />
	</c:if>
</c:if>

<% String contextPath = request.getContextPath() ;%>
<c:set var="contextPath" value="<%=contextPath%>" scope="application"/> 

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Gutim Template">
    <meta name="keywords" content="Gutim, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PocketGym</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/style.css" type="text/css">
</head>
<body>
	<c:if test="${not empty requestScope.message}">
		<div class="alert alert-danger alert-dismissable">
    		<a href="#" id="myalert" class="close" data-dismiss="alert" aria-label="close">닫기</a>
    		<strong>${requestScope.message}</strong>
		</div>
	</c:if>
	
	<c:if test="${not empty sessionScope.message}">
		<div class="alert alert-danger alert-dismissable">
    		<a href="#" id="myalert" class="close" data-dismiss="alert" aria-label="close">닫기</a>
    		<strong>${sessionScope.message}</strong>
		</div>
		<% session.removeAttribute("message"); %>
		<c:remove var="message" scope="session"/>
	</c:if>
	
	<c:if test="${not empty sessionScope.message}">
		<script type="text/javascript">
			/* alert('${sessionScope.message}') ;	 */ 
		</script>
		<% session.removeAttribute("message") ; %>
	</c:if>	  

	<script src="<%=contextPath%>/resources/js/jquery-3.3.1.min.js"></script>
    <script src="<%=contextPath%>/resources/js/bootstrap.min.js"></script>
    <script src="<%=contextPath%>/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="<%=contextPath%>/resources/js/mixitup.min.js"></script>
    <script src="<%=contextPath%>/resources/js/jquery.slicknav.js"></script>
    <script src="<%=contextPath%>/resources/js/masonry.pkgd.min.js"></script>
    <script src="<%=contextPath%>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=contextPath%>/resources/js/main.js"></script>
</body>
</html>
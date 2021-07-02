<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>exercise update</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>
	<jsp:include page="./../header.jsp"/>
		<section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/breadcrumb/classes-breadcrumb.jpg">
		 <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2><i class="fa fa-shopping-basket"></i>운동 수정하기</h2>
                    </div>
                </div>
            </div>
        </div>
	</section>
	<div class="container">
		<br><br>
		<c:set var="xx" value="<%=request.getContextPath()%>"></c:set>
		<form:form action="${xx}/update.ex" method="post" modelAttribute="bean">
			<div class="form-group">
				<label for="ex_id">아이디:</label> 
				<form:input type="text"
					class="form-control" placeholder="Enter id" path="ex_id" value="${bean.ex_id}" disabled="true"/>
				<form:input type="hidden"
					class="form-control" placeholder="Enter id" path="ex_id" value="${bean.ex_id}"/>
			</div>
			<div class="form-group">
				<label for="ex_name">이름:</label> 
				<form:input type="text"
					class="form-control" placeholder="Enter name" path="ex_name" value="${bean.ex_name }"/>
			</div>
			<div class="form-group">
				<label for="ex_calorie">칼로리:</label> 
				<form:input type="text"
					class="form-control" placeholder="Enter calorie" path="ex_calorie" value="${bean.ex_calorie }"/>
			</div>
			<div class="form-group">
				<label for="context">운동설명:</label> 
				<form:input type="text"
					class="form-control" placeholder="Enter context" path="context" value="${bean.context }"/>
			</div>
			<div class="form-group">
				<label for="url">URL:</label> 
				<form:input type="text"
					class="form-control" placeholder="Enter url" path="url" value="${bean.url }"/>
			</div>
			<button type="submit" class="btn btn-primary">수정</button>
		</form:form>
	</div>
	<!-- Js Plugins -->
   <script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/jquery.magnific-popup.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/mixitup.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/jquery.slicknav.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>
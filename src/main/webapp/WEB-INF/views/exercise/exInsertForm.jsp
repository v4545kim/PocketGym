<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
<style type="text/css">
	.form-group {
		margin-bottom: 3px;
	}
	.good-result{/* 상태 양호 */
		font-size : 10pt;
		color:blue;
		font-weight: bolder;
	}
	
	.err{ color: red; font-size: 9pt ; font-weight: bold ; }
</style>
<title>exercise insert</title>
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
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="jquery.validate.js"></script>
</head>

<body>
	<jsp:include page="./../header.jsp"/>
		<section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/breadcrumb/classes-breadcrumb.jpg">
		 <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2><i class="fa fa-shopping-basket"></i>운동 추가하기</h2>
                    </div>
                </div>
            </div>
        </div>
	</section>
	<div class="container">
	<br><br><br>
		<c:set var="xx" value="<%=request.getContextPath()%>"></c:set>
		<form:form action="${xx}/insert.ex" method="post" modelAttribute="bean">
			<div class="form-group">
				<label for="ex_name">이름:</label> 
				<form:input type="text"
					class="form-control" placeholder="Enter name" path="ex_name" value="${exercise.ex_name }"/>
				<form:errors cssClass="err" path="ex_name" />
			</div>
			<div class="form-group">
				<label for="context">운동설명:</label> 
				<form:input type="text"
					class="form-control" placeholder="Enter context" path="context" value="${exercise.context }"/>
				<form:errors cssClass="err" path="context" />
			</div>
			<div class="form-group">
				<label for="ex_calorie">칼로리:</label> 
				<form:input type="text"
					class="form-control" placeholder="Enter calorie" path="ex_calorie" value="${exercise.ex_calorie }"/>
				<form:errors cssClass="err" path="ex_calorie" />
			</div>
			<div class="form-group">
				<label for="url">URL:</label> 
				<form:input type="text"
					class="form-control" placeholder="Enter url" path="url" value="${exercise.url }"/>
				<form:errors cssClass="err" path="url" />
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
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
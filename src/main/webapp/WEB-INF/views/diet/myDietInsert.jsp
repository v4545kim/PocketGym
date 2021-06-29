<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style type="text/css">
body {
	background:
		url(http://habrastorage.org/files/c9c/191/f22/c9c191f226c643eabcce6debfe76049d.jpg);
}

.jumbotron {
	text-align: center;
	width: 30rem;
	border-radius: 0.5rem;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	position: absolute;
	margin: 4rem auto;
	background-color: #fff;
	padding: 2rem;
}

.container .glyphicon-list-alt {
	font-size: 10rem;
	margin-top: 3rem;
	color: #f96145;
}

input {
	width: 100%;
	margin-bottom: 1.4rem;
	padding: 1rem;
	background-color: #ecf2f4;
	border-radius: 0.2rem;
	border: none;
}

h2 {
	margin-bottom: 3rem;
	font-weight: bold;
	color: #ababab;
}

.btn {
	border-radius: 0.2rem;
}

.btn .glyphicon {
	font-size: 3rem;
	color: #fff;
}

.full-width {
	background-color: #8eb5e2;
	width: 100%;
	-webkit-border-top-right-radius: 0;
	-webkit-border-bottom-right-radius: 0;
	-moz-border-radius-topright: 0;
	-moz-border-radius-bottomright: 0;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

.box {
	position: absolute;
	bottom: 0;
	left: 0;
	margin-bottom: 3rem;
	margin-left: 3rem;
	margin-right: 3rem;
}
</style>

 <script type="text/javascript">
	function dietsubmit() 
	{
		
		if(document.myform.foodname.value === "" || isNaN(myform.foodname.value) === false){ //isNaN에 의해서 숫자는 처리 불가
	          myform.foodname.focus();
	          alert("음식을 입력해 주세요");
	          return;
	     }
		else if(document.myform.calorie.value=="") {
	           alert("칼로리를 입력해 주세요");
	           myform.calorie.focus();
	           return;
	       }
		else
		{
			opener.name = "입력창";
			document.myform.target = opener.name;
			document.myform.action = "<%=request.getContextPath() %>/mydietinsert.di"
			document.myform.submit();
			self.close();
		}	
	}
</script>

</head>
<body>
	<form name="myform" action="<%=request.getContextPath() %>/mydietinsert.di" method="post">
	<input type="hidden" name="id" value="${loginfo.id }">
	<input type="hidden" name="year" value="${year}">
    <input type="hidden" name="month" value="${month}">
    <input type="hidden" name="day" value="${day}">
    <input type="hidden" name="mealtime" value="${mealtime}">
	<div class="jumbotron">
		<div class="container">
			<span class="glyphicon glyphicon-list-alt"></span>


			<c:set var="mealtime" value="${mealtime}" />
			<c:choose>
			<c:when test="${mealtime eq 'breakfast'}">
		        <h2>아침 식단</h2>
    		</c:when>
    		
			<c:when test="${mealtime eq 'lunch'}">
		        <h2>점심 식단</h2>
    		</c:when>
			<c:otherwise>
		        <h2>저녁 식단</h2>
  			</c:otherwise>


			</c:choose>
			<div class="box">
				<input type="text" name="foodname" placeholder="음식명" min="1">
				<input type="text"	name="calorie"	placeholder="칼로리(Kcal)">
				<a href="#none" class="btn btn-default full-width" onclick="javascript:dietsubmit()">
				<span class="glyphicon glyphicon-ok"></span></a>
			</div>
		</div>
	</div>
	</form>
</body>
</html>
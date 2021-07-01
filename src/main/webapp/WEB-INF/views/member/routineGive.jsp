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
select {
    width: -webkit-fill-available;
    text-align-last: center;
    height: 37px;
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
a.btn.btn-default.full-width {
    margin-top: 16px;
    height: 43px;
}
</style>

<script type="text/javascript">
	function dietsubmit() 
	{
		
		if(document.myform.language.value === "")
		{ 
	          alert("루틴을 선택해주세요.");
	          return;
	     }
		else
		{
			opener.name = "루틴부여";
			document.myform.target = opener.name;
			document.myform.action = "<%=request.getContextPath()%>/rogive.me"
			document.myform.submit();
			self.close();
		}
	}
</script>

</head>
<body>
	<form name="myform"	action="<%=request.getContextPath()%>/rogive.me" method="post">
	<input type="hidden" name="id" value="${requestScope.id}" >
		<%-- <input type="hidden" name="id" value="${loginfo.id }">  --%>
		<div class="jumbotron">
			<div class="container">
				<span class="glyphicon glyphicon-list-alt"></span>


						<h2>운동 루틴 부여</h2>

				<input type="text" disabled="disabled" style="text-align:center;" name="name" placeholder="회원 : ${requestScope.nickname}(${requestScope.id })">
				
				<select name="language">
					<option value="">=== 루틴을 선택하세요 ===</option>
					<c:forEach var="lists" items="${requestScope.lists}">
					<option  value="${lists.ro_id}">${lists.ro_name}</option>
					</c:forEach>
				</select> 
					
					<a href="#none" class="btn btn-default full-width"
						onclick="javascript:dietsubmit()"> <span
						class="glyphicon glyphicon-ok"></span></a>
			</div>
		</div>
	</form>
</body>
</html>







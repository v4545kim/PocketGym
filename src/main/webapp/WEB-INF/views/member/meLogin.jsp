<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!-- Loding font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,700" rel="stylesheet">

    <!-- Custom Styles -->
    <link rel="stylesheet" type="text/css" href="./styles.css">

    <title>Login</title>
</head>

<body>
	<jsp:include page="./../header.jsp"/>
	<jsp:include page="./../header.jsp" />
	<!-- <!-- Backgrounds -->
	<div id="login-bg" class="container-fluid">
		<div class="bg-img"></div>
		<div class="bg-color"></div>
	</div>

	<div class="container" id="login">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="login">
					<h1>Login</h1>
					<%=contextPath %>
					<form action="<%=contextPath%>/login.me" method="post">
						<div class="form-group">
							<input type="text" class="form-control" id="id"
								 placeholder="Enter id">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="password" 
								placeholder="Password">
						</div>
						<!-- <div class="form-check">
							<label class="switch"> 
								<input type="checkbox"> <span class="slider round"></span>
							</label> 
							<label class="form-check-label" for="exampleCheck1">
								Remember me
							</label> 
							<label class="forgot-password">
								<a href="#">Forgot Password?<a>
							</label>
						</div> -->
						<br>
						<button type="submit" class="btn btn-lg btn-block btn-success">
							Sign in
						</button>
					</form>
					
				</div>
			</div>
		</div>
	</div> 
	
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/mixitup.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/masonry.pkgd.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/main.js"></script>
    
</body>
</html>
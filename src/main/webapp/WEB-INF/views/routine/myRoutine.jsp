<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
 	<title>Checkbox 09</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=contextPath %>resources/css/style.css">
</head>

<body>
	<jsp:include page="./../header.jsp"/>
	<section class="ftco-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<h2 class="heading-section mb-5">내 루틴</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-4">
						<ul class="ks-cboxtags">
					    <li>
					    	<input type="checkbox" id="checkboxOne" value="Order one" checked="">
					    	<label for="checkboxOne">Task One</label>
					    </li>
					    <li>
					    	<input type="checkbox" id="checkboxTwo" value="Order Two">
					    	<label for="checkboxTwo">Task Two</label>
					    </li>
					    <li>
					    	<input type="checkbox" id="checkboxThree" value="Order Two">
					    	<label for="checkboxThree">Task Three</label>
					    </li>
					    <c:forEach items="${lists }" var="item">
					    	<li>
					    	<input type="checkbox" id="checkboxThree" value="${item }">
					    	<a href="<%=contextPath%>/detail.ex?ex=${item}">
					    		<label for="checkboxThree">${item.ex_name }</label>
					    	</a>
					    	
					    	</li>
					    </c:forEach>
					  </ul>
					</div>
				</div>
			</div>
		</section>

    <script src="<%=contextPath %>resources/js/jquery.min.js"></script>
    <script src="<%=contextPath %>resources/js/popper.js"></script>
    <script src="<%=contextPath %>resources/js/bootstrap.min.js"></script>
    <script src="<%=contextPath %>resources/js/main.js"></script>

</body>
</html>
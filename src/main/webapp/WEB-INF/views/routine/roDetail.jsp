<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>exercise list</title>
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
                        <h2><i class="fa fa-shopping-basket"></i>운동 리스트</h2>
                    </div>
                </div>
            </div>
        </div>
	</section>
	
	<div class="container-fluid">
		<h2>운동 리스트</h2>
		<p>운동들에 대한 상세정보를 볼 수 있어요</p>
		<a href="<%=contextPath%>/insert.ex" class="btn btn-primary" role="button">새로운 운동 추가하기</a>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>운동</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="item">
					<tr>	
						<td>
							<a href="<%=contextPath%>/detail.ex?ex_id=${item.ex_id}">
								${item.ex_name}
							</a>
						</td>
					</tr>
				</c:forEach>		
			</tbody>
		</table>
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
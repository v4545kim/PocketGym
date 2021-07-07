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
<style type="text/css">
	td{
		color: white;
	}
	* {
  box-sizing: border-box;
}

.column {
  float: left;
  width: 20%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}
td {
    font-size: x-large;
}
.text-white {
    color: #fff!important;
    font-size: x-large;
}
</style>
</head>

<body>
	<jsp:include page="./../header.jsp" />
	<section class="breadcrumb-section set-bg"
		data-setbg="<%=request.getContextPath()%>/resources/img/breadcrumb/classes-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<h2>
							<i class="fa fa-shopping-basket"></i>루틴 상세정보
						</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<h2>${ro_name } 루틴</h2>
		<c:if test="${whologin == 2}">
		<a href="<%=contextPath%>/update.ro?ro_id=${ro_id}"
			class="btn btn-primary" role="button">루틴 수정하기</a> <a
			href="<%=contextPath%>/delete.ro?ro_id=${ro_id}"
			class="btn btn-primary" role="button">루틴 삭제하기</a> <br>
		<br>
		</c:if>
		<div class="row">
			<c:forEach items="${list}" var="item">
				<div class="column">
					<div class="container">
						<a href="<%=contextPath%>/detail.ex?ex_id=${item.ex_id}">
							<img src="<%=contextPath%>/upload/${item.ex_image}" alt="${item.ex_name}"
								style="width: 200px; height: 150px">
						</a>
							<div class="middle">
								<div class="text">${item.ex_name}</div>
							</div>
						</div>
					</div>
			</c:forEach>
		</div>
	</div>
	       <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="contact-option">
                        <span>Phone</span>
                        <p>0507-1414-9601</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="contact-option">
                        <span>Address</span>
                        <p>서울 강남구 강남대로94길 20 삼오빌딩 5-9층</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="contact-option">
                        <span>Email</span>
                        <p>PocKetGym@bitcamp.com</p>
                    </div>
                </div>
            </div>
            <div class="subscribe-option set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/footer-signup.jpg">
                <div class="so-text">
                    <h4>모든 저작권은 포켓짐에게 있습니다</h4>
                    <p>자세한 사항은 관리자에게 문의주세요</p>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->
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
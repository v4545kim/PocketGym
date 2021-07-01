<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
<!-- Font special for pages-->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

<!-- Main CSS-->
<link href="<%=contextPath%>/resources/css/prinsertmain.css" rel="stylesheet" media="all">

<!-- Jquery JS-->
<script src="<%=contextPath%>/resources/vendor/jquery/prinsertjquery.min.js"></script>

<!-- Main JS-->
<script src="<%=contextPath%>/resources/js/prinsertglobal.js"></script>

<style type="text/css">

.dark-bg {
    background-color: black;
}
.card-6 .card-heading {
    background: black;
}
.card {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0px solid rgba(0,0,0,.125);
}
</style>
</head>

<body>
	<jsp:include page="./../header.jsp"/>

	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/breadcrumb/classes-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2><i class="fa fa-shopping-cart"></i>쇼핑몰</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    
    
    
    
    <div class="page-wrapper dark-bg p-t-100 p-b-50">
        <div class="wrapper wrapper--w900">
            <div class="card card-6">
                <div class="card-heading">
                    <h2 class="title">상품 등록</h2>
                </div>
                <div class="card-body">
                	<c:set var="apppath" value="<%=request.getContextPath()%>" />
                    <%-- <form:form method="post" action="${apppath}/insert.pr" modelAttribute="product" enctype="multipart/form-data"> --%>
                    <form:form modelAttribute="product" class="form-horizontal" role="form" action="${apppath}/insert.pr"
					method="post">
                        <div class="form-row">
                            <div class="name">상품명</div>
                            <div class="value">
                                <%-- <form:input class="input--style-6" type="text" path="pr_name" /> --%>
                                <input type="text" name="pr_name">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">상품설명</div>
                            <div class="value">
                                <div class="input-group">
                                    <%-- <form:textarea class="textarea--style-6" path="context"/> --%>
                                    <textarea name="context"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">카테고리</div>
                            <div class="value">
                                <div class="input-group">
                                    <select name="category">
                                    	<option value="-" selected="selected">카테고리를 선택해 주세요.
                                    	<option value="음식">음식
                                    	<option value="기구">기구
                                    	<option value="의류">의류
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">상품 재고</div>
                            <div class="value">
                                <div class="input-group">
                                	<%-- <form:input class="input--style-6" type="number" path="stock" /> --%>
                                	<input type="number" name="stock">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">상품 가격</div>
                            <div class="value">
                                <div class="input-group">
                                	<%-- <form:input class="input--style-6" type="number" path="price" /> --%>
                                	<input type="number" name="price">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">첨부 이미지</div>
                            <div class="value">
                                <div class="input-group js-input-file">
                                    <input class="input-file" type="file" name="abcd" id="file">
                                    <label class="label--file" for="file">Choose file</label>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                    		<button class="btn btn--radius-2 btn--blue-2" type="submit">등록 하기</button>
                		</div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

    
    
    
     <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="contact-option">
                        <span>Phone</span>
                        <p>(123) 118 9999 - (123) 118 9999</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="contact-option">
                        <span>Address</span>
                        <p>72 Kangnam, 45 Opal Point Suite 391</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="contact-option">
                        <span>Email</span>
                        <p>contactcompany@Gutim.com</p>
                    </div>
                </div>
            </div>
            <div class="subscribe-option set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/footer-signup.jpg">
                <div class="so-text">
                    <h4>Subscribe To Our Mailing List</h4>
                    <p>Sign up to receive the latest information </p>
                </div>
                <form action="#" class="subscribe-form">
                    <input type="text" placeholder="Enter Your Mail">
                    <button type="submit"><i class="fa fa-send"></i></button>
                </form>
            </div>
            <div class="copyright-text">
                <ul>
                    <li><a href="#">Term&Use</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
                <p>&copy;<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></p>
                <div class="footer-social">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-instagram"></i></a>
                    <a href="#"><i class="fa fa-dribbble"></i></a>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
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
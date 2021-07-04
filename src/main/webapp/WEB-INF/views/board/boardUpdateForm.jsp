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
.card-6 .card-footer {
    background: #fff;
    border: 1px solid #e5e5e5;
    border-top: none;
    -webkit-border-bottom-left-radius: 3px;
    -moz-border-radius-bottomleft: 3px;
    border-bottom-left-radius: 3px;
    -webkit-border-bottom-right-radius: 3px;
    -moz-border-radius-bottomright: 3px;
    border-bottom-right-radius: 3px;
    padding: 50px 360px;
}
/* 유효성 검사시 보여 주는 빨간색 글자를 위한 스타일 입니다. */
.err{ 
   font-size : 10pt;
   color:red;
   font-weight: bolder;
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
                        <h2> ${bean.title}</h2>
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
                    <h2 class="title">후기 수정</h2>
                </div>
                <div class="card-body">
                	<c:set var="apppath" value="<%=request.getContextPath()%>" />
                    <form:form method="post" action="${apppath}/brupdate.br" modelAttribute="board" enctype="multipart/form-data">
                        <form:input type="hidden" path="mem_id"
								value="${sessionScope.loginfo.id}" />
						<form:input type="hidden" path="bo_id"
								value="${bean.bo_id}" />
						<form:input type="hidden" path="regdate"
								value="${bean.bo_id}" />
                        <div class="form-row">
                            <div class="name">제목</div>
                            <div class="value">
                                <form:input class="input--style-6" type="text" path="title" value="${bean.title}" />
                                <form:errors cssClass="err" path="title" />
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">다이어트 전</div>
                            <div class="value">
                                <div class="input-group js-input-file">
                                    <input path="be_image" class="input-file" type="file" name="abcd1" id="be_image" value="${bean.be_image}">
                                    <label class="label--file" for="file">Choose file</label>
                                    <br>
                                    <form:errors cssClass="err" path="be_image" />
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">다이어트 후</div>
                            <div class="value">
                                <div class="input-group js-input-file">
                                    <input path="af_image" class="input-file" type="file" name="abcd2" id="af_image" value="${bean.af_image}">
                                    <label class="label--file" for="file">Choose file</label>
                                    <br>
                                    <form:errors cssClass="err" path="af_image" />
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">후기</div>
                            <div class="value">
                                <textarea rows="8" cols="30" class="input--style-6" type="text" id="context" name="context">${bean.context}</textarea>
                                <form:errors cssClass="err" path="context" />
                            </div>
                        </div>
                        
                        <div class="card-footer">
	         				<button class="btn btn-default" type="submit"><i class="fa fa-pencil-square-o" >수정 하기</i></button>
							<button class="btn btn-default" type="reset"><i class="fa fa-recycle">초기화</i></button>
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
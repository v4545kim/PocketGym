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
<script type="text/javascript">
	function checkBtn2() {
		if(${sessionScope.loginfo.id == null}){
			alert('관리자로 로그인 해주세요.')
			return false;
		}
		if(${sessionScope.loginfo.id != 'admin'}){
			alert('관리자가 아니면 상품 수정이 안 됩니다.')
			return false;
		}
	}
</script>
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
                    <h2 class="title">상품 수정</h2>
                </div>
                <div class="card-body">
                	<c:set var="apppath" value="<%=request.getContextPath()%>" />
                    <form:form method="post" action="${apppath}/update.pr" modelAttribute="product" enctype="multipart/form-data">
                    	<input type="hidden" name="pr_id" value="${bean.pr_id}">
                        <div class="form-row">
                            <div class="name">상품명</div>
                            <div class="value">
                                <form:input class="input--style-6" type="text" path="pr_name" value="${bean.pr_name}"/>
                                <form:errors cssClass="err" path="pr_name" />
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">상품설명</div>
                            <div class="value">
                                <div class="input-group">
                                    <textarea class="textarea--style-6" id="context" name="context" >${bean.context}</textarea>
                                    <form:errors cssClass="err" path="context" />
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">카테고리</div>
                            <div class="value">
                                <div class="input-group">
                                    <select name="category">
                                    	<option value="" selected="selected">카테고리를 선택해 주세요.
                                    	<c:if test="${bean.category == '음식'}">
                                    		<option value="음식" selected="selected">음식
                                    	</c:if>
                                    	<c:if test="${bean.category != '음식'}">
                                    		<option value="음식">음식
                                    	</c:if>
                                    	<c:if test="${bean.category == '기구'}">
                                    		<option value="기구" selected="selected">기구
                                    	</c:if>
                                    	<c:if test="${bean.category != '기구'}">
                                    		<option value="기구">기구
                                    	</c:if>
                                    	<c:if test="${bean.category == '의류'}">
                                    		<option value="의류" selected="selected">의류
                                    	</c:if>
                                    	<c:if test="${bean.category != '의류'}">
                                    		<option value="의류">의류
                                    	</c:if>
                                    </select>
                                    <br>
                                    <form:errors cssClass="err" path="category" />
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">상품 재고</div>
                            <div class="value">
                                <div class="input-group">
                                	<form:input class="input--style-6" type="number" path="stock" value="${bean.stock}"/>
                                	<form:errors cssClass="err" path="stock" />
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">상품 가격</div>
                            <div class="value">
                                <div class="input-group">
                                	<form:input class="input--style-6" type="number" path="price" value="${bean.price}"/>
                                	<form:errors cssClass="err" path="price" />
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">첨부 이미지</div>
                            <div class="value">
                                <div class="input-group js-input-file">
                                    <input class="input-file" type="file" name="abcd" id="file"">
                                    <label class="label--file" for="file">Choose file</label>
                                    <br>
                                    <form:errors cssClass="err" path="image" />
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
	         				<button class="btn btn-default" type="submit"><i class="fa fa-pencil-square-o" onclick="checkBtn2();">수정 하기</i></button>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html lang="zxx">

<head>

</head>

<body>
	<jsp:include page="./../header.jsp"/>
	
	 <section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/breadcrumb/classes-breadcrumb.jpg">
		 <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2><i class="fa fa-shopping-basket"></i>운동 정보</h2>
                    </div>
                </div>
            </div>
        </div>
	</section>
	    <section class="about-section about-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="about-pic">
                       ${ex.url }
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-text">
                        <h2>${ex.ex_name }</h2>
                        <p class="first-para">Lorem ipsum proin gravida nibh vel velit auctor aliquet. Aenean pretium
                            sollicitudin, nascetur auci elit consequat ipsutissem niuis sed odio sit amet nibh vulputate
                            cursus a amet.</p>
                        <p class="second-para">	${ex.ex_calorie } 칼로리</p>
                        <img src="<%=request.getContextPath() %>/resources/img/about-signature.png" alt="">
                        <div class="at-author">
                            <h4>Lettie Chavez</h4>
                            <span>CEO - Founder</span>
                        </div>
                    </div>
                </div>
                <c:if test="${whologin == 2}">
                	<a href="<%=contextPath%>/update.ex?ex_id=${ex.ex_id}" class="btn btn-primary" role="button">운동 수정하기</a>
                	<a href="<%=contextPath%>/delete.ex?ex_id=${ex.ex_id}" class="btn btn-primary" role="button">운동 삭제하기</a>
                </c:if>
            </div>
        </div>
    </section>

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
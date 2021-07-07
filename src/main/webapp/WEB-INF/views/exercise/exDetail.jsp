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
                    <img alt="" src="<%=contextPath %>/upload/${ex.ex_image }">
                      <a href="${ex.url}" class="play-btn video-popup">
                         <img src="<%=request.getContextPath() %>/resources/img/play.png" alt="">
                     </a>                  
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-text">
                        <h2>${ex.ex_name }</h2>
                        <p class="first-para">${ex.context }</p>
                        <p class="second-para">소모 칼로리 : ${ex.ex_calorie } 칼로리</p>
						<c:if test="${whologin == 2}">
							<a href="<%=contextPath%>/update.ex?ex_id=${ex.ex_id}"
								class="btn btn-primary" role="button">수정하기</a>
							<a href="<%=contextPath%>/delete.ex?ex_id=${ex.ex_id}"
								class="btn btn-primary" role="button">삭제하기</a>
						</c:if>
					</div>					
				</div>               
            </div>
        </div>
    </section>
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
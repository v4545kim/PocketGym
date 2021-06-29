<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
  
</head>

<body>
    <jsp:include page="./../header.jsp" />

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%=contextPath %>/resources/img/breadcrumb/classes-breadcrumb.jpg">
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


    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="bd-text">
                        <div class="bd-pic">
                            <div class="row">
                                <div class="col-lg-6">
		                            <c:if test="${empty bean.be_image}">
										<img src="<%=uploadedFolder%>Koala.jpg" class="img-thumbnail"
											width="200" height="200" alt="no image">
									</c:if>						
									
									<c:if test="${applicationScope.debugMode == true}">
										디버그 모드가 true이면 보입니다.<br>
										${applicationScope.uploadedPath}/${bean.be_image}
									</c:if>								
									
									<c:if test="${not empty bean.be_image}">
										<img src="${applicationScope.uploadedPath}/${bean.be_image}"
											class="img-thumbnail" width="200" height="200"
											alt="${bean.be_image}">
									</c:if>
                                </div>
                                <div class="col-lg-6">
                                   <c:if test="${empty bean.af_image}">
										<img src="<%=uploadedFolder%>Koala.jpg" class="img-thumbnail"
											width="200" height="200" alt="no image">
									</c:if>						
									
									<c:if test="${applicationScope.debugMode == true}">
										디버그 모드가 true이면 보입니다.<br>
										${applicationScope.uploadedPath}/${bean.af_image}
									</c:if>								
									
									<c:if test="${not empty bean.af_image}">
										<img src="${applicationScope.uploadedPath}/${bean.af_image}"
											class="img-thumbnail" width="200" height="200"
											alt="${bean.af_image}">
									</c:if>
                                </div>
                            </div>
                        </div>
                        <div class="bd-title">
                            <p>${bean.context}</p>
                            
                        </div>
                        
                        
                        <div class="bd-quote">
                            <samp>"</samp>
                            <p>“운동 후기에 대한 자신의 생각을 남기고 </br> 마음에 드신다면 좋아요 버튼을 눌러보세요"</p>
                            <div class="quote-author">
                                <h5>PocketGym</h5>
                            </div>
                        </div>
                        
                        <div class="tag-share">
                           <c:if test="${sessionScope.loginfo.id == bean.mem_id}">
	                           <div class="social-share">
	                                <a href="#"><i class="fa fa-facebook">좋아요실시간 갯수</i></a>
	                                <a href="/brupdate.br">수정</a>
	                                <a href="/brdelete.br">삭제</a>
	                            </div>
                            </c:if>
                            <c:if test="${sessionScope.loginfo.id != bean.mem_id}">
	                           <div class="social-share">
	                                <span>좋아요:</span>
	                                <a href="#"><i class="fa fa-facebook">좋아요실시간 갯수</i></a>
	                            </div>
                            </c:if>
                            <c:if test="${whologin == 2}">
	                           <div class="social-share">
	                                <span>좋아요:</span>
	                                <a href="#"><i class="fa fa-facebook">좋아요실시간 갯수</i></a>
	                                <a href="/brdelete.br">삭제</a>
	                            </div>
                            </c:if>
                            
                        </div>
                        <div class="leave-comment">
                            <h3>Leave A Comment</h3>
                            <form action="#">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <input type="text" placeholder="Name">
                                    </div>
                                    <div class="col-lg-6">
                                        <input type="text" placeholder="Email">
                                    </div>
                                    <div class="col-lg-12">
                                        <textarea placeholder="Messages"></textarea>
                                        <button type="submit">댓글 작성</button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <button reset="text">뒤로가기</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->

    <!-- Latest Blog Section Begin -->
    <section class="latest-blog-section recommend spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3>Recommended</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-1.jpg" alt="">
                        <div class="blog-widget">
                            <div class="bw-date">February 17, 2019</div>
                            <a href="#" class="tag">#Gym</a>
                        </div>
                        <h4><a href="#">10 States At Risk of Rural Hospital Closures</a></h4>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-2.jpg" alt="">
                        <div class="blog-widget">
                            <div class="bw-date">February 17, 2019</div>
                            <a href="#" class="tag">#Sport</a>
                        </div>
                        <h4><a href="#">Diver who helped save Thai soccer team</a></h4>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-3.jpg" alt="">
                        <div class="blog-widget">
                            <div class="bw-date">February 17, 2019</div>
                            <a href="#" class="tag">#Body</a>
                        </div>
                        <h4><a href="#">Man gets life in prison for stabbing</a></h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->

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
    <script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/main.js"></script>
</body>

</html>
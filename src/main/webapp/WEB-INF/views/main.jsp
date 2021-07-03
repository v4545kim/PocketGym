<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
<style type="text/css">
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css');
.single-class-item.set-bg 
{
    width: 348px;
}
.star-rating {
    height: 7px;
    margin-top: -13px;
    margin-bottom: 24px;
}
.star-rating i {
	color: red;
	font-size: 24px;
}
</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
	<jsp:include page="header.jsp"/>

    <!-- Hero Section Begin -->
    <section class="hero-section set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/hero-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="hero-text">
                        <h1 style="text-align: center;">내 몸에 잘 맞는 운동, <br>Pocket Gym</h1>
                        <p style="text-align: center;">우리집 거실이 1:1 PT 스튜디오로<br /> 지금 바로 Pocket Gym과 함께 하세요!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- About Section Begin -->
    <section class="about-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="about-pic">
                        <img src="<%=request.getContextPath() %>/resources/img/about-pic2.png" alt="">
                        <%-- <a href="https://www.youtube.com/watch?v=SlPhMPnQ58k" class="play-btn video-popup">
                            <img src="<%=request.getContextPath() %>/resources/img/play.png" alt="">
                        </a> --%>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-text">
                        <h2>Introduce</h2>
                        <p class="first-para">저희 Pocket Gym을 통해서 매일 음식 일기를 기록하고 관리하여 성공적으로 체중을 조절할 수 있도록 이끌어 줍니다.</p>
                        <p class="second-para">특히 체중 감량, 근육 키우기 등을 위한 개인 맞춤화 루틴운동을 제공하며 이 외에도 섭취 및 소모한 칼로리와 목표 성취율을 보기 쉬운 표로 
                        한눈에 확인할 수 있습니다.</p>
                        <!-- <a href="#" class="primary-btn">Read More</a> -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- About Section End -->

    <!-- Services Section Begin -->
    <section class="services-section">
		<div class="container">
			<div class="about-text" align="center">
				<h2>루틴 종류</h2>
				<a href="<%=contextPath%>/list.ro">
					<button>루틴 상세보기</button>
				</a>
			</div>
			<c:forEach items="${roList }" var="item">
				<div class="services-item bg-gray" style="float: left;">
					<img
						src="<%=request.getContextPath()%>/resources/img/services/service-icon-1.png"
						alt="">
					<h4>${item.ro_name }</h4>
					<p>${item.ro_context }</p>
				</div>
			</c:forEach>
		</div>
	</section>
    <!-- Services Section End -->

    <!-- Classes Section Begin -->
    <section class="classes-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>exercise list</h2>
                    </div>
                </div>
            </div>
            <div class="row classes-slider owl-carousel">
                <div class="col-lg-4">
                    <div class="single-class-item set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/classes/pushup.jpg">
                        <div class="si-text">
                            <h4>팔굽혀펴기</h4>
                            <span><i class="fa fa-user"></i> Ryan Knight</span>
                        </div>
                    </div>
                    <div class="single-class-item set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/classes/squart.jpg">
                        <div class="si-text">
                            <h4>스쿼트</h4>
                            <span><i class="fa fa-user"></i> Kevin McCormick</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-class-item set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/classes/chinning.jpg">
                        <div class="si-text">
                            <h4>턱걸이</h4>
                            <span><i class="fa fa-user"></i> Randy Rivera</span>
                        </div>
                    </div>
                    <div class="single-class-item set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/classes/plank.jpg">
                        <div class="si-text">
                            <h4>플랭크</h4>
                            <span><i class="fa fa-user"></i> Russell Lane</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-class-item set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/classes/burpee.jpg">
                        <div class="si-text">
                            <h4>버피</h4>
                            <span><i class="fa fa-user"></i> Cole Robertson</span>
                        </div>
                    </div>
                    <div class="single-class-item set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/classes/crunch.jpg">
                        <div class="si-text">
                            <h4>크런치</h4>
                            <span><i class="fa fa-user"></i> Ryan Scott</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-class-item set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/classes/dumbbellrow.jpg">
                        <div class="si-text">
                            <h4>덤벨 로우</h4>
                            <span><i class="fa fa-user"></i> Cole Robertson</span>
                        </div>
                    </div>
                    <div class="single-class-item set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/classes/running.png">
                        <div class="si-text">
                            <h4>달리기</h4>
                            <span><i class="fa fa-user"></i> Ryan Scott</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Classes Section End -->

    <!-- Trainer Section Begin -->
    <section class="trainer-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Review</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                        <img src="<%=request.getContextPath() %>/resources/img/trainer/trainer-1.jpg" alt="">
                        <div class="trainer-text">
	                        <div class="star-rating">
								<i class="fas fa-star" id="star1" ></i>
								<i class="fas fa-star" id="star2" ></i>
								<i class="fas fa-star" id="star3" ></i>
								<i class="fas fa-star" id="star4"></i>
								<i class="fas fa-star" id="star5" ></i>
							</div>
                            <h5>조녀석</h5>
                            <span>15kg 감량</span>
                            <p>매일 식단을 기록하고 관리하며 운동 성취율을 한번에 볼수 있어서 체계적인 몸 관리가 가능한 점이 좋네요ㅎㅎ.</p>
                            <div class="trainer-social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                        <img src="<%=request.getContextPath() %>/resources/img/trainer/trainer-2.jpg" alt="">
                        <div class="trainer-text">
                       		<div class="star-rating">
								<i class="fas fa-star" id="star1" ></i>
								<i class="fas fa-star" id="star2" ></i>
								<i class="fas fa-star" id="star3" ></i>
								<i class="fas fa-star" id="star4"></i>
								<i class="far fa-star" id="star5" ></i>
							</div>
                            <h5>나무나무</h5>
                            <span>18kg 감량</span>
                            <p>체계적인 루틴 제공 시스템에 만족하며 식단을 매일 기록할수 있어서 좋습니다^^</p>
                            <div class="trainer-social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                        <img src="<%=request.getContextPath() %>/resources/img/trainer/trainer-3.jpg" alt="">
                        <div class="trainer-text">
                        	<div class="star-rating">
								<i class="fas fa-star" id="star1" ></i>
								<i class="fas fa-star" id="star2" ></i>
								<i class="fas fa-star" id="star3" ></i>
								<i class="fas fa-star" id="star4"></i>
								<i class="far fa-star" id="star5" ></i>
							</div>
                            <h5>순섭순섭</h5>
                            <span>13kg 감량</span>
                            <p>저에게 알맞는 운동 루틴을 수행할 수 있어 편리하고 각각 운동 방법을 동영상으로 확인할 수 있다는 점이 좋았습니다.</p>
                            <div class="trainer-social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

 
    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="contact-option">
                        <span>Phone</span>
                        <p>(123) 118 9999 - (123) 118 9999</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="contact-option">
                        <span>Address</span>
                        <p>72 Kangnam, 45 Opal Point Suite 391</p>
                    </div>
                </div>
                <div class="col-md-4">
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
   <script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/jquery.magnific-popup.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/mixitup.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/jquery.slicknav.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<script type="text/javascript">
	function deletealert() {
		if(confirm("정말 삭제하시겠습니까 ?") == true){
	    }
	    else{
	        return ;
	    }
	}

</script>
<style type="text/css">
.hoho 
{
	font-size: large;
}
.btn-circle.btn-xl {
  width: 70px;
  height: 70px;
  padding: 10px 16px;
  font-size: 24px;
  line-height: 1.33;
  border-radius: 35px;
}
.glyphicon-pencil:before {
    content: "\270f";
    margin-left: -5px;
}
.glyphicon-remove:before {
    margin-left: -5px;
    content: "\e014";
}
.btn{
line-height: 10px;
width: 31px;

}

.bg-gradient {
	background: #C9D6FF;
	background: -webkit-linear-gradient(to right, #E2E2E2, #C9D6FF);
	background: linear-gradient(to right, #E2E2E2, #C9D6FF);
}


ul li {
	margin-bottom: 1.4rem;
}

.pricing-divider {
	border-radius: 20px;
	background: #C64545;
	padding: 1em 0 4em;
	position: relative;
}

.blue .pricing-divider {
	background: #2D5772;
}

.green .pricing-divider {
	background: #1AA85C;
}

.red b {
	color: #C64545
}

.blue b {
	color: #2D5772
}

.green b {
	color: #1AA85C
}

.pricing-divider-img {
	position: absolute;
	bottom: -2px;
	left: 0;
	width: 100%;
	height: 80px;
}

.deco-layer {
	-webkit-transition: -webkit-transform 0.5s;
	transition: transform 0.5s;
}

.btn-custom {
	background: #C64545;
	color: #fff;
	border-radius: 20px
}

.img-float {
	width: 50px;
	position: absolute;
	top: -3.5rem;
	right: 1rem
}

.princing-item {
	transition: all 150ms ease-out;
}

.princing-item:hover {
	transform: scale(1.05);
}

.princing-item:hover .deco-layer--1 {
	-webkit-transform: translate3d(15px, 0, 0);
	transform: translate3d(15px, 0, 0);
}

.princing-item:hover .deco-layer--2 {
	-webkit-transform: translate3d(-15px, 0, 0);
	transform: translate3d(-15px, 0, 0);
}

.db-bk-color-one {
	background-color: #f55039;
}

.db-bk-color-two {
	background-color: #46A6F7;
}

.db-bk-color-three {
	background-color: #47887E;
}

.db-bk-color-six {
	background-color: #F59B24;
}
/*============================================================
PRICING STYLES
==========================================================*/
.db-padding-btm {
	padding-bottom: 50px;
}

.db-button-color-square {
	color: #fff;
	background-color: rgba(0, 0, 0, 0.50);
	border: none;
	border-radius: 0px;
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
}

.db-button-color-square:hover {
	color: #fff;
	background-color: rgba(0, 0, 0, 0.50);
	border: none;
}

.db-pricing-eleven {
	margin-bottom: 30px;
	margin-top: 50px;
	text-align: center;
	box-shadow: 0 0 5px rgba(0, 0, 0, .5);
	color: #fff;
	line-height: 30px;
}

.db-pricing-eleven ul {
	list-style: none;
	margin: 0;
	text-align: center;
	padding-left: 0px;
}

.db-pricing-eleven ul li {
	padding-top: 20px;
	padding-bottom: 20px;
	cursor: pointer;
}

.db-pricing-eleven ul li i {
	margin-right: 5px;
}

.db-pricing-eleven .price {
	background-color: rgba(0, 0, 0, 0.5);
	padding: 40px 20px 20px 20px;
	font-size: 60px;
	font-weight: 900;
	color: #FFFFFF;
}

.db-pricing-eleven .price small {
	color: #B8B8B8;
	display: block;
	font-size: 12px;
	margin-top: 22px;
}

.db-pricing-eleven .type {
	background-color: #52E89E;
	padding: 50px 20px;
	font-weight: 900;
	text-transform: uppercase;
	font-size: 30px;
}

.db-pricing-eleven .pricing-footer {
	padding: 20px;
}

.db-attached>.col-lg-4, .db-attached>.col-lg-3, .db-attached>.col-md-4,
	.db-attached>.col-md-3, .db-attached>.col-sm-4, .db-attached>.col-sm-3
	{
	padding-left: 0;
	padding-right: 0;
}

.db-pricing-eleven.popular {
	margin-top: 10px;
}

.db-pricing-eleven.popular .price {
	padding-top: 80px;
}
</style>


</head>



<body>
<jsp:include page="./../header.jsp" />

<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%=contextPath %>/resources/img/breadcrumb/classes-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2><i class="fa fa-camera" aria-hidden="true"></i> 식단</h2>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
	<div class="container">
		<%-- 제목 --%>
		<div class="row text-center">
			<div class="col-md-12">
				<br /> <br />
				<h3>
					${year}년 ${month}월 ${day}일 <br> <br> <b>${loginfo.nickname}</b>님이
					드신 음식과 칼로리를 입력해주세요!
				</h3>
				<br /> <br />
			</div>
		</div>


		<div class="row db-padding-btm db-attached">



			<%-- 아침 식단 확인 및 입력부분 --%>
			<div class="col-4 princing-item red">
				<div class="pricing-divider ">
					<div class="db-wrapper">
						<div class="db-pricing-eleven db-bk-color-one">
							<div class="price">
								${requestScope.breakfasttotal}<sup>Kcal</sup> <small>Total
									calorie</small>
							</div>
							<div class="type">아침</div>
							<ul>
								<c:forEach var="breakfastlists"	items="${requestScope.breakfastlists}">
									<li class="hoho"><i class="glyphicon glyphicon-cutlery"></i>${breakfastlists.foodname}
										&nbsp;&nbsp;&nbsp; ${breakfastlists.calorie } Kcal 
										
										<!-- 수정버튼 -->
										<button type="button" class="btn btn-info btn-circle" onclick="window.open('<%=contextPath%>/mydietupdate.di?&foodname=${breakfastlists.foodname}&calorie=${breakfastlists.calorie}&year=${year}&month=${month}&day=${day}&inputdate=${inputdate }&diet_id=${breakfastlists.diet_id }','window팝업','width=1000, height=600');"><i class="glyphicon glyphicon-pencil"></i></button>
										<!-- 삭제버튼 -->
										<button type="button" class="btn btn-danger btn-circle" onclick="location.href='<%=contextPath%>/mydietdelete.di?diet_id=${breakfastlists.diet_id }&year=${year}&month=${month}&day=${day}&mem_id=${sessionScope.loginfo.id}' "><i class="glyphicon glyphicon-remove"></i></button>

										</li>
								</c:forEach>
							</ul>
							<!-- 추가버튼 -->
							<div class="pricing-footer">
								<button type="button" onclick="window.open('<%=contextPath%>/mydietinsert.di?year=${year}&month=${month}&day=${day}&mealtime=breakfast','window팝업','width=600, height=500');"
								 class="btn btn-default btn-circle btn-xl"><i class="glyphicon glyphicon-plus"></i></button>
							</div>
						</div>
					</div>
				</div>
			</div>



			<%-- 점심 식단 확인 및 입력부분 --%>
			<div class="col-4 princing-item red">
				<div class="pricing-divider ">
					<div class="db-wrapper">
						<div class="db-pricing-eleven db-bk-color-two">
							<div class="price">
								${requestScope.lunchtotal}<sup>Kcal</sup> <small>Total
									calorie</small>
							</div>
							<div class="type">점심</div>
							<ul>

								<c:forEach var="lunchlists" items="${requestScope.lunchlists}">
									<li class="hoho"><i class="glyphicon glyphicon-cutlery"></i>${lunchlists.foodname}
										&nbsp;&nbsp;&nbsp; ${lunchlists.calorie } Kcal
										
										<!-- 수정버튼 -->
										<button type="button" class="btn btn-info btn-circle" onclick="window.open('<%=contextPath%>/mydietupdate.di?&foodname=${lunchlists.foodname}&calorie=${lunchlists.calorie}&year=${year}&month=${month}&day=${day}&inputdate=${inputdate }&diet_id=${lunchlists.diet_id }','window팝업','width=1000, height=600');"><i class="glyphicon glyphicon-pencil"></i></button>
										<!-- 삭제버튼 -->
										<button type="button" class="btn btn-danger btn-circle" onclick="location.href='<%=contextPath%>/mydietdelete.di?diet_id=${lunchlists.diet_id }&year=${year}&month=${month}&day=${day}&mem_id=${sessionScope.loginfo.id}' "><i class="glyphicon glyphicon-remove"></i></button>
										
										</li>
								</c:forEach>
							</ul>
							<!-- 추가버튼 -->
							<div class="pricing-footer">
								<button type="button" onclick="window.open('<%=contextPath%>/mydietinsert.di?year=${year}&month=${month}&day=${day}&mealtime=lunch','window팝업','width=600, height=500');"
								 class="btn btn-default btn-circle btn-xl"><i class="glyphicon glyphicon-plus"></i></button>
							</div>
						</div>
					</div>
				</div>
			</div>




			<%-- 저녁 식단 확인 및 입력부분 --%>
			<div class="col-4 princing-item red">
				<div class="pricing-divider ">
					<div class="db-wrapper">
						<div class="db-pricing-eleven db-bk-color-three">
							<div class="price">
								${requestScope.dinnertotal}<sup>Kcal</sup> <small>Total
									calorie</small>
							</div>
							<div class="type">저녁</div>
							<ul>

								<c:forEach var="dinnerlists" items="${requestScope.dinnerlists}">
									<li class="hoho"><i class="glyphicon glyphicon-cutlery"></i>${dinnerlists.foodname}
										&nbsp;&nbsp;&nbsp; ${dinnerlists.calorie } Kcal
										
										<!-- 수정버튼 -->
										<button type="button" class="btn btn-info btn-circle" onclick="window.open('<%=contextPath%>/mydietupdate.di?&foodname=${dinnerlists.foodname}&calorie=${dinnerlists.calorie}&year=${year}&month=${month}&day=${day}&inputdate=${inputdate }&diet_id=${dinnerlists.diet_id }','window팝업','width=1000, height=600');"><i class="glyphicon glyphicon-pencil"></i></button>
										<!-- 삭제버튼 -->
										<button type="button" class="btn btn-danger btn-circle" onclick="location.href='<%=contextPath%>/mydietdelete.di?diet_id=${dinnerlists.diet_id }&year=${year}&month=${month}&day=${day}&mem_id=${sessionScope.loginfo.id}' "><i class="glyphicon glyphicon-remove"></i></button>
										
										</li>
								</c:forEach>
							</ul>
							<!-- 추가버튼 -->
							<div class="pricing-footer">
								<button type="button" onclick="window.open('<%=contextPath%>/mydietinsert.di?year=${year}&month=${month}&day=${day}&mealtime=dinner','window팝업','width=600, height=500');"
								 class="btn btn-default btn-circle btn-xl"><i class="glyphicon glyphicon-plus"></i></button>
							</div>
						</div>
					</div>
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
<html>
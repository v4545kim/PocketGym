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
<!------ Include the above in your HEAD tag ---------->
<style type="text/css">
.hoho {
	font-size: large;
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
							<div class="price counter-num count">
								${requestScope.breakfasttotal}<sup>Kcal</sup> <small>Total
									calorie</small>
							</div>
							<div class="type">아침 식단</div>
							<ul>
								<c:forEach var="breakfastlists"
									items="${requestScope.breakfastlists}">
									<li class="hoho"><i class="glyphicon glyphicon-cutlery"></i>${breakfastlists.foodname}
										&nbsp;&nbsp;&nbsp; ${breakfastlists.calorie } Kcal</li>
								</c:forEach>
							</ul>
							<div class="pricing-footer">
								<a href="#" class="btn db-button-color-square btn-lg">ADD &
									MODIFY</a>
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
							<div class="type">점심 식단</div>
							<ul>

								<c:forEach var="lunchlists" items="${requestScope.lunchlists}">
									<li class="hoho"><i class="glyphicon glyphicon-cutlery"></i>${lunchlists.foodname}
										&nbsp;&nbsp;&nbsp; ${lunchlists.calorie } Kcal</li>
								</c:forEach>
							</ul>
							<div class="pricing-footer">
								<a href="#" class="btn db-button-color-square btn-lg">ADD &
									MODIFY</a>
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
							<div class="type">저녁 식단</div>
							<ul>

								<c:forEach var="dinnerlists" items="${requestScope.dinnerlists}">
									<li class="hoho"><i class="glyphicon glyphicon-cutlery"></i>${dinnerlists.foodname}
										&nbsp;&nbsp;&nbsp; ${dinnerlists.calorie } Kcal</li>
								</c:forEach>
							</ul>
							<div class="pricing-footer">
								<a href="#" class="btn db-button-color-square btn-lg">ADD &
									MODIFY</a>
							</div>
						</div>
					</div>
				</div>
			</div>





		</div>

	</div>
</body>
<html>
<%@page import="org.springframework.web.context.annotation.RequestScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>

<head>
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<style type="text/css">
.panel {
	background-color: #FFFFFF;
	border: 1px solid rgba(0, 0, 0, 0);
	border-radius: 4px 4px 4px 4px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
	margin-bottom: 20px;
}

.panel-primary {
	border-color: #428BCA;
}

.panel-primary>.panel-heading {
	background-color: #428BCA;
	border-color: #428BCA;
	color: #FFFFFF;
}

.panel-heading {
	border-bottom: 1px solid rgba(0, 0, 0, 0);
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	padding: 10px 15px;
}

.panel-title {
	font-size: 16px;
	margin-bottom: 0;
	margin-top: 0;
}

.panel-body:before, .panel-body:after {
	content: " ";
	display: table;
}

.panel-body:before, .panel-body:after {
	content: " ";
	display: table;
}

.panel-body:after {
	clear: both;
}

.panel-body {
	padding: 15px;
}

.panel-footer {
	background-color: #F5F5F5;
	border-bottom-left-radius: 3px;
	border-bottom-right-radius: 3px;
	border-top: 1px solid #DDDDDD;
	padding: 10px 15px;
}

//
CSS from v3 snipp
.user-row {
	margin-bottom: 14px;
}

.user-row:last-child {
	margin-bottom: 0;
}

.dropdown-user {
	margin: 13px 0;
	padding: 5px;
	height: 100%;
}

.dropdown-user:hover {
	cursor: pointer;
}

.table-user-information>tbody>tr {
	border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information>tbody>tr:first-child {
	border-top: 0;
}

.table-user-information>tbody>tr>td {
	border-top: 0;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var panels = $('.user-infos');
						var panelsButton = $('.dropdown-user');
						panels.hide();

						//Click dropdown
						panelsButton
								.click(function() {
									//get data-for attribute
									var dataFor = $(this).attr('data-for');
									var idFor = $(dataFor);

									//current button
									var currentButton = $(this);
									idFor
											.slideToggle(
													400,
													function() {
														//Completed slidetoggle
														if (idFor
																.is(':visible')) {
															currentButton
																	.html('<i class="icon-chevron-up text-muted"></i>');
														} else {
															currentButton
																	.html('<i class="icon-chevron-down text-muted"></i>');
														}
													})
								});

						$('[data-toggle="tooltip"]').tooltip();

						$('button').click(function(e) {
							e.preventDefault();
							alert("This is a demo.\n :-)");
						});
					});
</script>
</head>

<body>
	<!-- header Section -->
	<jsp:include page="./../header.jsp" />
	<section class="breadcrumb-section set-bg"
		data-setbg="<%=request.getContextPath()%>/resources/img/breadcrumb/classes-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<h2>
							<i class="fa fa-camera" aria-hidden="true"></i> 식단
						</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- header Section End -->












	<br>
	<br>
	<div class="container">
		<div class="well span8 offset2">






			<c:forEach var="lists" items="${requestScope.lists}">
				<div class="row-fluid user-row">
					<div class="span1">
						<img class="img-circle"
							src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
							alt="User Pic">
					</div>
					<div class="span10">
						<strong>${lists.id }</strong><br>
						<span class="text-muted"> 
						
						<!-- 루틴 번호에 따른 루틴이름 표시 --> 
						<c:set var="ro_id" value="${lists.ro_id}" />
						<c:choose>
								<c:when test="${ro_id==3}">
									User Routine: 초급
								</c:when>

								<c:when test="${ro_id==4}">
									User Routine: 중급
								</c:when>
								
								<c:when test="${ro_id == 5}">
									User Routine: 고급
								</c:when>
								
								<c:otherwise>
									루틴을 부여해주세요.
								</c:otherwise>
						</c:choose>
						
						</span>
					</div>
					<div class="span1 dropdown-user" data-for=".${lists.id}">
						<i class="icon-chevron-down text-muted"></i>
					</div>
				</div>
				<div class="row-fluid user-infos ${lists.id}">
					<div class="span10 offset1">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">User information</h3>
							</div>
							<div class="panel-body">
								<div class="row-fluid">
									<div class="span3">
										<img class="img-circle"
											src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
											alt="User Pic">
									</div>
									<div class="span6">
										<strong>${lists.name }</strong><br>
										<table
											class="table table-condensed table-responsive table-user-information" >
												<tr>
													<td>Id &nbsp;&nbsp;&nbsp;: </td>
													<td colspan="10"> ${lists.id } </td>
												</tr>
												<tr>
													<td>PassWord:</td>
													<td>${lists.password }</td>
												</tr>
												<tr>
													<td>닉네임</td>
													<td>${lists.nickname }</td>
												</tr>
												<tr>
													<td>성별</td>
													<td>${lists.gender }</td>
												</tr>
												<tr>
													<td>생년월일</td>
													<td>${lists.birth }</td>
												</tr>
												<tr>
													<td>키</td>
													<td>${lists.height }cm</td>
												</tr>
												<tr>
													<td>이메일</td>
													<td>${lists.email }</td>
												</tr>
												<tr>
													<td>주소</td>
													<td>${lists.address1 }</td>
												</tr>
												<tr>
													<td>운동 경력(month)</td>
													<td>${lists.career}</td>
												</tr>
												
										</table>
									</div>
								</div>
							</div>
							<div class="panel-footer">
								<button class="btn  btn-primary" type="button"
									data-toggle="tooltip"
									data-original-title="Send message to user">
									<i class="icon-envelope icon-white"></i>
								</button>
								<span class="pull-right">
									<button class="btn btn-warning" type="button"
										data-toggle="tooltip" data-original-title="Edit this user">
										<i class="icon-edit icon-white"></i>
									</button>
									<button class="btn btn-danger" type="button"
										data-toggle="tooltip" data-original-title="Remove this user">
										<i class="icon-remove icon-white"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>






		</div>
	</div>
	<div align="center">${requestScope.pagingHtml}</div>

























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
			<div class="subscribe-option set-bg"
				data-setbg="<%=request.getContextPath()%>/resources/img/footer-signup.jpg">
				<div class="so-text">
					<h4>Subscribe To Our Mailing List</h4>
					<p>Sign up to receive the latest information</p>
				</div>
				<form action="#" class="subscribe-form">
					<input type="text" placeholder="Enter Your Mail">
					<button type="submit">
						<i class="fa fa-send"></i>
					</button>
				</form>
			</div>
			<div class="copyright-text">
				<ul>
					<li><a href="#">Term&Use</a></li>
					<li><a href="#">Privacy Policy</a></li>
				</ul>
				<p>&copy;
				<p>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="fa fa-heart" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
				</p>
				<div class="footer-social">
					<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
						class="fa fa-twitter"></i></a> <a href="#"><i
						class="fa fa-instagram"></i></a> <a href="#"><i
						class="fa fa-dribbble"></i></a>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/mixitup.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.slicknav.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/masonry.pkgd.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>
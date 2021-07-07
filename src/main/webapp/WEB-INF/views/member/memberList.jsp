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
.alert 
{
background-position: 2% 7px;
background-repeat: no-repeat;
background-size: auto 35px;
background-color: rgba(0, 0, 0, 0);
border: 0;
min-width: auto !important;
text-align: left;
padding-left: 68px;
}
.alert.alert-danger {
background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAARVBMVEX////7y0P7y0P7y0P7y0P7y0P7y0P7y0P7y0P7y0P7y0P7y0P7y0P7y0P7y0NAQECdhUHYsUKGdEG1l0JLSEBuYkHkukPKU8NPAAAADnRSTlMA4EDAoCAQ8IBgkDDQUFItelQAAAC0SURBVHherZBLDsMwCAVD7Nj5gvPr/Y/a0FpGLTibdnbozQJN829agPZu7/CiuxE8C76+T/hiqgruLbjqh5ip/TljZrb3AQuDKYAIYO09L3TBRq/3EHk4shCDEkZkTqITmdGMLIIO7r8FbzfaiDappSNjIkpZcCqyCDo4WAJYkR8prTp4ADSBUCIX9uPY5epL5AJdyBWDRDYFHCWyCiXBObKwrh+nl4g2TiLVhSXW97g0v/MEHIQbCYeFmYAAAAAASUVORK5CYII=);
border-top: 1px solid rgba(140, 0, 0, 0.4);
border-bottom: 1px solid rgba(140, 0, 0, 0.4);
}
.alert.alert-info {
background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAADBklEQVR42u3YyWsTURwHcP8aQUWtWlu7JEbtpngQvIqXevDWm1fXehO12BTErdQiVMFQ8ODBusWkmSa1lVrTxdrG0FA9WJtkljfL19/LTDKMibl0EorkwReSCQ8+fN+bl2G2AdhSqYH+P1CpAS0DfXUI+ufzUCfaoQptYMIxsMhRsE/d0L4/BNR0qcnug4y159CmTkOLdkKNdnBQAaNEjkAZ90EOH4YcOQ51dQQVBRnLN6DHuqDFOqGZGEpbaVDICynkAVvoRUVAxuqQE8PjXC7C/AX64KG0gq3ch6sgQ1zkEBtTph2FY8JeApkYKdgCMdgMPTMP10D64kUOsTDtDsw/27FAIge9b4Y8e8EdELS0jTAh5TF2Ow5Q9l0TDDWNTYOMjSkLQREcEAdGCRfvHdFcLgI1EegQtPXY5kFactAE2JDyGHvvONrhILZ81w3QIxNQCEfw2JvYxpRYKrMdSqNLoNSzPMBGTJwEmz4HuSSGMnkWYrgjv1Rm3jZATQ5vHqT//sgRVhtmI8p0NwADbOF6EUaOX4GiZCHGzhAkD2ogUD20XxNw5baXhRN2G2EvR+QwhqFDme91YJgiQfpyCTamkTAHaQm97p1DauIBR1jxWI14CHMNuqZCmbsKmcKYBLkYQzkA9m3APRA/P6TxrvztbCfYkoOoqgKVydTQ5ZIYMdgKQ91wD8SHvj7JAYXb2T5jmqEkhiEnHnNIESb7po72joCK/Ntray8sRD7UBkVeGoBEIQilwYFRUwFU9HmIrdzjCHtpKNJXP48FqSfIfspe2jf+Sj4P2UOMnOKQfCOE6Ye0eMdqZR+yr/fwc8icXA2QmnzCD7pCI+JiH8SFPt4KYXYjO7YTLDFYPZCensu3QakjzC2I8zcJsguZsR3IvNoOfWO2eiA+tJ9jfI9Q+qEkn1JGoCz1UW5D+/HSnFhNUCqVQjwezyUajSIUChW+02/VB42OjqJMaqCtB5qZmUEgEIDf73eEXxMEofogPtLpNHp6euDz+Xhyn+lauUm1tx81UMXzBw5wT9JYWi53AAAAAElFTkSuQmCC);
border-top:1px solid rgba(255, 165, 0,0.4);
border-bottom:1px solid rgba(255, 165, 0,0.4);
color:  rgb(225, 75, 0);
margin-bottom: -23px;
text-align: center;
background-position-x: 376px;
}
.alert.alert-success {
background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAqFBMVEX////w8PDw8PDw8PDw8PDw8PDw8PDw8PDW1tbn5+ff398PnVjd3d3i4uIPnVjk5OQPnVjg4OAPnVgzqW8PnVgPnVjT09Pw8PDG4NOp1sBjvJHu7u4PmVYqp2ri6+YcomFHsn4bmlzHzsoPnFeuxbl9tJk0n2t/xqSVvqqNzK1ZqYKJuaJVt4c4rHQnnWPl5eXj4+MPm1fe3t6b0bfc3NxBo3TY2NjX19eKj23kAAAAFXRSTlMA8BCwcFCgkP4f3NDnrzCHoM8Qc/Avz3otAAAA9klEQVR4Xq2T2XKDMAwAMRACNGdbyUDus/d9/f+f1VHEiFamfcm+7qIZGTs4IWEcGeswURz6dGIbJCrp0MeC6QTBCADO2Hetokv+vNXbyvnLAc9v8cA+NH4/veAFEr/f7HIe0OJvETMKYhLlLw8fiNinICKxnHHCfr92QY8CcwwAloX41cFjSoElCnBU89pvkeCAeAPH4or89Bp1YG+g5uUOPQEP5wWbgZzjPRDiU1mTmD/wggyvGVspZgCP4rGvjrpYuAWFTP+sounzwPO7n8SnNEBdmGesGZLUV+6V/ZilLt7F+6/95BMxHf71cCZfefbf0zsl3w3QOjVy6QFpAAAAAElFTkSuQmCC);
border-top:1px solid limegreen;
border-bottom:1px solid limegreen;
}
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
						<i class="far fa-file-alt"></i>
							<i class="fa fa-address-book"></i> 회원 리스트
						</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- header Section End -->
	
	<c:set var="valid" value="${requestScope.valid}" />
	<c:if test="${valid == 2}">
		<div class="container">
			<div class="alert alert-info">새로 등록된 회원이 있습니다. 루틴을 정해주세요!</div>
		</div>
	</c:if>
	<br>
	<br>
	<div class="container">
		<div class="well span8 offset2">
		
			<!-- 회원 리스트 for문으로 모두 출력 -->
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
													<td> ${lists.id } </td>
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
												<tr>
													<td>목표 기간(Week)</td>
													<td>${lists.period}</td>
												</tr>
												<tr>
													<td>목표 몸무게</td>
													<td>${lists.aim_weight}kg</td>
												</tr>
												<tr>
													<td>보유 포인트</td>
													<td>${lists.point} &nbsp;&nbsp; Point</td>
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
									onclick="window.open('<%=contextPath%>/rogive.me?&mem_id=${lists.id}&nickname=${lists.nickname }','window팝업','width=600, height=500');"
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
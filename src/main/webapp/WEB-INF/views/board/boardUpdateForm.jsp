<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<% int twelve = 12 ; %>
<c:set var="twelve" value="12" />
<%
	int myoffset = 2;
	int mywidth = twelve - 2 * myoffset;
	int formleft = 3 ;
	int formright = twelve - formleft ; 
%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<title>BootStrap Sample</title>
	<style type="text/css">
		.form-group{ margin-bottom : 3px; }
	</style>
</head>

<body>
	<jsp:include page="./../header.jsp"/>
	
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
    
	<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default panel-primary">
			<div class="panel-heading"><h4>후기 수정</h4></div>
			<div class="panel-body">
				<c:set var="apppath" value="<%=request.getContextPath()%>" />
				<form:form modelAttribute="board" class="form-horizontal" role="form" action="${apppath}/brupdate.br"
					method="post" enctype="multipart/form-data">
					
					<input type="hidden" name="mem_id" id="mem_id"
								value="${sessionScope.loginfo.id}" />
					<input type="hidden" name="bo_id" id="bo_id"
								value="${bean.bo_id}" />			
								
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="title">제목</label>
						<div class="col-sm-<%=formright%>">
							<input  type="text" class="form-control" name="title" id="title" value="${bean.title}" />
								<form:errors cssClass="err" path="title" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="abcd1">다이어트 전</label>
						<div class="col-sm-<%=formright%>">
							<input type="file" class="form-control" name="abcd1" value="${bean.be_image}"
								id="abcd1" placeholder="before 사진을 넣어주세요">
							<form:errors cssClass="err" path="be_image" />							
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="abcd2">다이어트 후</label>
						<div class="col-sm-<%=formright%>">
							<input type="file" class="form-control" name="abcd2" value="${bean.af_image}"
								id="abcd2" placeholder="after 사진을 넣어주세요">
							<form:errors cssClass="err" path="af_image" />							
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="context">후기</label>
						<div class="col-sm-<%=formright%>">
							<textarea rows="8" cols="30" class="form-control" name="context" id="context" value="${bean.context}"></textarea>
								<form:errors cssClass="err" path="context" />
						</div>
					</div>					
					<div class="form-group">
						<div align="center" class="col-sm-offset-3 col-sm-6">
							<button class="btn btn-default" type="submit">수정 완료</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-default" type="reset">초기화</button>
						</div>
					</div>
				</form:form>
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
    <script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>
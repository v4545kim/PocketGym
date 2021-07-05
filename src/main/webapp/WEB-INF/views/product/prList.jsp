<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function search(){
		if( $('#mode').val() == 'all' ){
			alert('검색 목록을 선택해주세요') ;
		}
	}
</script>
	<style type="text/css">
	.single-blog-item{
		text-align: center;
	}
	form { 
       margin: 0 auto; 
       width:700px;
   	}
   	#input1{
   		width: 300px;
   		height: 50px;
   		border-top: none;
   		border-left: none;
   		border-right: none;
   		border-bottom: 3px solid black;
   	}  
   	#mode{
   		width: 150px;
   		height: 50px;
   		border-top: none;
   		border-left: none;
   		border-right: none;
   		border-bottom: 3px solid black;
   	}
   	#button1{
   		width: 100px;
   		height: 50px;
   		border-top: none;
   		border-left: none;
   		border-right: none;
   		border-bottom: 3px solid black;
   		background-color: black;
   		font-weight: bold;
   		color: white;
   	}
   	#button2{
   		width: 100px;
   		height: 50px;
   		border-top: none;
   		border-left: none;
   		border-right: none;
   		background-color: white;
   		font-weight: bold;
   		color: black;
   	}
	#category.dropdown-menu>li>a {
    color:black;
	}
	.dropdown ul#category.dropdown-menu{
		border-radius: 0px;
    	box-shadow: none;
    	margin-top: -2px;
    	margin-left: -1px;
    	width: 161px;
    	background-color: white;
	}
	.dropdown ul#category.dropdown-menu:before {
	    content: "";
	    border-bottom: 0;
	    border-right: 0;
	    border-left: 0;
	    position: absolute;
	    top: 50px;
	    right: 16px;
	    z-index: 10;
	}
	.dropdown ul#category.dropdown-menu:after {
	    content: "";
	    border-bottom: 0;
	    border-right: 0;
	    border-left: 0;
	    position: absolute;
	    top: 50px;
	    right: 14px;
	    z-index: 9;
	}
    	
   </style>
</head>

<body>
<jsp:include page="./../header.jsp" />
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
    <!-- Blog Section Begin -->
    <div class="panel-heading">
    	<form class="form-inline" role="form" name="myform" action="<%=contextPath%>/prlist.pr" method="get">
			<div class="form-group">
				<select class="form-control" name="mode" id="mode">
					<option value="all" selected="selected">-- 선택하세요 --
					<option value="title" >제목
				</select>
			</div>
			<div class="form-group">
				<input id="input1" type="text" class="form-control btn-xs" name="keyword" placeholder="검색 키워드">
			</div>
			<button id="button1" class="btn btn-default btn-warning" type="submit" onclick="search();">검색</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="dropdown category" style="width: 0px;">
					<button id="button2" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" style="width: 160px;">카테고리를 선택하세요
					</button>
					<ul class="dropdown-menu" id="category">
						<li><a href="<%=contextPath%>/prlist.pr?mode=category&keyword=음식">음식</a></li>
						<li><a href="<%=contextPath%>/prlist.pr?mode=category&keyword=기구">기구</a></li>
						<li><a href="<%=contextPath%>/prlist.pr?mode=category&keyword=의류">의류</a></li>
					</ul>
				</div>
		</form>
    </div>
    <section class="blog-section spad">
        <div class="container">
            <div class="row">
            	<c:forEach var="bean" items="${requestScope.lists}">
	                <div class="col-lg-4 col-md-6">
	                    <div class="single-blog-item">
							<a href="<%=contextPath%>/prdetail.pr?pr_id=${bean.pr_id}">
								<img src="<%=contextPath%>/upload/${bean.image}" alt="<%=contextPath%>/upload/${bean.image}">
							</a>
							<div class="blog-widget">
								<div class="bw-date">${bean.inputdate}</div>
							</div>
							<h5>
								<a style="color: black" href="<%=contextPath%>/prdetail.pr?pr_id=${bean.pr_id}">${bean.pr_name}</a>
							</h5>
	                    </div>
	                </div>
                </c:forEach>
            </div>
            <div align="center" style="font-size: 1.5em;">
				${requestScope.pagingHtml}<p class="form-control-static">${requestScope.pagingStatus}</p>
			</div>
        </div>
    </section>
    <br><br><br><br>
	<script type="text/javascript">
	   /* 방금 전 선택한 콤보 박스를 그대로 보여 주기 */ 
		$('#mode option').each(function (index){
			if( $(this).val() == '${requestScope.mode}' ){
				$(this).attr('selected', 'selected') ;
			}
		});	
		/* 이전에 넣었던 값 그대로 보존 */
		$('#keyword').val( '${requestScope.keyword}' ) ;		
	</script>	
    
    <!-- Blog Section End -->

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
</html>
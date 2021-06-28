<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
<style type="text/css">
    
.gallery-wrap .img-big-wrap img {
    height: 450px;
    width: auto;
    display: inline-block;
    cursor: zoom-in;
}


.gallery-wrap .img-small-wrap .item-gallery {
    width: 60px;
    height: 60px;
    border: 1px solid #ddd;
    margin: 7px 2px;
    display: inline-block;
    overflow: hidden;
}

.gallery-wrap .img-small-wrap {
    text-align: center;
}
.gallery-wrap .img-small-wrap img {
    max-width: 100%;
    max-height: 100%;
    object-fit: cover;
    border-radius: 4px;
    cursor: zoom-in;
}
</style>

<script type="text/javascript">
	function checkCart() {
		if(${sessionScope.loginfo.id == null}){
			alert('미로그인 상태입니다.\n로그인을 진행해주세요.')
			return false;
		}
		
		var count = document.myform.count.value ;
		var stock = ${bean.stock};
		
		if(count == 0){
			alert('수량을 선택하세요.')
			document.myform.count.focus() ;
			return false;
		}
		
		if(stock < count){
			alert('재고가 부족합니다.')
			return false;
		} else{
			alert('장바구니에 담았습니다.')
			return false;
		}
	}
</script>

</head>
<body>
	<jsp:include page="./../header.jsp"/>
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
	
	
    <br>


	<div class="card">
		<div class="row">
			<aside class="col-sm-5 border-right">
				<article class="gallery-wrap">
					<div class="img-big-wrap">
						<div>
							<img src="${bean.image}" alt="${bean.image}">
						</div>
					</div>
				</article>
			</aside>
			<aside class="col-sm-7">
				<article class="card-body p-5">
					<h3 class="title mb-3">제품명 : ${bean.pr_name} </h3>
					<dl class="item-property">
						<dt>상품설명</dt>
						<dd>${bean.context}</dd>
					</dl>
					<p class="price-detail-wrap">
						<span class="price h3 text-warning">
							<span class="num">가격 : ${bean.price}</span>
						</span>
					</p>
					<dl class="param param-feature">
						<dt>재고 수량 : </dt>
						<dd>${bean.stock}</dd>
					</dl>
					<hr>
					<c:set var="apppath" value="<%=request.getContextPath()%>" />
					<form:form action="${apppath}/prcart.pr" method="post" name="myform">
						<input type="hidden" value="${bean.pr_id}" name="pr_id">
						<input type="hidden" value="${sessionScope.loginfo.id}" name="mem_id">
						<div class="row">
							<div class="col-sm-5">
								<dl class="param param-inline">
									<dt>
										구매 수량 : <input type="number" name="count" id="count" value="0">
									</dt>
								</dl>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-5">
								<dl class="param param-inline">
									<dt>
										<button type="submit" class="btn btn-default"><i class="fa fa-calculator">구매하기</i></button>
										<button type="submit" class="btn btn-default" onclick="checkCart()"><i class="fa fa-shopping-basket"></i>장바구니</button>
									</dt>
								</dl>
							</div>
						</div>
					</form:form>
				</article>
			</aside>
		</div>
	</div>
	
	<br>

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
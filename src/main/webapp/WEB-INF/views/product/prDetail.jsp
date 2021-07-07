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
.card {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0,0,0,.125);
    border-radius: .25rem;
    width: 70%;
    margin: auto;
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
			document.myform.count.focus() ;
			return false;
		} else{
			alert('장바구니에 담았습니다.')
			return false;
		}
	}
	
	function checkBuy(){
		if(${sessionScope.loginfo.id == null}){
			alert('미로그인 상태입니다.\n로그인을 진행해주세요.')
			location.href='<%=request.getContextPath()%>/login.me'
			return false;
		}
		
		var count = document.myform.count.value ;
		var stock = ${bean.stock};
		
		if(count == 0){
			alert('수량을 선택하세요.')
			document.myform.count.focus() ;
			return false;
		}
		
		var mem_id = document.myform.mem_id.value ;
		var pr_id = document.myform.pr_id.value ;
		
		if(stock < count){
			alert('재고가 부족합니다.')
			return false;
		} else{
			alert('구매 페이지로 넘어갑니다.')
			location.href='<%=request.getContextPath()%>/prbuy2.pr?mem_id=' + mem_id + '&pr_id=' + pr_id +'&count=' + count
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
			<aside class="col-sm-7 border-right">
				<article class="gallery-wrap">
					<div class="img-big-wrap">
						<div>
							<img src="<%=contextPath%>/upload/${bean.image}" alt="<%=contextPath%>/upload/${bean.image}">
						</div>
					</div>
				</article>
			</aside>
			<aside class="col-sm-5">
				<article class="card-body p-5">
					<h4 class="title mb-3">상품명 : ${bean.pr_name}</h4>
					<h4 class="title mb-3">상품 설명 : ${bean.context}</h4>
					<h4 class="title mb-3">재고 수량 : ${bean.stock}</h4>
					<h4 class="title mb-3">가격 : ${bean.price}(P)</h4>
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
							<div class="col-sm-8">
								<dl class="param param-inline">
									<dt>
										<c:if test="${whologin == 1}">
											<button type="button" class="btn btn-default"><i class="fa fa-calculator" onclick="checkBuy();">구매하기</i></button>
											<button type="submit" class="btn btn-default" onclick="checkCart();"><i class="fa fa-shopping-basket"></i>장바구니</button>
										</c:if>
										<c:if test="${whologin == 2}">
											<a href="<%=contextPath%>/update.pr?pr_id=${bean.pr_id}" class="btn btn-success">수정</a>
											<a href="<%=contextPath%>/delete.pr?pr_id=${bean.pr_id}" class="btn btn-danger">삭제</a>
										</c:if>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html>

<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style type="text/css">
body {
    background: grey;
    margin-top: 120px;
    margin-bottom: 120px;
}
.black-font{
    color: black;
}
#point {
    font-size: 50px;
    margin-top: -8px;
    margin-bottom: 10px;
}
</style>

<script type="text/javascript">
	function goList() {
		location.href='<%=request.getContextPath()%>/prlist.pr'
	}
	
	function goMain() {
		location.href='<%=request.getContextPath()%>/main.ma'
	}
</script>

</head>

<body>
<jsp:include page="./../header.jsp"/>

	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/breadcrumb/classes-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2><i class="fa fa-credit-card"></i>결제 완료</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

	<br>
	<br>

	<div class="container">
	    <div class="row">
	        <div class="col-12">
	            <div class="card">
	                <div class="card-body p-0">
	                    <div class="row p-5">
	                        <div class="col-md-12">
	                            <table class="table">
	                                <thead>
	                                    <tr>
	                                        <th class="border-0 text-uppercase small font-weight-bold">상품 번호</th>
	                                        <th class="border-0 text-uppercase small font-weight-bold">상품명</th>
	                                        <th class="border-0 text-uppercase small font-weight-bold">상품 설명</th>
	                                        <th class="border-0 text-uppercase small font-weight-bold">수량</th>
	                                        <th class="border-0 text-uppercase small font-weight-bold">가격</th>
	                                        <th class="border-0 text-uppercase small font-weight-bold">총 가격</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach items="${requestScope.cartlists}" var="list">
		                                    <tr>
		                                        <td>${list.pr_id}</td>
		                                        <td>${list.pr_name}</td>
		                                        <td>${list.context}</td>
		                                        <td>${list.count}</td>
		                                        <td>${list.price}</td>
		                                        <td>${list.total_price}(P)</td>
		                                    </tr>
	                                    </c:forEach>
	                                </tbody>
	                            </table>
	                            <div class="d-flex flex-row-reverse bg-dark text-white">
	                        		<div class="py-3 px-5 text-center">
	                        			<div class="mb-2">잔여 포인트 : ${requestScope.mem_info.point}(P)</div>
	                            		<div class="mb-2">총 가격(p) : ${total_price}(P)</div>
	                            		<div class="h2 font-weight-light" id="point"></div>
	    		                        <div class="mb-2">
	    		                        	<button type="button" onclick="goList();" class="btn btn-light">쇼핑 더하기</button>
	    		                        	<button type="button" onclick="goMain();" class="btn btn-light">메인으로</button>
	    		                        </div>
	                        		</div>
	                        		<div class="py-3 px-5 text-right">
	    		                        <div class="mb-2">주문 하시는 분 : ${requestScope.mem_info.nickname}</div>
	    		                        <div class="mb-2">
                                				배송지 : ${requestScope.mem_info.address1}<br>
                                				${requestScope.mem_info.address2}
                                				<br>
	    		                        </div>
									</div>
	                    		</div>
	                        </div>
	                    </div>
	                    <hr class="my-5">
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

	
	<br>
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
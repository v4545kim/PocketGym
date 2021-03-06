<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html>

<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="jquery.validate.js"></script>

<style type="text/css">
body {
    background: grey;
    margin-top: 120px;
    margin-bottom: 120px;
}
.black-font{
    color: black;
}
</style>

<script type="text/javascript">
function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("sample6_address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("sample6_detailAddress").focus();
		}
	}).open();
}

	function checkBuy2(){
		var point = ${requestScope.mem_info.point}
		var price = document.myform.total_price.value
		
		if(price > point){
			alert('보유 포인트가 부족합니다.')
			return;
		} else{
			document.myform.action="<%=request.getContextPath()%>/prbuy2.pr"
			document.myform.submit();
		}
	};
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
                        <h2><i class="fa fa-calculator"></i>구매하기</h2>
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
	                    <form action="<%=request.getContextPath()%>/prbuy2.pr" method="post" name="myform">
	                    	<input type="hidden" name="pr_id" value="${product.pr_id}">
	                    	<input type="hidden" name="count" value="${order.count}">
	                    	<input type="hidden" name="total_price" value="${order.total_price}">
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
		                                    <tr>
		                                        <td>${product.pr_id}</td>
		                                        <td>${product.pr_name}</td>
		                                        <td>${product.context}</td>
		                                        <td>${order.count}</td>
		                                        <td>${product.price}</td>
		                                        <td>${order.total_price}(P)</td>
		                                    </tr>
		                                </tbody>
		                            </table>
		                            <div class="d-flex flex-row-reverse bg-dark text-white">
		                        		<div class="py-3 px-5 text-center">
		                        			<div class="mb-2">보유 포인트 : ${requestScope.mem_info.point}(P)</div>
		                            		<div class="mb-2">총 가격(p) : ${order.total_price}(P)</div>
		    		                        <div class="mb-2">
		    		                        	<button type="button" onclick="history.back(-1);" class="btn btn-light">뒤로가기</button>
		    		                        	<button type="button" onclick="checkBuy2();" class="btn btn-light">결제하기</button>
		    		                        </div>
		                        		</div>
		                        		<div class="py-3 px-5 text-right">
		    		                        <div class="mb-2">주문 하시는 분 : ${requestScope.mem_info.nickname}</div>
		    		                        <div class="mb-2">
                                 				배송지 : <input type="text" id="sample6_address" name="address1" placeholder="주소" value="${requestScope.mem_info.address1}" readonly="readonly" class="black-font"><br>
                                 				<input type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소" value="${requestScope.mem_info.address2}" class="black-font">
                                 				<br>
                                 				<input type="button" onclick="sample6_execDaumPostcode()" value="배송지 변경" class="btn btn-light"><br>
		    		                        </div>
										</div>
		                    		</div>
		                        </div>
		                    </div>
	                    </form>
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
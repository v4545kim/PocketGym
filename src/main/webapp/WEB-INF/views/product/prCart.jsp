<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<style type="text/css">
.table>tbody>tr>td, .table>tfoot>tr>td{
   vertical-align: middle;
}
@media screen and (max-width: 600px) {
    table#cart tbody td .form-control{
		width:20%;
		display: inline !important;
	}
	.actions .btn{
		width:36%;
		margin:1.5em 0;
	}
	
	.actions .btn-info{
		float:left;
	}
	.actions .btn-danger{
		float:right;
	}
	
	table#cart thead { display: none; }
	table#cart tbody td { display: block; padding: .6rem; min-width:320px;}
	table#cart tbody tr td:first-child { background: #333; color: #fff; }
	table#cart tbody td:before {
		content: attr(data-th); font-weight: bold;
		display: inline-block; width: 8rem;
	}
	
	
	
	table#cart tfoot td{display:block; }
	table#cart tfoot td .btn{display:block;}
	
}
</style>
</head>

<body>
	<jsp:include page="./../header.jsp"/>
	
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/breadcrumb/classes-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2><i class="fa fa-shopping-basket"></i>장바구니</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <br>

	<div class="container">
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 50%">상품</th>
					<th style="width: 10%">가격</th>
					<th style="width: 8%">구매 수량</th>
					<th style="width: 22%" class="text-center">총 가격</th>
					<th style="width: 10%">삭제</th>
				</tr>
			</thead>
			<c:forEach items="${requestScope.cartlists}" var="list">
				<tbody>
					<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-10">
									<h4 class="nomargin">
										<a href="<%=contextPath%>/prdetail.pr?pr_id=${list.pr_id}" style="color: black">${list.pr_name}</a>
									</h4>
								</div>
							</div>
						</td>
						<td >${list.price}</td>
						<td >${list.count}</td>
						<td class="text-center">${list.total_price}</td>
						<td class="actions" data-th="">
							<a href="<%=contextPath%>/prcartdelete.pr?cart_id=${list.cart_id}" class="btn btn-danger">
								<i class="fa fa-trash-o"></i>
							</a>
						</td>
					</tr>
				</tbody>
			</c:forEach>
			<tfoot>
				<tr>
					<td>
						<a href="<%=contextPath%>/prlist.pr" class="btn btn-warning">
							<i class="fa fa-angle-left"></i> 쇼핑 더하기
						</a>
					</td>
					<td colspan="3" class="hidden-xs"></td>
					<td>
						<a href="<%=contextPath%>/prbuy.pr?mem_id=${sessionScope.loginfo.id}" class="btn btn-success btn-block">
							구매하기<i class="fa fa-angle-right"></i>
						</a>
					</td>
				</tr>
			</tfoot>
		</table>
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
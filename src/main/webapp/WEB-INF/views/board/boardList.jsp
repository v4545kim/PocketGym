<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<script type="text/javascript">
		var mode = $('#mode').val();
		var keyword = $('#keyword').val();
		
		function writeForm(){
			location.href='<%=contextPath%>/brinsert.br';
		}
		function search(){
			if( mode == 'all' ){
				alert('검색 영역을 선택해주세요') ;
			}else if(keyword==""){
				alert('검색어를 입력해주세요') ;
			}else{
				location.href='<%=contextPath%>/brlist.br?mode='+ mode +'&keyword='+keyword;
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
    	#button{
    		width: 100px;
    		height: 50px;
    		border-top: none;
    		border-left: none;
    		border-right: none;
    		border-bottom: 3px solid black;
    		background-color: black;
    		font-weight: bold;
    	}
    	#button2{
    		width: 100px;
    		height: 50px;
    		border-top: none;
    		border-left: none;
    		border-right: none;
    		border-bottom: 3px solid black;
    		background-color: black;
    		font-weight: bold;
    	
    </style>	
</head>

<body>

<jsp:include page="./../header.jsp" />
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%=contextPath %>/resources/img/breadcrumb/classes-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2><i class="fa fa-camera" aria-hidden="true"></i> 커뮤니티</h2>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <!-- Blog Section Begin -->
    <div class="panel-heading">
    	<form class="form-inline" role="form" name="myform" action="<%=contextPath%>/brlist.br" method="get">
							<div class="form-group" >
								<div class="form-group">
								<select class="form-control" name="mode" id="mode">
									<option value="all" selected="selected">-- 선택하세요--
									<option value="mem_id" >작성자 아이디
									<option value="title" >제목									
									<option value="context" >글 내용									
								</select>
								</div>
								<div class="form-group">
									<input id="input1" type="text" class="form-control btn-xs" name="keyword"
										placeholder="검색 키워드">
								</div>
								<div class="form-group">
									<button id="button" class="btn btn-default btn-warning" type="submit" onclick="search();">검색</button>
									<button id="button2" class="btn btn-default btn-info" type="button"
										onclick="writeForm();">글 쓰기</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</div>
								<div class="form-group">
									<p class="form-control-static">${requestScope.pagingStatus}</p>
								</div>
							</div>
								
		</form>
    </div>
    <section class="blog-section spad">
        <div class="container">
            <div>
            <p style="font-size: 24px; font-weight: bold; color:#000080; 
                            	font-family:arial; line-height: 40px;">
            	인기순 top 3 후기
            </p>
            	<c:forEach var="bean2" items="${requestScope.lists2}">
	                <div class="col-lg-4 col-md-6" style="width: 500px; height: 500px; vertical-align: middle; display: table; ">
	                    <div class="single-blog-item" style="display: table-cell; vertical-align: middle;">
	                        <c:choose>
							<c:when test="${whologin!=0 }">  
		                        <a href="<%=contextPath%>/readhitinsert.br?bo_id=${bean2.bo_id}&mem_id=${sessionScope.loginfo.id}&bomem_id=${bean2.mem_id}">
		                        	<img src="<%=contextPath%>/upload/${bean2.af_image}" alt="no image" height="300"  width="300" >
								</a>
							
								<h5>																
									<a href="<%=contextPath%>/readhitinsert.br?bo_id=${bean2.bo_id}&mem_id=${sessionScope.loginfo.id}&bomem_id=${bean2.mem_id}">
										<font size="5"> ${bean2.title}</font>
									</a>
								</h5>
								<div class="blog-widget">
									<c:if test="${sessionScope.loginfo.id == bean2.mem_id}">
										<div><a href="<%=contextPath%>/detail.me" class="tag"><b>${bean2.mem_id}<b></a></div>
									</c:if>
									
									<c:if test="${sessionScope.loginfo.id != bean2.mem_id}">
										<div><a href="<%=contextPath%>/otherdetail.me?mem_id=${bean2.mem_id}" class="tag"><b>${bean2.mem_id}<b></a></div>
									</c:if>
									<div class="bw-date">${bean2.regdate}</div>
								</div>
							</c:when>
							
							<c:when test="${whologin==0 }">  
		                        <a href="<%=contextPath%>/login.me">
		                        	<img src="<%=contextPath%>/upload/${bean2.af_image}" alt="no image" height="300"  width="300" >
								</a>
								<h5>																
									<a href="<%=contextPath%>/login.me">
										<font size="5"> ${bean2.title}</font>
									</a>
								</h5>
								<div class="blog-widget">
									<div><a href="<%=contextPath%>/login.me" class="tag"><b>${bean2.mem_id}<b></a></div>
									<div class="bw-date">${bean2.regdate}</div>
								</div>
							</c:when>
							</c:choose>
							
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <hr style="border:2px solid#878787; height: 1px !important; display: orange !important; width: 50% !important;"/>
    <section class="blog-section spad">
        <div class="container">
            <div>
            	<c:forEach var="bean" items="${requestScope.lists}">
	                <div class="col-lg-4 col-md-4" style="width: 500px; height: 500px; vertical-align: middle; display: table; ">
	                    <div class="single-blog-item" style="display: table-cell; vertical-align: middle;">
		                   	<c:choose>
								<c:when test="${whologin!=0 }">   
			                        <a href="<%=contextPath%>/readhitinsert.br?bo_id=${bean.bo_id}&mem_id=${sessionScope.loginfo.id}&bomem_id=${bean.mem_id}">
			                        	<img src="<%=contextPath%>/upload/${bean.af_image}" alt="no image" height="300"  width="300" >
									</a>
									<h5>																
										<a href="<%=contextPath%>/readhitinsert.br?bo_id=${bean.bo_id}&mem_id=${sessionScope.loginfo.id}&bomem_id=${bean.mem_id}">
											<font size="5"> ${bean.title}</font>
										</a>
									</h5>
									<div class="blog-widget">
										<c:if test="${sessionScope.loginfo.id == bean.mem_id}">
											<div><a href="<%=contextPath%>/detail.me" class="tag"><b>${bean.mem_id}<b></a></div>
										</c:if>
										
										<c:if test="${sessionScope.loginfo.id != bean.mem_id}">
											<div><a href="<%=contextPath%>/otherdetail.me?mem_id=${bean.mem_id}" class="tag"><b>${bean.mem_id}<b></a></div>
										</c:if>
										<div class="bw-date">${bean.regdate}</div>
									</div>
								</c:when>	
								
								<c:when test="${whologin==0 }">  
									<a href="<%=contextPath%>/login.me">
			                        	<img src="<%=contextPath%>/upload/${bean.af_image}" alt="no image" height="300"  width="300" >
									</a>
									<h5>																
										<a href="<%=contextPath%>/login.me">
											<font size="5"> ${bean.title}</font>
										</a>
									</h5>
									<div class="blog-widget">
										<div><a href="<%=contextPath%>/login.me" class="tag"><b>${bean.mem_id}<b></a></div>
										<div class="bw-date">${bean.regdate}</div>
									</div>
								</c:when>
							</c:choose>
							                  	
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
        <div align="center" style="font-size: 1.5em;">
				${requestScope.pagingHtml}			
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
  
</head>

<body>
    <jsp:include page="./../header.jsp" />

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


    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="bd-text">
                        <div class="bd-pic">
                            <div class="row">
                                <div class="col-lg-6">
		                            <c:if test="${empty bean.be_image}">
										<img src="<%=uploadedFolder%>Koala.jpg" class="img-thumbnail"
											width="200" height="200" alt="no image">
									</c:if>						
									
									<c:if test="${applicationScope.debugMode == true}">
										디버그 모드가 true이면 보입니다.<br>
										${applicationScope.uploadedPath}/${bean.be_image}
									</c:if>								
									
									<c:if test="${not empty bean.be_image}">
										<img src="<%=contextPath%>/upload/${bean.be_image}"
											class="img-thumbnail" width="200" height="200"
											alt="${bean.be_image}">
									</c:if>
                                </div>
                                <div class="col-lg-6">
                                   <c:if test="${empty bean.af_image}">
										<img src="<%=uploadedFolder%>Koala.jpg" class="img-thumbnail"
											width="200" height="200" alt="no image">
									</c:if>						
									
									<c:if test="${applicationScope.debugMode == true}">
										디버그 모드가 true이면 보입니다.<br>
										${applicationScope.uploadedPath}/${bean.af_image}
									</c:if>								
									
									<c:if test="${not empty bean.af_image}">
										<img src="<%=contextPath%>/upload/${bean.af_image}"
											class="img-thumbnail" width="200" height="200"
											alt="${bean.af_image}">
									</c:if>
                                </div>
                            </div>
                        </div>
                        <div class="bd-title">
                            <p style="font-size: 24px; font-weight: bold; color:#000080; 
                            	font-family:arial; line-height: 40px;">
                            	${bean.context}
                            </p>
                        </div>
                        
                        
                        <div class="bd-quote">
                            <samp>"</samp>
                            <p>“운동 후기에 대한 자신의 생각을 남기고 </br> 마음에 드신다면 좋아요 버튼을 눌러보세요"</p>
                            <div class="quote-author">
                                <h5>PocketGym</h5>
                            </div>
                        </div>
                        
                        <div class="tag-share">
                        	<div class="social-share">
                        		<b>조회수 : ${readhits}<b>
                        	</div>
                        </div>
                        <div class="tag-share">
                        	
                           <c:if test="${sessionScope.loginfo.id == bean.mem_id}">
	                           <div class="social-share">
	                                <i class="fa fa-thumbs-up" aria-hidden="true"></i> &nbsp;${like}
	                                <a href="<%=contextPath%>/brupdate.br?bo_id=${bean.bo_id}"><b>수정<b></a>
	                                <a href="<%=contextPath%>/brdelete.br?bo_id=${bean.bo_id}"><b>삭제<b></a>
	                            </div>
                            </c:if>
                            <c:if test="${sessionScope.loginfo.id != bean.mem_id && whologin != 2}">
	                           <div class="social-share">
	                           <c:if test="${valid != 0}">
	                                <button type="button" class="btn btn-default btn-info" onclick="location.href='<%=contextPath%>/likeinsert.br?mem_id=${sessionScope.loginfo.id}&bo_id=${bean.bo_id}&bomem_id=${bean.mem_id}'">좋아요&nbsp;<i class="fa fa-thumbs-up" aria-hidden="true"></i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                           </c:if>
	                           <c:if test="${valid == 0}"> 
	                                <button type="button" class="btn btn-default btn-info" onclick="location.href='<%=contextPath%>/likedelete.br?mem_id=${sessionScope.loginfo.id}&bo_id=${bean.bo_id}&bomem_id=${bean.mem_id}'">좋아요 취소&nbsp;<i class="fa fa-thumbs-up" aria-hidden="true"></i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                           </c:if>     
	                                <i class="fa fa-thumbs-up" aria-hidden="true"></i> &nbsp;${like}
	                            </div>
                            </c:if>
                            <c:if test="${whologin == 2}">
	                           <div class="social-share">
	                           <c:if test="${valid != 0}">
	                                <button type="button" class="btn btn-default btn-info" onclick="location.href='<%=contextPath%>/likeinsert.br?mem_id=${sessionScope.loginfo.id}&bo_id=${bean.bo_id}&bomem_id=${bean.mem_id}'">좋아요&nbsp;<i class="fa fa-thumbs-up" aria-hidden="true"></i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                           </c:if>
	                           <c:if test="${valid == 0}">     
	                                <button type="button" class="btn btn-default btn-info" onclick="location.href='<%=contextPath%>/likedelete.br?mem_id=${sessionScope.loginfo.id}&bo_id=${bean.bo_id}&bomem_id=${bean.mem_id}'">좋아요 취소&nbsp;<i class="fa fa-thumbs-up" aria-hidden="true"></i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                           </c:if>     
	                                <i class="fa fa-thumbs-up" aria-hidden="true"></i> &nbsp;${like}
	                                <a href="<%=contextPath%>/brdelete.br?bo_id=${bean.bo_id}"><b>삭제<b></a>
	                            </div>
                            </c:if>
                            
                        </div>
                        <c:if test="${cnt != 0}">
                        <span id="more" style="CURSOR: hand" onclick="if(story.style.display=='none') 
                        	{story.style.display='';more.innerText='댓글 접기 ▲'} else {story.style.display='none';more.innerText='댓글 펼치기 ▼'}"><b>댓글 펼치기 ▼<b>                        
                        </span>
						<br>
							<div id="story" style="display: none">
		                        <c:forEach var="lists" items="${requestScope.lists}">
				                        <div class="bd-title">
				                            <div>
				                            <c:if test="${sessionScope.loginfo.id == lists.mem_id}">
					                            	<p style="font-size: 14px; font-weight: bold; color:#FFA500;">
					                            		<a href="<%=contextPath%>/detail.me" class="tag">
					                            		${lists.mem_id}
					                            		</a>
					                            	</p> 
				                            </c:if>	
				                            <c:if test="${sessionScope.loginfo.id != lists.mem_id}">
					                            	<p style="font-size: 14px; font-weight: bold; color:#FFA500;">
					                            		<a href="<%=contextPath%>/otherdetail.me?mem_id=${lists.mem_id}" class="tag">
					                            		${lists.mem_id}
					                            		</a>
					                            	</p> 
				                            </c:if>	
				                            		${lists.regdate}
				                            
				                            
				                            
				                            
				                            </div>
				                            <div><p>${lists.context}</p></div>
				                        </div>
				                        <c:if test="${sessionScope.loginfo.id == lists.mem_id}">
					                        <div class="social-share">
					                        	<button type="button" class="btn btn-info btn-circle" onclick="window.open('<%=contextPath%>/reupdate.br?bo_id=${lists.bo_id}&re_id=${lists.re_id}&mem_id=${lists.mem_id }&context=${lists.context}','window팝업','width=1000, height=600');"><i class="glyphicon glyphicon-pencil"></i></button>
				                                &nbsp;&nbsp;&nbsp;&nbsp;
				                                <a href="<%=contextPath%>/redelete.br?re_id=${lists.re_id}&bo_id=${lists.bo_id}&mem_id=${sessionScope.loginfo.id}">댓글 삭제</a>
					                        </div>
				                        </c:if>
				                        <c:if test="${whologin == 2}">
				                        	<a href="<%=contextPath%>/redelete.br?re_id=${lists.re_id}&bo_id=${lists.bo_id}&mem_id=${sessionScope.loginfo.id}">댓글 삭제</a>
				                        </c:if>
		                        </c:forEach>
	                        </div>
                        </c:if>
                        <c:if test="${cnt == 0}">
			            	<p style="font-size: 14px; font-weight: bold; "> 현재 작성된 댓글이 없습니다.</p>
			            </c:if>
                        
                        <div class="leave-comment">
                            <h3>Leave A Comment</h3>
                            <c:set var="apppath" value="<%=request.getContextPath()%>" />
                            <form method="post" name="replyform" action="${apppath}/reinsert.br">
                            	<input type="hidden" name="mem_id"  value="${sessionScope.loginfo.id}" />
								<input type="hidden" name="bo_id"  value="${bean.bo_id}" />
                                <div class="row">
                                <div class="col-lg-6">
                                        <input type="hidden" name="nickname" value="${sessionScope.loginfo.nickname}" />
                                    </div>
                                    <div class="col-lg-12">
                                        <textarea rows="8" cols="30" placeholder="Messages" name="context" ></textarea>
                                        <button type="submit">댓글 작성</button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <button type="button" onclick="history.back(-1);">뒤로가기</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->

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
    <script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/main.js"></script>
</body>

</html>
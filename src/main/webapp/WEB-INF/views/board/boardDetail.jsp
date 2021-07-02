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
										<img src="<%=contextPath%>/upload/${bean.be_image}"
											class="img-thumbnail" width="200" height="200"
											alt="${bean.af_image}">
									</c:if>
                                </div>
                            </div>
                        </div>
                        <div class="bd-title">
                            <p>${bean.context}</p>
                            
                        </div>
                        
                        
                        <div class="bd-quote">
                            <samp>"</samp>
                            <p>“운동 후기에 대한 자신의 생각을 남기고 </br> 마음에 드신다면 좋아요 버튼을 눌러보세요"</p>
                            <div class="quote-author">
                                <h5>PocketGym</h5>
                            </div>
                        </div>
                        
                        <div class="tag-share">
                           <c:if test="${sessionScope.loginfo.id == bean.mem_id}">
	                           <div class="social-share">
	                                <i class="fa fa-thumbs-up" aria-hidden="true"></i> &nbsp;${like}
	                                <a href="<%=contextPath%>/brupdate.br?bo_id=${bean.bo_id}">수정</a>
	                                <a href="<%=contextPath%>/brdelete.br?bo_id=${bean.bo_id}">삭제</a>
	                            </div>
                            </c:if>
                            <c:if test="${sessionScope.loginfo.id != bean.mem_id && whologin != 2}">
	                           <div class="social-share">
	                           <c:if test="${valid == 1}">
	                                <button type="button" class="btn btn-default btn-info" onclick="location.href='<%=contextPath%>/likeinsert.br?mem_id=${sessionScope.loginfo.id}&bo_id=${bean.bo_id}'">좋아요&nbsp;<i class="fa fa-thumbs-up" aria-hidden="true"></i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                           </c:if>
	                           <c:if test="${valid == 2}"> 
	                                <button type="button" class="btn btn-default btn-info" onclick="location.href='<%=contextPath%>/likedelete.br?mem_id=${sessionScope.loginfo.id}&bo_id=${bean.bo_id}'">좋아요 취소&nbsp;<i class="fa fa-thumbs-up" aria-hidden="true"></i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                           </c:if>     
	                                <i class="fa fa-thumbs-up" aria-hidden="true"></i> &nbsp;${like}
	                            </div>
                            </c:if>
                            <c:if test="${whologin == 2}">
	                           <div class="social-share">
	                           <c:if test="${valid == 1}">
	                                <button type="button" class="btn btn-default btn-info" onclick="location.href='<%=contextPath%>/likeinsert.br?mem_id=${sessionScope.loginfo.id}&bo_id=${bean.bo_id}'">좋아요&nbsp;<i class="fa fa-thumbs-up" aria-hidden="true"></i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                           </c:if>
	                           <c:if test="${valid == 2}">     
	                                <button type="button" class="btn btn-default btn-info" onclick="location.href='<%=contextPath%>/likedelete.br?mem_id=${sessionScope.loginfo.id}&bo_id=${bean.bo_id}'">좋아요 취소&nbsp;<i class="fa fa-thumbs-up" aria-hidden="true"></i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                           </c:if>     
	                                <i class="fa fa-thumbs-up" aria-hidden="true"></i> &nbsp;${like}
	                                <a href="<%=contextPath%>/brdelete.br?bo_id=${bean.bo_id}">삭제</a>
	                            </div>
                            </c:if>
                            
                        </div>
                        
                        <span id="more" style="CURSOR: hand" onclick="if(story.style.display=='none') 
                        	{story.style.display='';more.innerText='댓글 접기'} else {story.style.display='none';more.innerText='댓글 펼치기'}">댓글 펼치기
                        </span>
						<div id="story" style="display: none">
	                        <c:forEach var="lists" items="${requestScope.lists}">
		                        <!-- cif로 lists사이즈가 0이상이이면 쭉가고 0이면 현재 작성된댓글이 없습니다. -->
		                        <div class="bd-title">
		                            <p>${lists.mem_id}</p><div>${lists.regdate}</div>
		                            <p>${lists.context}</p>
		                        </div>
		                        <c:if test="${sessionScope.loginfo.id == lists.mem_id}">
			                        <div class="social-share">
			                        	<button type="button" class="btn btn-info btn-circle" onclick="window.open('<%=contextPath%>/reupdate.br?bo_id=${lists.bo_id}&re_id=${lists.re_id}&mem_id=${lists.mem_id }&context=${lists.context}','window팝업','width=1000, height=600');"><i class="glyphicon glyphicon-pencil"></i></button>
		                                &nbsp;&nbsp;&nbsp;&nbsp;
		                                <a href="<%=contextPath%>/redelete.br?re_id=${lists.re_id}&bo_id=${lists.bo_id}">댓글 삭제</a>
			                        </div>
		                        </c:if>
		                        <c:if test="${whologin == 2}">
		                        	<a href="<%=contextPath%>/redelete.br?re_id=${lists.re_id}&bo_id=${lists.bo_id}">댓글 삭제</a>
		                        </c:if>
	                        </c:forEach>
                        </div>
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

    <!-- Latest Blog Section Begin -->
    <section class="latest-blog-section recommend spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3>Recommended</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-1.jpg" alt="">
                        <div class="blog-widget">
                            <div class="bw-date">February 17, 2019</div>
                            <a href="#" class="tag">#Gym</a>
                        </div>
                        <h4><a href="#">10 States At Risk of Rural Hospital Closures</a></h4>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-2.jpg" alt="">
                        <div class="blog-widget">
                            <div class="bw-date">February 17, 2019</div>
                            <a href="#" class="tag">#Sport</a>
                        </div>
                        <h4><a href="#">Diver who helped save Thai soccer team</a></h4>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-blog-item">
                        <img src="<%=request.getContextPath() %>/resources/img/blog/blog-3.jpg" alt="">
                        <div class="blog-widget">
                            <div class="bw-date">February 17, 2019</div>
                            <a href="#" class="tag">#Body</a>
                        </div>
                        <h4><a href="#">Man gets life in prison for stabbing</a></h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->

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
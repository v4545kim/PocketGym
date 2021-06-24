<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./common.jsp"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="container">
            <div class="logo">
                <a href="<%=contextPath%>/main.ma">
                    <img src="<%=contextPath%>/resources/img/logo.png" alt="">
                </a>
            </div>
            <div class="nav-menu">
                <nav class="mainmenu mobile-menu">
                    <ul>
                        <li><a href="<%=contextPath%>/main.ma">Home</a></li>
                        <li><a href="<%=contextPath%>/mydietlist.di">식단</a></li>
                        <li><a href="<%=contextPath%>/myroutine.ro">운동</a></li>
                        <li><a href="<%=contextPath%>/brlist.br">sns</a></li>
                        <li><a href="<%=contextPath%>/prlist.pr">쇼핑몰</a></li>
                    </ul>
                </nav>
                
                <c:choose>
					<c:when test="${whologin==0 }">
                		<a href="<%=contextPath%>/login.me" class="primary-btn signup-btn">로그인</a>
            			<a href="<%=contextPath%>/insert.me" class="primary-btn signup-btn">회원가입</a>
            		</c:when>
            		<c:when test="${whologin !=0 }">
						<li class="primary-btn signup-btn" style="color: white">${sessionScope.loginfo.nickname}님
							<span class="arrow_carrot-down"></span>
							<ul class="dropdown">
								<c:if test="${whologin == 2}">
									
									<li ><a href="<%=contextPath%>/list.me">회원 리스트</a></li>
									<li ><a href="<%=contextPath%>/insert.pr">상품 등록</a></li>
									<li ><a href="<%=contextPath%>/insert.ex">운동 등록</a></li>
									<li ><a href="<%=contextPath%>/list.ro">루틴 리스트</a></li>
									<li><a href="<%=contextPath%>/logout.me">로그아웃</a></li>
								</c:if>
								<c:if test="${whologin != 2}">
									
									<li><a href="<%=contextPath%>/detail.me">my 상세정보</a></li>
									<li><a href="<%=contextPath%>/plan.me">my 성취율</a></li>
									<li><a href="<%=contextPath%>/myroutine.ro">my 루틴</a></li>
									<li><a href="<%=contextPath%>/mydietlist.di">my 식단</a></li>
									<li><a href="<%=contextPath%>/mybolist.br">my sns보기</a></li>
									<li><a href="<%=contextPath%>/logout.me">로그아웃</a></li>
									
								</c:if>
							</ul>
						</li>
					</c:when>
            	</c:choose>
            	
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->
	
	

</body>
</html>
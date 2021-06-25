<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="jquery.validate.js"></script>
	<c:if test="${ empty sessionScope.loginfo}">
		<c:set var="whologin" value="0" />
	</c:if>
	<c:if test="${ not empty sessionScope.loginfo}">
		<c:if test="${loginfo.id == 'admin'}">
			<c:set var="whologin" value="2" />
		</c:if>
		<c:if test="${loginfo.id != 'admin'}">
			<c:set var="whologin" value="1" />
		</c:if>
	</c:if>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fonts/material-icon/css/meinsert_material-design-iconic-font.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/vendor/nouislider/meinsert_nouislider.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/meinsert_style.css">
</head>

<body>

<div class="main">
        <div class="container">
            <div class="signup-content">
                <div class="signup-img">
                    <img src="<%=request.getContextPath() %>/resources/img/form-img.jpg" alt="">
                    <div class="signup-img-content">
                        <h2>나의 회원 정보 </h2>
                    </div>
                </div>
                <div class="signup-form">
                   <c:set var="apppath" value="<%=request.getContextPath()%>" />
                    <form:form name="myform" method="post" class="register-form" id="register-form" action="${apppath}/update.me" modelAttribute="bean">
                        <div class="form-row">
                            <div class="form-group">
                                <div class="form-input">
                                    <label for="id" class="required">아이디</label>
                                    <form:input type="text" path="id" onkeyup="isCheckFalse();" value="${member.id }" readonly="true"/>
                                </div>
                                <div class="form-input">
                                    <label for="password" class="required">비밀번호</label>
                                    <form:input type="text" path="password" value="${member.password }" readonly="true"/>
                                </div>
                                <div class="form-input">
                                    <label for="name" class="required">이름</label>
                                    <form:input type="text" path="name" value="${member.name }" readonly="true"/>
                                </div>
                                <div class="form-input">
                                    <label for="nickname" class="required">닉네임</label>
                                    <form:input type="text" path="nickname" value="${member.nickname }" readonly="true"/>
                                </div>
                                <div class="form-input">
                                    <label for="email" class="required">Email</label>
                                    <form:input type="text" path="email" value="${member.email }" readonly="true"/>
                                </div>
                                <div class="form-input">
                                    <label for="email" class="required">성별</label>
                                    <form:input type="text" path="gender" value="${member.gender }" readonly="true"/>
                                </div>
					
                            </div>
                            <div class="form-group">
                            
                                <div class="form-input">
	                                <label for="meal_preference">우편 번호</label>
			                        <form:input type="text" id="sample6_address" path="address1" placeholder="주소" value="${member.address1 }" readonly="true"/><br>
			                        <form:input type="text" id="sample6_detailAddress" path="address2" placeholder="상세주소" value="${member.address2 }" readonly="true"/>
		                        </div>
                                
                                <div class="form-input">
                                    <label for="career">운동 경력</label>
                                    <form:input type="number" path="career" value="${member.career }" readonly="true"/>
                                </div>
                                <div class="form-input">
                                    <label for="height">신장</label>
                                    <form:input type="number" path="height" value="${member.height }" readonly="true"/>
                                </div>
                                 <div class="form-input">
                                    <label for="height">몸무게</label>
                                    <input type="number" value="${myWeight}" readonly="readonly"/>
                                </div>
                                <div class="form-input">
                                    <label for="aim_weight">목표 체중</label>
                                    <form:input type="number" path="aim_weight" value="${member.aim_weight}" readonly="true"/>
                                </div> 
                                <div class="form-input">
                                    <label for="period">목표 기간</label>
                                    <form:input type="number" path="period" value="${member.period }" readonly="true"/>
                                </div>
                                 <div class="form-input">
                                    <label for="period">나의 루틴</label>
                                    <form:input type="text" path="ro_name" value="${member.ro_name}" readonly="true"/>
                                </div>
                                <div class="form-input">
                                    <label for="period">나의 포인트</label>
                                    <form:input type="number" path="point" value="${member.point}" readonly="true"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-submit">
                            <a href="<%=contextPath%>/update.me?myWeight=${myWeight}">
								<br>
								<br>
								<button type="button" class="btn btn-primary">회원 정보 수정하기</button>
							</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

    <!-- JS -->
    <script src="<%=request.getContextPath() %>/resources/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/nouislider/nouislider.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/wnumb/wNumb.js"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/vendor/jquery-validation/dist/additional-methods.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/meinsert_main.js"></script>
</body>
</body>
</html>
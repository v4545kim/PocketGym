<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
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
	<style>
	.panel-default>.panel-heading {
	    color: #333;
	    font-size: xx-large;
	    background-color: #f5f5f5;
	    border-color: #ddd;
	}
	
	element.style {
	    color: black;
	    FONT-SIZE: x-large;
	}
	
	.panel-body {
	    font-size: large;
	    padding: 15px;
	}
	
	.panel-default {
	    margin: 0 auto; 
	    border-color: #ddd;
	    max-width: 500px;
	}
	button.btn.btn-primary {
	    font-size: large;
	}
	</style>
</head>

<body>
	<jsp:include page="./../header.jsp"/>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading" style="color: black;" align="center">${bean.nickname}</div>
			<c:if test="${bean.email==sessionScope.loginfo.email}">
				<div class="panel-body" style="color: black;" align="center">아이디 : ${bean.id}</div>
				<div class="panel-body" style="color: black;" align="center">비밀번호 : ${bean.password}</div>	
				<div class="panel-body" style="color: black;" align="center">이메일 : ${bean.email}</div>
				<div class="panel-body" style="color: black;" align="center">주소 : ${bean.address}</div>
				<div class="panel-body" style="color: black;" align="center">포인트 : ${bean.point}</div>	
			</c:if>
			<div class="panel-body" style="color: black;" align="center">닉네임 : ${bean.nickname}</div>
			<div class="panel-body" style="color: black;" align="center">성별 : ${bean.gender}</div>
			<div class="panel-body" style="color: black;" align="center">키 : ${bean.height}</div>
			<div class="panel-body" style="color: black;" align="center">운동 경력 : ${bean.carrer}</div>
			<div class="panel-body" style="color: black;" align="center">목표기간 : ${bean.period}</div>
			<div class="panel-body" style="color: black;" align="center">목표체중 : ${bean.aim_weight}</div>

			<div class="panel-body" style="color: black;" align="center">
				현재 체중 : <a href="<%=contextPath%>/plan.me&id=${bean.id}">${myWeight}</a>
			</div>
		
			<a href="<%=contextPath%>/myroutine.ro&memid=${bean.id}&roid=${bean.ro_id}">
				<div class="panel-body" style="color: black;" align="center">내 운동 루틴 : ${bean.ro_name}</div>
			</a>
			
			<c:if test="${bean.id==sessionScope.loginfo.id}">
				<a href="<%=contextPath%>/update.me&myweight=${myweight}">
					<br>
					<br>
					<button type="button" class="btn btn-primary">회원 정보 수정하기</button>
				</a>
			</c:if>
				<br>
				<br>
				<br>
				<br>
			</div>
		</div>
	</div>
</body>
</html>
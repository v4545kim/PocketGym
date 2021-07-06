<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
	    if(${requestScope.errmsg != null}){
			alert('${requestScope.errmsg}')
			return false;
		}
		if(${requestScope.msg != null}){
			alert('${requestScope.msg}')
			window.close();
			return false;
		}
		return false;
	});
	
	function findId() {
		var name = document.idform.name.value;
		var birth = document.idform.birth.value;
		
		if(name == null || name == ''){
			alert('이름을 입력해 주세요.')
		}
		if(birth == null || birth== ''){
			alert('생년월일을 입력해 주세요.')
		}
		return false;
	}
	
	function findPassword() {
		var id = document.pwform.id.value;
		var email = document.pwform.email.value;
		
		if(id == null || id == ''){
			alert('아이디를 입력해 주세요.')
			return false;
		}
		if(email == null || email == ''){
			alert('이메일을 입력해 주세요.')
			return false;
		}
		
		return false;
	}
</script>

<style type="text/css">
.row {
    display: flex;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: 20px;
    margin-top: inherit;
}
</style>
</head>

<body>
	<div class="container" style="margin-top: 1em;">
		<!-- Sign up form -->
		<div class="card person-card">
			<div class="card-body">
				<!-- Sex image -->
				<h2 align="center" id="who_message" class="card-title">아이디 / 비밀번호 찾기</h2>
				<!-- First row (on medium screen) -->
			</div>
		</div>


		<div class="row">
			<form name="idform" action="<%=request.getContextPath()%>/findid.me" method="post">
				<div>
					<div class="card">
						<div class="card-body">
							<h2 class="card-title">아이디 찾기</h2>
							<div class="form-group">
								<label for="name" class="col-form-label">이름</label> 
								<input type="text" class="form-control" id="name" name="name">
								<div class="email-feedback"></div>
							</div>
							<div class="form-group">
								<label for="birth" class="col-form-label">생년월일</label> 
								<input type="date" class="form-control" id="birth" name="birth">
								<div class="phone-feedback"></div>
							</div>
							<input type="submit" class="btn btn-primary btn-lg btn-block" 
								onclick="findId();" value="아이디 찾기">
						</div>
					</div>
				</div>
			</form>
			<form name="pwform" action="<%=request.getContextPath()%>/findpw.me" method="post">
				<div>
					<div class="card">
						<div class="card-body">
							<h2 class="card-title">비밀번호 찾기</h2>
							<div class="form-group">
								<label for="id" class="col-form-label">아이디</label> 
								<input type="text" class="form-control" id="id" name="id">
								<div class="password-feedback"></div>
							</div>
							<div class="form-group">
								<label for="email" class="col-form-label">이메일</label> 
								<input type="email" class="form-control" id="email" name="email">
								<div class="password_conf-feedback"></div>
							</div>
							<input type="submit" class="btn btn-primary btn-lg btn-block" 
								onclick="findPassword();" value="비밀번호 찾기">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
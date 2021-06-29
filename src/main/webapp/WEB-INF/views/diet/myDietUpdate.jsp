<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 <script type="text/javascript">
	function hahaha() {
		opener.name = "수정창";
		document.myform.target = opener.name;
		document.myform.action = "<%=request.getContextPath() %>/mydietupdate.di"
			if (confirm("정말 수정하시겠습니까??") == true){    //확인
			    document.myform.submit();
			}else{   //취소
			    return;
			}
		self.close();
	}
</script>
	
	
	



</head>

<body>
<div class="container" style="margin-top: 1em;">
    <!-- Sign up form -->
    <form name="myform" action="<%=request.getContextPath() %>/mydietupdate.di" method="post">
    <input type="hidden" name="inputdate" value="${inputdate}">
    <input type="hidden" name="id" value="${loginfo.id }">
    <input type="hidden" name="year" value="${year}">
    <input type="hidden" name="month" value="${month}">
    <input type="hidden" name="day" value="${day}">
    <input type="hidden" name="diet_id" value="${diet_id}">
       <div class="card person-card">
            <div class="card-body">
                <!-- Sex image -->
                <h2 align="center" id="who_message" class="card-title">${year}년 ${month}월 ${day}일 <br> <br> <b>${sessionScope.loginfo.nickname}</b>님이
					드신 음식과 칼로리를 수정주세요!</h2>
                <!-- First row (on medium screen) -->
            </div>
        </div>
        
        
        <div class="row">
            <div class="col-md-6" style="padding=0.5em;">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Current Data</h2>
                        <div class="form-group">
                            <label for="email" class="col-form-label">Food Name</label>
                            <input type="text" class="form-control" id="email" value="${foodname }" disabled="disabled" required>
                            <div class="email-feedback">
                            
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tel" class="col-form-label">calorie</label>
                            <input type="text" class="form-control" id="tel" value="${calorie}" disabled="disabled" required>
                            <div class="phone-feedback">
                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="card"> 
                    <div class="card-body">
                        <h2 class="card-title">Modify Data</h2>
                        <div class="form-group">
                            <label for="password" class="col-form-label">Food Name</label>
                            <input type="text" class="form-control" id="foodname" name="foodname" placeholder="수정할 음식명을 입력해주세요" required>
                            <div class="password-feedback">
                            
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password_conf" class="col-form-label">calorie</label>
                            <input type="text" class="form-control" id="calorie" name="calorie" placeholder="수정할 칼로리를 입력해주세요" required>
                            <div class="password_conf-feedback">
                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top: 1em;">
            <input type="button" class="btn btn-primary btn-lg btn-block" onclick="javascript:hahaha()" value="수정완료">
        </div>
        </form>
</div>
</body>
</html>
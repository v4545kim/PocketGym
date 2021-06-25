<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="jquery.validate.js"></script>


<script>

function checkDuplicateNickname(  )
{
   var nickname = document.myform.nickname.value ;
   if( nickname.length == 0 ){
      alert('닉네임을 입력해 주세요') ;
      document.myform.nickname.focus() ; 
      return false ;
   }
   var url='<%=contextPath%>/nicknamecheck.me?nickname=' + nickname ; 
   window.open(url, 'mywin', 'height=150,width=300') ;
}

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
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
</script>


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
                        <h2>회원정보 수정하기</h2>
                    </div>
                </div>
                <div class="signup-form">
                   <c:set var="apppath" value="<%=request.getContextPath()%>" />
                    <form:form name="myform" method="post" class="register-form" id="register-form" action="${apppath}/update.me" modelAttribute="bean">
                        <div class="form-row">
                            <div class="form-group">
                                <div class="form-input">
                                    <label for="id" class="required">아이디 - 수정불가</label>
                                    <form:input type="text" path="id" onkeyup="isCheckFalse();" value="${member.id }" readonly="true"/>
                                </div>
                                <div class="form-input">
                                    <label for="password" class="required">비밀번호</label>
                                    <form:input type="password" path="password" value="${member.password }"/>
                                </div>
                                <div class="form-input">
                                    <label for="name" class="required">이름 - 수정불가</label>
                                    <form:input type="text" path="name" value="${member.name }" readonly="true"/>
                                </div>
                                <div class="form-input">
                                    <label for="nickname" class="required">닉네임</label>
                                    <form:input type="text" path="nickname" value="${member.nickname }"/>
                                    <input type="button" class="btn btn-info" value="중복 검사" onclick="checkDuplicateNickname();">
                                </div>
                                <div class="form-input">
                                    <label for="email" class="required">Email</label>
                                    <form:input type="text" path="email" value="${member.email }"/>
                                </div>
                                <div class="form-radio">
                                    <div class="label-flex">
                                        <label for="payment">성별</label>
                                    </div>
                                    <div class="form-radio-group">
                                    	<c:choose>
                                    		<c:when test="${member.gender=='남성' }">
	                                    		 <div class="form-radio-item">
		                                            <input type="radio" name="gender" id="man" value="남성" checked="checked">
		                                            <label for="man">남성</label>
		                                            <span class="check"></span>
		                                        </div>
		                                        <div class="form-radio-item">
		                                            <input type="radio" name="gender" id="woman" value="여성">
		                                            <label for="woman">여성</label>
		                                            <span class="check"></span>
		                                        </div>
                                    		</c:when>
                                    		<c:when test="${member.gender=='여성' }">
                                    			<div class="form-radio-item">
		                                            <input type="radio" name="gender" id="man" value="남성" >
		                                            <label for="man">남성</label>
		                                            <span class="check"></span>
		                                        </div>
		                                        <div class="form-radio-item">
		                                            <input type="radio" name="gender" id="woman" value="여성" checked="checked">
		                                            <label for="woman">여성</label>
		                                            <span class="check"></span>
		                                        </div>
                                    		</c:when>
                                    	</c:choose>	                                      	                                   
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                            
                                <div class="form-input">
	                                <label for="meal_preference">우편 번호</label>
			                        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			                        <form:input type="text" id="sample6_address" path="address1" placeholder="주소" value="${member.address1}"/><br>
			                        <form:input type="text" id="sample6_detailAddress" path="address2" placeholder="상세주소" value="${member.address2 }"/>
		                        </div>
                                
                                <div class="form-input">
                                    <label for="career">운동 경력 - 수정불가</label>
                                    <form:input type="number" path="career" value="${member.career }" readonly="true"/>
                                </div>
                                <div class="form-input">
                                    <label for="height">신장</label>
                                    <form:input type="number" path="height" value="${member.height }"/>
                                </div>
                                <div class="form-input">
                                    <label for="aim_weight">목표 체중</label>
                                    <form:input type="number" path="aim_weight" value="${member.aim_weight}"/>
                                </div> 
                                <div class="form-input">
                                    <label for="period">목표 기간 - 수정 불가</label>
                                    <form:input type="number" path="period" value="${member.period }" readonly="true"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-submit">
                            <input type="submit" value="Submit" class="submit" id="submit" name="submit" />
                            <input type="submit" value="Reset" class="submit" id="reset" name="reset" />
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
</html>
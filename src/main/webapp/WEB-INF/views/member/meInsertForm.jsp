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


<script type="text/javascript">
   function checkDuplicateId()
   {
       var id = document.myform.id.value ;
       alert('아이디를 입력해라 임마');
       if( id.length == 0 )
       {
          alert('아이디를 입력해 주세요') ;
          document.myform.id.focus() ; 
          return false ;
       }
       var url='<%=contextPath%>/idcheck.me?id=' + id ; 
       window.open(url, 'mywin', 'height=150,width=300') ;
      }
      
   function isCheckFalse() 
   {
      document.myform.isCheck.value = false;
   }
</script>

<script>
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
                        <h2>Register now </h2>
                        <p>while seats are available !</p>
                    </div>
                </div>
                <div class="signup-form">
                   <c:set var="apppath" value="<%=request.getContextPath()%>" />
                    <form:form method="post" class="register-form" id="register-form" action="${apppath}/insert.me">
                        <div class="form-row">
                            <div class="form-group">
                                <div class="form-input">
                                    <label for="id" class="required">아이디</label>
                                    <input type="text" name="id" id="id" onkeyup="isCheckFalse();"/>
                                    <input type="button" class="btn btn-info" value="중복 검사"
                                    onclick="checkDuplicateId();">
                                </div>
                                <div class="form-input">
                                    <label for="password" class="required">비밀번호</label>
                                    <input type="password" name="password" id="password" />
                                </div>
                                <div class="form-input">
                                    <label for="name" class="required">이름</label>
                                    <input type="text" name="name" id="name" />
                                </div>
                                <div class="form-input">
                                    <label for="nickname" class="required">닉네임</label>
                                    <input type="text" name="nickname" id="nickname" />
                                </div>
                                <div class="form-input">
                                    <label for="email" class="required">Email</label>
                                    <input type="text" name="email" id="email" />
                                </div>
                                <div class="form-radio">
                                    <div class="label-flex">
                                        <label for="payment">성별</label>
                                    </div>
                                    <div class="form-radio-group">
                                        <div class="form-radio-item">
                                            <input type="radio" name="gender" id="man" value="남성">
                                            <label for="man">남성</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <input type="radio" name="gender" id="woman" value="여성">
                                            <label for="woman">여성</label>
                                            <span class="check"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                            
                                <div class="form-input">
	                                <label for="meal_preference">우편 번호</label>
			                        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			                        <input type="text" id="sample6_address" name="address" placeholder="주소"><br>
			                        <input type="text" id="sample6_detailAddress" placeholder="상세주소">
		                        </div>
                                
                                <div class="form-input">
                                    <label for="career">운동 경력</label>
                                    <input type="number" name="career" id="career" />
                                </div>
                                <div class="form-input">
                                    <label for="height">신장</label>
                                    <input type="number" name="height" id="height" />
                                </div>
                                <div class="form-input">
                                    <label for="aim_weight">목표 체중</label>
                                    <input type="number" name="aim_weight" id="aim_weight" />
                                </div>
                                <div class="form-input">
                                    <label for="period">목표 기간</label>
                                    <input type="number" name="period" id="period" />
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
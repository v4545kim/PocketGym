<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

<style type="text/css">
.row.justify-content-center {
    margin-top: 60px;
}
input[type=button].btn-block, input[type=reset].btn-block, input[type=submit].btn-block 
{
    width: 50%;
}
input.btn.btn-info.btn-block.rounded-0.py-2 
{
    margin-top: auto;
    width: 233px;
    margin: 10px;
    float: left;
}
textarea.form-control 
{
    height: 200px;
}
</style>
</head>

<body>

<div class="container">
	<div class="row justify-content-center">
		<div class="col-12 col-md-8 col-lg-6 pb-5">


                    <!--Form with header-->

                    <form action="mail.php" method="post">
                        <div class="card border-primary rounded-0">
                            <div class="card-header p-0">
                                <div class="bg-info text-white text-center py-2">
                                    <h3><i class="fa fa-envelope"></i>
                                    <c:choose>
                                    <c:when test="${requestScope.valid == 0 }">
                                    	받은 메일
                                    </c:when>
                                    <c:otherwise>
                                    	보낸 메일
                                    </c:otherwise>
                                    </c:choose>
                                    </h3>
                                </div>
                            </div>
                            <div class="card-body p-3">
                                <!--Body-->
                                <div class="form-group">
                                <i class="text-info">보낸사람</i>
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fa fa-user text-info"></i></div>
                                        </div>
                                        <input type="text" disabled="disabled" class="form-control" id="nombre" name="receiveid" value="${requestScope.bean.sendid }">
                                    </div>
                                </div>
                                <div class="form-group">
                                <i class="text-info">받는사람</i>
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fa fa-user text-info"></i></div>
                                        </div>
                                        <input type="text" disabled="disabled" class="form-control" id="nombre" name="receiveid" value="${requestScope.bean.receiveid }">
                                    </div>
                                </div>
                                <div class="form-group">
                                 <i class="text-info">제목</i>
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fa fa-edit text-info"></i></div>
                                        </div>
                                        <input type="text" disabled="disabled" class="form-control" id="nombre" name="subject" value="${requestScope.bean.subject }">
                                    </div>
                                </div>

                                <div class="form-group">
                                 <i class="text-info">내용</i>
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fa fa-comment text-info"></i></div>
                                        </div>
                                        <textarea name="context" class="form-control" disabled="disabled" >${requestScope.bean.context}</textarea>
                                    </div>
                                </div>
								
								<div class="text-center">
									<c:choose>
                                    <c:when test="${requestScope.valid == 0 }">
	                                    <input type="button" value="뒤로가기" class="btn btn-info btn-block rounded-0 py-2" onclick="location.href='<%=contextPath%>/maillist.ml?id=${sessionScope.loginfo.id}';">
	                                    <input type="button" value="답장하기" class="btn btn-info btn-block rounded-0 py-2" onclick="location.href='<%=contextPath%>/mailinsert.ml?sendid=${requestScope.bean.sendid}';">
                                	</c:when>
                                	<c:otherwise>
                                		<input type="button" value="뒤로가기" class="btn btn-info btn-block rounded-0 py-2" onclick="location.href='<%=contextPath%>/maillist.ml?id=${sessionScope.loginfo.id}';" style="width:480px;">
                                	</c:otherwise>
                                	</c:choose>
                                </div>
                            </div>

                        </div>
                    </form>
                    <!--Form with header-->


                </div>
	</div>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
<html>
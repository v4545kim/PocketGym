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
    margin-top: 200px;
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

                    <form action="<%=contextPath%>/mailinsert.ml" method="post">
                    <input type="hidden" name="id" value="${sessionScope.loginfo.id}">
                        <div class="card border-primary rounded-0">
                            <div class="card-header p-0">
                                <div class="bg-info text-white text-center py-2">
                                    <h3><i class="fa fa-envelope"></i> 메일 쓰기</h3>
                                    <p class="m-0">Con gusto te ayudaremos</p>
                                </div>
                            </div>
                            <div class="card-body p-3">

                                <!--Body-->
                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fa fa-user text-info"></i></div>
                                        </div>
                                        <c:set var="replyid" value="${replyreceiveid}" />
                                        <c:choose>

                                        <c:when test="${empty replyid}">
                                        <input type="text" class="form-control" id="nombre" name="receiveid" placeholder="받는사람 아이디를 입력해주세요." required>
                                        </c:when>

                                        <c:otherwise>
                                        <input type="text" class="form-control" id="nombre" name="receiveid" value="${replyid}">
                                        </c:otherwise>

                                        </c:choose>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fa fa-edit text-info"></i></div>
                                        </div>
                                        <input type="text" class="form-control" id="nombre" name="subject" placeholder="제목을 입력해주세요." required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fa fa-comment text-info"></i></div>
                                        </div>
                                        <textarea name="context" class="form-control" placeholder="내용을 입력해주세요." required></textarea>
                                    </div>
                                </div>

                                <div class="text-center">
                                    <input type="submit" value="보내기" class="btn btn-info btn-block rounded-0 py-2">
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
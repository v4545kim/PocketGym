<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<!DOCTYPE html>
<html lang="en"> 
<!-- <html lang="en" style="height: 100%"> -->


<head> 
	<meta charset="UTF-8"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta http-equiv="X-UA-Compatible" content="ie=edge"> 
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
	<!-- 차트 링크 --> 
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> 

<style type="text/css">
canvas#myChart {
    margin-bottom: 45px;
}
</style>

</head> 

<body>
<jsp:include page="./../header.jsp" />

<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%=contextPath %>/resources/img/breadcrumb/classes-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2><i class="fa fa-line-chart" aria-hidden="true"></i>나의 최근 몸무게 변화율</h2>
                        
                    </div>
                </div>
            </div>
        </div>
    </section> 
	<div class="container"> 
		<canvas id="myChart"></canvas>
	</div> 
	
	
	<!-- 부트스트랩 -->
	 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
	 	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
	 	crossorigin="anonymous"></script> 
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	 	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
	 	crossorigin="anonymous"></script>
	 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	 	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" 
	 	crossorigin="anonymous"></script> 
	 	
	 <!-- 차트 --> 
	<script>
		var weight1 = <%=request.getAttribute("weight1")%>;
		var regdate1 = '<%=request.getAttribute("regdate1")%>';
		var weight2 = <%=request.getAttribute("weight2")%>;
		var regdate2 = '<%=request.getAttribute("regdate2")%>';
		var weight3 = <%=request.getAttribute("weight3")%>;
		var regdate3 = '<%=request.getAttribute("regdate3")%>';
		var weight4 = <%=request.getAttribute("weight4")%>;
		var regdate4 = '<%=request.getAttribute("regdate4")%>';
		var weight5 = <%=request.getAttribute("weight5")%>;
		var regdate5 = '<%=request.getAttribute("regdate5")%>';
		var weight6 = <%=request.getAttribute("weight6")%>;
		var regdate6 = '<%=request.getAttribute("regdate6")%>';
		var weight7 = <%=request.getAttribute("weight7")%>;
		var regdate7 = '<%=request.getAttribute("regdate7")%>';
		
		//리스트가 7개 다 있을때
		if(regdate7 != '미등록') 
		{
			var ctx = document.getElementById('myChart').getContext('2d');		
			var chart = new Chart(ctx, {
				// 차트 종류 선택
				type: 'line', 
				// 차트를 그릴 데이터
				data: { labels: [regdate7, regdate6, regdate5, regdate4, regdate3, regdate2, regdate1], 
				datasets: [{ 
					label: '나의 몸무게 변화(kg)', 
					backgroundColor: 'transparent', 
					borderColor: 'red', 
					data: ([weight7,weight6,weight5,weight4,weight3,weight2,weight1,0]) 
					}] 
				},
			// 옵션
			options: {} 
			});
		}
		// 등록된 몸무게가 1개일때
		else if (regdate2 == '미등록') 
		{
			var ctx = document.getElementById('myChart').getContext('2d');		
			var chart = new Chart(ctx, {
				// 차트 종류 선택
				type: 'line', 
				// 차트를 그릴 데이터
				data: { labels: [regdate1], 
				datasets: [{ 
					label: '나의 몸무게 변화(kg)', 
					backgroundColor: 'transparent', 
					borderColor: 'red', 
					data: ([weight1,0]) 
					}] 
				},
			// 옵션
			options: {} 
			});
		}
		// 등록된 몸무게가 2개일때
		else if (regdate3 == '미등록') 
		{
			var ctx = document.getElementById('myChart').getContext('2d');		
			var chart = new Chart(ctx, {
				// 차트 종류 선택
				type: 'line', 
				// 차트를 그릴 데이터
				data: { labels: [regdate2, regdate1], 
				datasets: [{ 
					label: '나의 몸무게 변화(kg)', 
					backgroundColor: 'transparent', 
					borderColor: 'red', 
					data: ([weight2,weight1,0]) 
					}] 
				},
			// 옵션
			options: {} 
			});
		}
		// 등록된 몸무게가 3개일때
		else if (regdate4 == '미등록') 
		{
			var ctx = document.getElementById('myChart').getContext('2d');		
			var chart = new Chart(ctx, {
				// 차트 종류 선택
				type: 'line', 
				// 차트를 그릴 데이터
				data: { labels: [regdate3, regdate2, regdate1], 
				datasets: [{ 
					label: '나의 몸무게 변화(kg)', 
					backgroundColor: 'transparent', 
					borderColor: 'red', 
					data: ([weight3,weight2,weight1,0]) 
					}] 
				},
			// 옵션
			options: {} 
			});
		}
		// 등록된 몸무게가 4개일때
		else if (regdate5 == '미등록') 
		{
			var ctx = document.getElementById('myChart').getContext('2d');		
			var chart = new Chart(ctx, {
				// 차트 종류 선택
				type: 'line', 
				// 차트를 그릴 데이터
				data: { labels: [regdate4, regdate3, regdate2, regdate1], 
				datasets: [{ 
					label: '나의 몸무게 변화(kg)', 
					backgroundColor: 'transparent', 
					borderColor: 'red', 
					data: ([weight4,weight3,weight2,weight1,0]) 
					}] 
				},
			// 옵션
			options: {} 
			});
		}
		// 등록된 몸무게가 5개일때
		else if (regdate6 == '미등록') 
		{
			var ctx = document.getElementById('myChart').getContext('2d');		
			var chart = new Chart(ctx, {
				// 차트 종류 선택
				type: 'line', 
				// 차트를 그릴 데이터
				data: { labels: [ regdate5, regdate4, regdate3, regdate2, regdate1], 
				datasets: [{ 
					label: '나의 몸무게 변화(kg)', 
					backgroundColor: 'transparent', 
					borderColor: 'red', 
					data: ([weight5,weight4,weight3,weight2,weight1,0]) 
					}] 
				},
			// 옵션
			options: {} 
			});
		}
		// 등록된 몸무게가 6개일때
		else 
		{
			var ctx = document.getElementById('myChart').getContext('2d');		
			var chart = new Chart(ctx, {
				// 차트 종류 선택
				type: 'line', 
				// 차트를 그릴 데이터
				data: { labels: [ regdate6, regdate5, regdate4, regdate3, regdate2, regdate1], 
				datasets: [{ 
					label: '나의 몸무게 변화(kg)', 
					backgroundColor: 'transparent', 
					borderColor: 'red', 
					data: ([weight6,weight5,weight4,weight3,weight2,weight1,0]) 
					}] 
				},
			// 옵션
			options: {} 
			});
		}
		
	</script>
	
	
	
	
	
	
	
	
	
	
	    <!-- Js Plugins -->
    <script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/mixitup.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/masonry.pkgd.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/main.js"></script> 
	
	
</body> 
 
</html>


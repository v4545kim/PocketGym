<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>   
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">	
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css_cal/style.css">
<script src="<%=request.getContextPath() %>/resources/js_cal/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js_cal/popper.js"></script>
<script src="<%=request.getContextPath() %>/resources/js_cal/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js_cal/main.js"></script>
<script type="text/javascript">
// 임시값 넣어서 변수 생성
var event_data = {
    "events": [
    {
        "year": 2020,
        "month": 5,
        "day": 10,
        "cancelled": true
    }
    ]
};

var diet_data = {
	"diets": [
		{
			"year" : 2020,
			"month": 4,
			"day": 10,
			"calorie" : 100			
		}		
	]	
};

const months = [ 
    "January", 
    "February", 
    "March", 
    "April", 
    "May", 
    "June", 
    "July", 
    "August", 
    "September", 
    "October", 
    "November", 
    "December" 
];
 console.log('${lists2}')
 console.log('${deList}')
 var contextPath = '${contextPath}';
 var id = '${id}';
 var lists2 = JSON.parse('${lists2}');
 
 for(i=0; i<${size}; i++){
	 var dd = lists2[i].regdate;
/* 	 console.log(dd) */
	 var year = parseInt(dd.split('/')[0]);
/* 	 console.log(year) */
	 var month = parseInt(dd.split('/')[1]);
/* 	 console.log(month) */
	 var date = parseInt(dd.split('/')[2]);
/* 	 console.log(date) */
	 var ex_name = lists2[i].ex_name;
	 var ex_cal = lists2[i].ex_calorie;
	 var ex_id = lists2[i].ex_id;
	 new_event_json(year, month, date, ex_name, ex_cal, ex_id);
 }

 var deList = JSON.parse('${deList}');
 for(i=0; i<${desize}; i++){
	 var dd = deList[i].inputdate;
	 console.log(dd)
	 var year = parseInt(dd.split('/')[0]);
	 console.log(year)
	 var month = parseInt(dd.split('/')[1]);
	 console.log(month)
	 var date = parseInt(dd.split('/')[2]);
	 console.log(date)
	 var inputCal = deList[i].calorie;
	 console.log(inputCal)
	 new_diet_json(year, month, date, inputCal);
 }
 $(document).ready(function(){
	    var date = new Date();
	    var today = date.getDate();		
	    // Set click handlers for DOM elements
	    $(".right-button").click({date: date}, next_year);
	    $(".left-button").click({date: date}, prev_year);
	    $(".month").click({date: date}, month_click);
	    $("#add-button").click({date: date}, new_event);
	    // Set current month as active
	    $(".months-row").children().eq(date.getMonth()).addClass("active-month");
	    init_calendar(date);
	    var events = check_events(today, date.getMonth()+1, date.getFullYear());
	    var diets = check_diets(today, date.getMonth()+1, date.getFullYear())
	    show_events(events, diets, months[date.getMonth()], today);
	});

	// Initialize the calendar by appending the HTML dates
	function init_calendar(date) {
	    $(".tbody").empty(); 
	    $(".events-container").empty();
	    var calendar_days = $(".tbody");
	    var month = date.getMonth();
	    var year = date.getFullYear();
	    var day_count = days_in_month(month, year);
	    var row = $("<tr class='table-row'></tr>");
	    var today = date.getDate();
	    // Set date to 1 to find the first day of the month
	    date.setDate(1);
	    var first_day = date.getDay();
	    // 35+firstDay is the number of date elements to be added to the dates table
	    // 35 is from (7 days in a week) * (up to 5 rows of dates in a month)
	    for(var i=0; i<35+first_day; i++) {
	        // Since some of the elements will be blank, 
	        // need to calculate actual date from index
	        var day = i-first_day+1;
	        // If it is a sunday, make a new row
	        if(i%7===0) {
	            calendar_days.append(row);
	            row = $("<tr class='table-row'></tr>");
	        }
	        // if current index isn't a day in this month, make it blank
	        if(i < first_day || day > day_count) {
	            var curr_date = $("<td class='table-date nil'>"+"</td>");
	            row.append(curr_date);
	        }   
	        else {
	            var curr_date = $("<td class='table-date'>"+day+"</td>");
	            var events = check_events(day, month+1, year);
	            var diets = check_diets(day, month+1, year)
	            if(today===day && $(".active-date").length===0) {
	                curr_date.addClass("active-date");
	                show_events(events, diets, months[month], day);
	            }
	            // If this date has any events, style it with .event-date
	            if(events.length!==0) {
	                curr_date.addClass("event-date");
	            }
	            // Set onClick handler for clicking a date
	            curr_date.click({events: events, diets: diets, month: months[month], day:day}, date_click);
	            row.append(curr_date);
	        }
	    }
	    // Append the last row and set the current year
	    calendar_days.append(row);
	    $(".year").text(year);
	}

	// Get the number of days in a given month/year
	function days_in_month(month, year) {
	    var monthStart = new Date(year, month, 1);
	    var monthEnd = new Date(year, month + 1, 1);
	    return (monthEnd - monthStart) / (1000 * 60 * 60 * 24);    
	}

	// Event handler for when a date is clicked
	function date_click(event) {
	    $(".events-container").show(250);
	    $("#dialog").hide(250);
	    $(".active-date").removeClass("active-date");
	    $(this).addClass("active-date");
	    show_events(event.data.events, event.data.diets, event.data.month, event.data.day);
	};

	// Event handler for when a month is clicked
	function month_click(event) {
	    $(".events-container").show(250);
	    $("#dialog").hide(250);
	    var date = event.data.date;
	    $(".active-month").removeClass("active-month");
	    $(this).addClass("active-month");
	    var new_month = $(".month").index(this);
	    date.setMonth(new_month);
	    init_calendar(date);
	}

	// Event handler for when the year right-button is clicked
	function next_year(event) {
	    $("#dialog").hide(250);
	    var date = event.data.date;
	    var new_year = date.getFullYear()+1;
	    $("year").html(new_year);
	    date.setFullYear(new_year);
	    init_calendar(date);
	}

	// Event handler for when the year left-button is clicked
	function prev_year(event) {
	    $("#dialog").hide(250);
	    var date = event.data.date;
	    var new_year = date.getFullYear()-1;
	    $("year").html(new_year);
	    date.setFullYear(new_year);
	    init_calendar(date);
	}

	// Event handler for clicking the new event button
	function new_event(event) {
	    // if a date isn't selected then do nothing
	    if($(".active-date").length===0)
	        return;
	    // remove red error input on click
	    $("input").click(function(){
	        $(this).removeClass("error-input");
	    })
	    // empty inputs and hide events
	    $(".events-container").hide(250);
	    $("#dialog").show(250);
	    // Event handler for cancel button
	    $("#cancel-button").click(function() {
	        $("#dialog").hide(250);
	        $(".events-container").show(250);
	    });
	    // Event handler for ok button
	    $("#ok-button").unbind().click({date: event.data.date}, function() {
	        var date = event.data.date;
			var ex = $("#ex").val().split(',');
			var ex_name = ex[0];
			var ex_cal = ex[1];
			var ex_id = ex[2];
			var contextPath = ex[3];
			var year = date.getFullYear();
			var month = date.getMonth()+1;
	        var day = parseInt($(".active-date").html());
			var regdate = [year,month,day].join('/');
	        // Basic form validation
	        if(ex_name.length === 0) {
	            $("#ex_name").addClass("error-input");
	        }
	        else {
				console.log(ex_name);
				console.log(ex_cal);
	            $("#dialog").hide(250);
	            console.log("new event");			
	            new_event_json(date, day, ex_name, ex_cal);
	            date.setDate(day);
	            init_calendar(date);
				window.location.href = contextPath+"/insertroutine.ro?regdate="+regdate+"&ex_id="+ex_id;
	        }
	    });
	}

	// Adds a json event to event_data
	function new_event_json(date, day, ex_name, ex_cal) {
	    var event = {
	        "year": date.getFullYear(),
	        "month": date.getMonth()+1,
	        "day": day,
			"ex_name" : ex_name,
			"ex_cal" : ex_cal
	    };
	    event_data["events"].push(event);
	}

	function new_event_json(year, month, day, ex_name, ex_cal, ex_id) {
	    var event = {
	        "year": year,
	        "month": month,
	        "day": day,
			"ex_name" : ex_name,
			"ex_cal" : ex_cal,
			"ex_id" : ex_id
	    };
	    event_data["events"].push(event);
	}
	
	function new_diet_json(year, month, day, inputCal) {
	    var diet = {
	        "year": year,
	        "month": month,
	        "day": day,
			"calorie" : inputCal
	    };
	    diet_data["diets"].push(diet);
	}

	// Display all events of the selected date in card views
	function show_events(events, diets, month, day) {
	    // Clear the dates container
	    $(".events-container").empty();
	    $(".events-container").show(250);
	    console.log(event_data["events"]);
	    console.log(diet_data["diets"]);
	    // If there are no events for this date, notify the user
	    if(events.length===0) {
	        var event_card = $("<div class='card'></div>");
	        var event_name = $("<div class='card-body'>운동 기록이 없습니다.</div>");
	        $(event_card).css({ "border-left": "10px solid #FF1744" });
	        $(event_card).append(event_name);
	        $(".events-container").append(event_card);
	    }else {
	        // Go through and add each event as a card to the events container
	        var total_cal = 0;
	        var total_inputCal = 0;
	        var de_year = 0;
	        var de_month = 0;
	        var de_day = 0;
	        for(var i=0; i<events.length; i++) {
	            var event_card = $("<div class='card'></div>");
				var ex_name = $("<div class='card-body'><a href="+contextPath+"/detail.ex?ex_id="+events[i]["ex_id"]+">"+events[i]["ex_name"]+"</a></div>");
				var ex_cal = $("<div class='card-body'>"+events[i]["ex_cal"]+" 칼로리</div>");
				var year = events[i]["year"];
				var month = events[i]["month"];
		        var day = events[i]["day"];;
				var regdate = [year,month,day].join('/');
				var ex_del = $("<button type='button' class='btn btn-danger btn-circle' onclick='location.href=\""+contextPath+"/myroutinedelete.ro?ex_id="+events[i]["ex_id"]+"&regdate="+regdate+"\"'>삭제하기</button>");
				total_cal = total_cal + events[i]["ex_cal"]
	            if(events[i]["cancelled"]===true) {
	                $(event_card).css({
	                    "border-left": "10px solid #FF1744"
	                });
	            }
	            $(event_card).append(ex_name).append(ex_cal).append(ex_del);
	            $(".events-container").append(event_card);
	        }
	        for(var i=0; i<diets.length;i++){
	        	de_year = diets[i]["year"];
	        	de_month = diets[i]["month"];
	        	de_day = diets[i]["day"];
	        	total_inputCal = total_inputCal + diets[i]["calorie"];
	        }
	        var event_card = $("<div class='card bg-success text-white'></div>");
	        var to_cal = $("<h4 class='card-body'>총 사용 칼로리 : "+total_cal+"</h4>");
	        var input_cal = $("<a href=\""+contextPath+"/mydietdetail.di?id="+id+"&day="+de_day+"&month="+de_month+"&year="+de_year+"\"><h4 class='card-body'>총 섭취 칼로리 : "+total_inputCal+"</h4></a>");
	        var todayCal = $("<h4 class='card-body'>오늘 결산 칼로리 : "+(total_inputCal-total_cal)+"</h4>");
	        $(event_card).append(to_cal).append(input_cal).append(todayCal);
	        $(".events-container").append(event_card);
	    }
	}

	// Checks if a specific date has any events
	function check_events(day, month, year) {
	    var events = [];
	    for(var i=0; i<event_data["events"].length; i++) {
	        var event = event_data["events"][i];
	        if(event["day"]===day &&
	            event["month"]===month &&
	            event["year"]===year) {
	                events.push(event);
	            }
	    }
	    return events;
	}
	function check_diets(day, month, year) {
	    var diets = [];
	    for(var i=0; i<diet_data["diets"].length; i++) {
	        var diet = diet_data["diets"][i];
	        if(diet["day"]===day &&
	            diet["month"]===month &&
	            diet["year"]===year) {
	                diets.push(diet);
	            }
	    }
	    return diets;
	}


</script>
</head>

<body>
	<jsp:include page="./../header.jsp"/>	
	 <section class="breadcrumb-section set-bg" data-setbg="<%=request.getContextPath() %>/resources/img/breadcrumb/classes-breadcrumb.jpg">
		 <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2><i class="fa fa-shopping-basket"></i>나의 운동</h2>
                    </div>
                </div>
            </div>
        </div>
	</section>
		<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">나의 운동 일지</h2>
				</div>
			</div>
			<c:if test="${err!=null }">
				<div class="alert alert-warning">
					<strong>죄송합니다</strong> ${err}
				</div>
			</c:if>
			<div class="row">
				<div class="col-md-12">
					<div class="content w-100">
				    <div class="calendar-container">
				      <div class="calendar"> 
				        <div class="year-header"> 
				          <span class="left-button fa fa-chevron-left" id="prev"> </span> 
				          <span class="year" id="label"></span> 
				          <span class="right-button fa fa-chevron-right" id="next"> </span>
				        </div> 
				        <table class="months-table w-100"> 
				          <tbody>
				            <tr class="months-row">
				              <td class="month">Jan</td> 
				              <td class="month">Feb</td> 
				              <td class="month">Mar</td> 
				              <td class="month">Apr</td> 
				              <td class="month">May</td> 
				              <td class="month">Jun</td> 
				              <td class="month">Jul</td>
				              <td class="month">Aug</td> 
				              <td class="month">Sep</td> 
				              <td class="month">Oct</td>          
				              <td class="month">Nov</td>
				              <td class="month">Dec</td>
				            </tr>
				          </tbody>
				        </table> 
				        
				        <table class="days-table w-100"> 
				          <td class="day">Sun</td> 
				          <td class="day">Mon</td> 
				          <td class="day">Tue</td> 
				          <td class="day">Wed</td> 
				          <td class="day">Thu</td> 
				          <td class="day">Fri</td> 
				          <td class="day">Sat</td>
				        </table> 
				        <div class="frame"> 
				          <table class="dates-table w-100"> 
			              <tbody class="tbody">             
			              </tbody> 
				          </table>
				        </div> 
				        <button class="button btn-lg" id="add-button">운동 기록하기</button>
				      </div>
				    </div>
				    <div class="events-container">
						<div></div>
					</div>
				    <div class="dialog" id="dialog">
				        <h2 class="dialog-header"> 운동 기록하기 </h2>
				        <form class="form" id="form">
				          <div class="form-container" align="center">
				            <!-- <label class="form-label" id="valueFromMyButton" for="name">Event name</label>
				            <input class="input" type="text" id="name" maxlength="36">
				            <label class="form-label" id="valueFromMyButton" for="count">Number of people to invite</label>
				            <input class="input" type="number" id="count" min="0" max="1000000" maxlength="7"> -->
				           
				            <select class="form-control form-control-lg" id="ex">
				            	<c:forEach items="${lists}" var="item">
				            		<option value="${item.ex_name},${item.ex_calorie},${item.ex_id},<%=contextPath%>" id="ex">${item.ex_name } : ${item.ex_calorie} 칼로리
				            	</c:forEach>
				            </select>
				            <br><br>
				            <input type="button" value="취소" class="button" id="cancel-button">
				            <input type="button" value="확인" class="button button-white" id="ok-button">		            
				          </div>
				        </form>
				      </div>
				  </div>
				</div>
			</div>
		</div>
	</section>
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
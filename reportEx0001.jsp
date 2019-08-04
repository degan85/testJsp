<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"   uri="http://www.springframework.org/security/tags"%>

<!doctype html>
<html>
<head>
	<%@include file="header.jsp"%>
	<title>report예제0001입니다.</title>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<style>
		.search_area{
			border : .5px solid rgba(0,0,0,.25);
			margin : 20px 0;
			padding: 20px;
			border-radius: 5px;
		}
		.button.searchBtn{
			margin-left: 20px;
		}
	</style>
</head>
<body>
<%@include file="menu.jsp" %>

<div class="ui main container">
	<div class="ui segment basic">
		<h1 class="ui left floated header">
			Payment
		</h1>
		<div class="ui right floated header mgr0">
			<div class="ui small breadcrumb">
				<a href="/" class="section"><i class="home icon"></i></a>
				<i class="right chevron icon divider"></i>
				<div class="active section">Pay & Schedule</div>
			</div>
		</div>
	</div>

	<div class="ui section divider"></div>

	<div class="ui top attached tabular menu">
		<a class="item active" data-tab="first"><font style="vertical-align: inherit;">Pay & Schedule</font></a>
		<a class="item" data-tab="second"><font style="vertical-align: inherit;">Service Schedule</font></a>
	</div>

	<div class="ui bottom attached tab segment active" data-tab="first">
		<div class="ui form tab1_search search_area">
			<div class="inline fields">
				<label>BookDate</label>
				<div class="ui calendar" id="tab1_startDate">
					<div class="ui input left icon">
						<i class="calendar icon"></i>
						<input type="text" class="startDate" placeholder="startDate">
					</div>
				</div>
				~
				<div class="ui calendar" id="tab1_endDate">
					<div class="ui input left icon">
						<i class="calendar icon"></i>
						<input type="text" class="endDate" placeholder="endDate">
					</div>
				</div>

				<button class="ui primary button searchBtn" id="tab1_searchBtn">
					Search
				</button>
			</div>
		</div>

		<table id="scheduleList" class="ui compact celled table">
			<thead>
			<tr>
				<th>Member No.</th>
				<th>Name</th>
				<th>E-mail(ID)</th>
				<th>Decided Clinic/Doctors</th>
				<th>Booked Date for Decision</th>
				<th>Updated Date</th>
				<th>Schedule Status</th>
				<th>PayMode</th>
				<th>Price Table Number</th>
				<th>Patient Health Questionnair</th>
			</tr>
			</thead>
		</table>
	</div>

	<div class="ui bottom attached tab segment" data-tab="second">
		<div class="ui form tab2_search search_area">
			<div class="inline fields">
				<label>BookDate</label>
				<div class="ui calendar" id="tab2_startDate">
					<div class="ui input left icon">
						<i class="calendar icon"></i>
						<input type="text" class="startDate" placeholder="startDate">
					</div>
				</div>
				~
				<div class="ui calendar" id="tab2_endDate">
					<div class="ui input left icon">
						<i class="calendar icon"></i>
						<input type="text" class="endDate" placeholder="endDate">
					</div>
				</div>

				<button class="ui primary button searchBtn" id="tab2_searchBtn">
					Search
				</button>
			</div>
		</div>
		<table id="dataTable" class="ui compact celled table">
			<thead>
			<tr>
				<th>Member No.</th>
				<th>Name</th>
				<th>E-mail(ID)</th>
				<th>Updated Date</th>
				<th>Pay<br/>Mode</th>
				<th>Price Table Number</th>
				<th>Patient Health<br/>Questionnaire</th>
			</tr>
			</thead>
		</table>
	</div>


</div>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<%@include file="scriptsForTable.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	$("#tab1_searchBtn").click(function() {
				$("#scheduleList").DataTable().destroy();
				var startDate = $(".tab1_search").find(".startDate.hasDatepicker").val() + " 00:00:00";
				var endDate = $(".tab1_search").find(".endDate.hasDatepicker").val() + " 23:59:59";

				if (startDate == " 00:00:00" || endDate == " 23:59:59") {
					alert("Please enter the date!");
					return false;
				} else {
					if (endDate < startDate) {
						alert("The end date must be greater than or equal to the start date.");
						return false;
					}
				}

				//날짜 검색
				loadPayNSchedule(startDate, endDate);


			});

</script>
</body>
</html>
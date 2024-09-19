<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset=UTF-8>
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<title>Task4</title>
	</head>
	<body>
		<cfset today=Now()>
		<!---Today Date--->
		<cfset todayDate=DateFormat(today,"yyyy-mm-dd")>

		<!---Month In numeric--->
		<cfset currentMonthInNumeric=Month(today)>

		<!--Month In Word--->
		<cfset currentMonthInWord=DateFormat(today,"mmmm")>
		<!---Last Friday Date--->
		<cfset daysToLastFriday=DayOfWeek(today)-6>
		<cfif daysToLastFriday LTE 0 >
			<cfset daysToLastFriday=daysToLastFriday+7>
		</cfif>
		<cfset lastFridayDate= DateAdd("d",-daysToLastFriday,todayDate)>
		<cfset lastFriday=DateFormat(lastFridayDate,"yyyy-mm-dd")>

		<!---Last Day of Month--->
		<cfset currentYear=Year(todayDate)>
		<cfset currentMonth=Month(todayDate)>
		<cfset firstDayofNextMonth=createDate(currentYear,currentMonth+1,1)>
		<cfset lastDayOfMonth=DateAdd("d",-1,firstDayofNextMonth)>
		<cfset lastDay=DateFormat(lastDayOfMonth,"yyyy-mm-dd")>
		
		<!---Last Five Days--->
		<cfoutput>
			Today's date : #todayDate# <br>
			Current month in numeric : #currentMonthInNumeric#<br>
			Current month in word : #currentMonthInWord#<br>
			Last Friday Date : #lastFriday# <br>
			Last Day of Month : #lastDay# <br>
	
		 	<!---Last Five Days--->
			<cfloop from="0" to="4" index="i">
				<cfset currentDate=DateAdd("d",-i,today)>
				<cfset formattedDate=DateFormat(currentDate,"dd-MMM-yyyy")>
				<cfset dayofWeek=DayOfWeek(currentDate)><br>
				<cfif dayofWeek EQ 1>
					<div style="color:red">#formattedDate#-Sunday</div>
				<cfelseif dayofWeek EQ 2>
					<div style="color:green">#formattedDate#-Monday</div>
				<cfelseif dayofWeek EQ 3>
					<div style="color:orange">#formattedDate#-Tuesday</div>
				<cfelseif dayofWeek EQ 4>
					<div style="color:yellow">#formattedDate#-Wednesday</div>
				<cfelseif dayofWeek EQ 5>
					<div style="color:black,font-weight:bold">#formattedDate#-Thursday</div>
				<cfelseif dayofWeek EQ 6>
					<div style="color:blue">#formattedDate#-Friday</div>
				<cfelseif dayofWeek EQ 7>
					<div style="color:red,font-weight:bold">#formattedDate#-Saturday</div>
				</cfif>
			</cfloop>	
		</cfoutput>	
	</body>
</html>

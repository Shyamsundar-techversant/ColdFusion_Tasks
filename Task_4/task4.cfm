<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<title>Task4</title>
		<link href="style.css" rel="stylesheet">
	</head>
	<body>
		<h1>Task 4</h1>

		<cfset dateObj=createObject("component","Components.task4")>
		<cfset todayDate=dateObj.todayDate()>
		<cfset monthInNumeric=dateObj.monthNumeric()>
		<cfset monthInWords=dateObj.monthWord()>
		<cfset lastFriday=dateObj.lastFriday()>
		<cfset lastDayMonth=dateObj.lastDateMonth()>

		<cfoutput><p>Today Date : #todayDate#</p></cfoutput><br>
		<cfoutput><p>Current Month In Numeric : #monthInNumeric#</p></cfoutput><br>
		<cfoutput><p>Current Month In Words : #monthInWords#</p></cfoutput><br>	
		<cfoutput><p>Last Friday Date : #lastFriday#</p></cfoutput><br>
		<cfoutput><p>Last Day of Month : #lastDayMonth#</p></cfoutput><br>

		 <!---Last Five Days--->
		<h3>Last Five Days :</h3>
		<cfloop from="0" to="4" index="i">
			<cfset currentDate=DateAdd("d",-i,todayDate)>
			<cfset formattedDate=DateFormat(currentDate,"dd-MMM-yyyy")>
			<cfset dayofWeek=DayOfWeek(currentDate)><br>
			<cfif dayofWeek EQ 1>
				<cfoutput><div class="sun">#formattedDate#-Sunday</div></cfoutput>
			<cfelseif dayofWeek EQ 2>
				<cfoutput><div class="mon">#formattedDate#-Monday</div></cfoutput>
			<cfelseif dayofWeek EQ 3>
				<cfoutput><div class="tue">#formattedDate#-Tuesday</div></cfoutput>
			<cfelseif dayofWeek EQ 4>
				<cfoutput><div class="wed">#formattedDate#-Wednesday</div></cfoutput>
			<cfelseif dayofWeek EQ 5>
				<cfoutput><div class="thu">#formattedDate#-Thursday</div></cfoutput>
			<cfelseif dayofWeek EQ 6>
				<cfoutput><div class="fri">#formattedDate#-Friday</div></cfoutput>
			<cfelseif dayofWeek EQ 7>
				<cfoutput><div class="sat">#formattedDate#-Saturday</div></cfoutput>
			</cfif>
		</cfloop>
	</body>
</html>

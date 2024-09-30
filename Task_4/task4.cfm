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

		<cfoutput>#todayDate#</cfoutput><br>
		<cfoutput>#monthInNumeric#</cfoutput><br>
		<cfoutput>#monthInWords#</cfoutput><br>	
		<cfoutput>#lastFriday#</cfoutput><br>
		<cfoutput>#lastDayMonth#</cfoutput><br>

		 <!---Last Five Days--->
		<cfloop from="0" to="4" index="i">
			<cfset currentDate=DateAdd("d",-i,todayDate)>
			<cfset formattedDate=DateFormat(currentDate,"dd-MMM-yyyy")>
			<cfset dayofWeek=DayOfWeek(currentDate)><br>
			<cfif dayofWeek EQ 1>
				<cfoutput><div style="color:red">#formattedDate#-Sunday</div></cfoutput>
			<cfelseif dayofWeek EQ 2>
				<cfoutput><div style="color:green">#formattedDate#-Monday</div></cfoutput>
			<cfelseif dayofWeek EQ 3>
				<cfoutput><div style="color:orange">#formattedDate#-Tuesday</div></cfoutput>
			<cfelseif dayofWeek EQ 4>
				<cfoutput><div style="color:yellow">#formattedDate#-Wednesday</div></cfoutput>
			<cfelseif dayofWeek EQ 5>
				<cfoutput><div style="color:black,font-weight:bold">#formattedDate#-Thursday</div></cfoutput>
			<cfelseif dayofWeek EQ 6>
				<cfoutput><div style="color:blue">#formattedDate#-Friday</div></cfoutput>
			<cfelseif dayofWeek EQ 7>
				<cfoutput><div style="color:red,font-weight:bold">#formattedDate#-Saturday</div></cfoutput>
			</cfif>
		</cfloop>
	</body>
</html>

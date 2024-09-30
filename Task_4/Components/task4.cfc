<cfcomponent>
	<!--- Currnet Date--->
	<cffunction name="todayDate" access="public" returntype="date">
		<cfset var local.today=DateFormat(Now(),"yyyy-mm-dd")>
		<cfreturn local.today>
	</cffunction>
	<!--- Currnet month in numeric--->
	<cffunction name="monthNumeric" access="public" returntype="date">
		<cfset var local.monthInNumeric=Month(Now())>
		<cfreturn local.monthInNumeric>	
	</cffunction>
	<!--- Currnet month in words--->
	<cffunction name="monthWord" access="public" returntype="string">
		<cfset var local.monthInWords=DateFormat(Now(),"mmmm")>
		<cfreturn local.monthInWords>
	</cffunction>
	<!--- Last Friday Date --->
	<cffunction name="lastFriday" access="public" returntype="date">
		<cfset var local.daysToLastFriday=DayOfWeek(Now()- 6)>
		<cfif local.daysToLastFriday LTE 0>
			<cfset local.daysToLastFriday+=7>
		</cfif>
		<cfset var local.lastFridayDate=DateAdd("d",-local.daysToLastFriday,Now())>
		<cfset var local.lastFridayFormat=DateFormat(local.lastFridayDate,"yyyy-mm-dd")>
		<cfreturn local.lastFridayFormat>
	</cffunction>
	<!--- Last Day of month--->
	<cffunction name="lastDateMonth" access="public" returntype="date">
		<cfset var local.currentYear=Year(Now())>
		<cfset var local.currentMonth=Month(Now())>
		<cfset var local.firstDayOfNextMonth=createDate(local.currentYear,local.currentMonth+1,1)>
		<cfset var local.lastDayofMonth=DateAdd("d",-1,local.firstDayOfNextMonth)>
		<cfset var local.lastDay=DateFormat(local.lastDayOfMonth,"yyyy-mm-dd")>
		<cfreturn local.lastDay>
	</cffunction>
	<!--- Last Five Day--->
</cfcomponent>







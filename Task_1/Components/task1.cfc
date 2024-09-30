<cfcomponent>
	<cffunction name="processGrade" access="public" returntype="string">
		<cfargument name="grade" type="numeric" required="true">
		<cfset var local.result="">
		<cfif grade EQ 5>
			<cfset local.result="Very good">
		<cfelseif grade EQ 4>
			<cfset local.result="Good">
		<cfelseif grade EQ 3>
			<cfset local.result="Fair">
		<cfelse>
			<cfset local.result="Ok">
		</cfif>

		<cfreturn local.result>
	</cffunction>
</cfcomponent>
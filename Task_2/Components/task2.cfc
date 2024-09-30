<cfcomponent>
	<cffunction name="processGrade" access="public" returntype="string">
		<cfargument name="grade" type="numeric" required="true">
		<cfset grade=arguments.grade>
		<cfset var local.result="">
		<cfswitch expression="#grade#">
			<cfcase value=5>
				<cfset local.result="Very Good">
			</cfcase>
			<cfcase value=4>
				<cfset local.result="Good">
			</cfcase>
			<cfcase value=3>
				<cfset local.result="Fair">
			</cfcase>
			<cfdefaultcase>
				<cfset local.result="Ok">
			</cfdefaultcase>
		</cfswitch>
		<cfreturn local.result>
	</cffunction>
</cfcomponent>
<cfcomponent>
	<cffunction name="processGrade" access="public" returntype="string">
		<cfargument name="grade" type="numeric" required="true">
		<cfset grade=arguments.grade>
		<cfswitch expression="#grade#">
			<cfcase value=5>
				<cfoutput>Very Good</cfoutput>
			</cfcase>
			<cfcase value=4>
				<cfoutput>Good</cfoutput>
			</cfcase>
			<cfcase value=3>
				<cfoutput>Fair</cfoutput>
			</cfcase>
			<cfdefaultcase>
				<cfoutput>Ok</cfoutput>
			</cfdefaultcase>
		</cfswitch>
	</cffunction>
</cfcomponent>
	<cfif structKeyExists(FORM,"grade")>
		<cfset grade=FORM.grade>
		<cfswitch expression=#grade#>
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
				<cfoutput>OK</cfoutput>
			</cfdefaultcase>
		</cfswitch>
	</cfif>
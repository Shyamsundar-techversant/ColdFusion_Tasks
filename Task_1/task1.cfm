	<cfif structKeyExists(FORM,"grade")>
		<cfset grade=FORM.grade>
		<cfif grade EQ 5>
			<cfoutput>Very Good</cfoutput>
		<cfelseif grade EQ 4>
			<cfoutput>Good</cfoutput>
		<cfelseif grade EQ 3>
			<cfoutput>Fair</cfoutput>
		<cfelse>
			<cfoutput>OK</cfoutput>
		</cfif>
	</cfif>
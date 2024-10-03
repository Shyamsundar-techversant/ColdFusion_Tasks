<cfloop from="1" to="3" index="i">
	<cfloop from="1" to="3" index="j">
		<cfset number=(j-1)*3+i>
		<cfoutput>#number#</cfoutput>&nbsp;
	</cfloop>
	<br>
</cfloop>
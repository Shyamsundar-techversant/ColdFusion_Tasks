	<cfif structKeyExists(FORM,"numbers")>
		<cfset numberVal=FORM.numbers>
		<cfset numArray=ListToArray(numberVal,",")>
		<cfset result="">
		<cfoutput>
			Number Divisible by 3:
			<cfloop array="#numArray#" index="num">
				<cfset num=Val(num)>
				<cfif num MOD 3 EQ 0>
					<cfset result=ListAppend(result,num)>
				<cfelse>
					<cfcontinue>
				</cfif>
			</cfloop>
			#result#
		</cfoutput>	
	</cfif>
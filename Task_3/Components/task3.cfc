<cfcomponent>
	<cffunction name="numEval" access="public" returntype="array">
		<cfargument name="numbers" type="string" required="true">
		<cfset var local.result="">
		<cfset numbers=arguments.numbers>
		<cfset numArray=listToArray(arguments.numbers,",")>
		<cfif len(arguments.numbers)>
			<cfloop array="#numArray#" index="num">
				<cfset num=Val(num)>
				<cfif num MOD 3 EQ 0>
					<cfset local.result=ListAppend(local.result,num)>
				<cfelse>
					<cfcontinue>
				</cfif>
			</cfloop>	
		</cfif>
		<cfreturn listToArray(local.result)>		
	</cffunction>
</cfcomponent>
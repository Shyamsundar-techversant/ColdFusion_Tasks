<cfcomponent>
	<cffunction name="multiply" access="public" returntype="numeric">
		<cfset var local.result=1>
		<cfloop from="1" to="#ArrayLen(arguments)#" index="i">
			<cfset local.result *= arguments[i]>
		</cfloop>
		<cfreturn local.result>
	</cffunction>
</cfcomponent>
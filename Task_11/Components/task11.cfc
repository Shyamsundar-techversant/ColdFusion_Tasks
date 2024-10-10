<cfcomponent>
	<cffunction name="multiply" access="public" returntype="numeric">
		<cfset var local.result=1>
		<cfloop from="1" to="#ArrayLen(arguments)#" index="local.i">
			<cfset local.result *= #local.i#>
		</cfloop>
		<cfreturn local.result>
	</cffunction>
</cfcomponent>
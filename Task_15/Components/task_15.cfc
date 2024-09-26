	<cfcomponent>
		<cffunction name="multiply" returntype="numeric" access="public" output="false">
			<cfset local.result=1>
			<cfif ArrayLen(arguments) EQ 0>
				<cfoutput>Atleast one argument is required</cfoutput>
			</cfif>
			<cfloop from="1" to="#ArrayLen(arguments)#" index="i">
				<cfset local.result=local.result*arguments[i]>
			</cfloop>
			<cfreturn local.result>
		</cffunction>
	</cfcomponent>
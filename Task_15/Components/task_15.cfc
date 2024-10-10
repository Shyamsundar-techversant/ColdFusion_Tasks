	<cfcomponent>
		<cffunction name="multiply" returntype="numeric" access="public" output="false">
			<cfset local.result=1>
			<cfif ArrayLen(arguments) EQ 0>
				<cfoutput>Atleast one argument is required</cfoutput>
			</cfif>
			<cfloop from="1" to="#ArrayLen(arguments)#" index="local.i">
				<cfset local.result*=#local.i#]>
			</cfloop>
			<cfreturn local.result>
		</cffunction>
	</cfcomponent>
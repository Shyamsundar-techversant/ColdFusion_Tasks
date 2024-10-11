<cfcomponent>
	<cffunction name="nameFun" access="public" returntype="struct">
		<cfargument name="num" type="numeric" required="true">
		<cfset var local.data=arguments.num>
		<cfset var local.returnData=structNew()>
		<cftry>
			<cfquery name="local.totalData" datasource="coldfusion" >
				SELECT firstname,lastname 
				FROM name
			</cfquery>
			<cfquery name="local.firstName" datasource="coldfusion">
				SELECT firstname
				FROM name
				LIMIT 1 OFFSET <cfqueryparam value="#local.data - 1#" cfsqltype="cf_sql_integer">
			</cfquery>
			<cfset local.returnData.totalData=local.totalData>
			<cfset local.returnData.firstName=local.firstName.firstname>
			<cfreturn local.returnData>
		<cfcatch>
			<cfoutput>#cfcatch.message#</cfoutput>
			<cfset local.returnData.error=cfcatch.message>
			<cfreturn local.returnData>
		</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>
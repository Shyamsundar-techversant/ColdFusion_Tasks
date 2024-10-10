<cfcomponent>
	<cffunction name="nameFun" access="public" returntype="struct">
		<cfargument name="num" type="numeric" required="true">
		<cfset var local.returnData=structNew()>
		<cftry>
			<cfquery name="local.dbData" datasource="coldfusion" >
				SELECT firstname,lastname,
				(
					SELECT firstname
					FROM name
					LIMIT 1
					OFFSET <cfqueryparam value="#arguments.num - 1#" cfsqltype="cf_sql_integer">				
				) AS resultName
				FROM name;
			</cfquery>
			<cfset local.returnData.result=local.dbData>
			<cfreturn local.returnData>
		<cfcatch>
			<cfoutput>#cfcatch.message#</cfoutput>
			<cfset local.returnData.error=cfcatch.message>
			<cfreturn local.returnData>
		</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>
<cfcomponent>
	<cffunction name="checkEmail" access="remote" returntype="boolean">
		<cfargument name="firstname" required="true" type="string">
		<cfargument name="email" required="true" type="string">
		<cftry>
			<cfquery name="local.validateEmail" datasource="coldfusion">
				SELECT email 
				FROM subscription
				WHERE email=<cfqueryparam value="#email#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfif isDefined("local.validateEmail")>
				<cfreturn false>
			</cfif>
		<cfcatch>
			<cfreturn true>
		</cfcatch>
		</cftry>
	</cffunction>
	<!---
	<cffunction name="insertData" access="public" returntype="boolean">
		<cfargument name="firstname" required="true" type="string">
		<cfargument name="email" required="true" type="string">
		<cftry>
			<cfquery name="local.addData" datasource="coldfusion">
				INSERT INTO subscription(firstname,email)
				VALUES(
				<cfqueryparam value="#firstname#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#email#" cfsqltype="cf_sql_varchar">
				)
			</cfquery>
			<cfdump var="#local.addData#">
			<cfreturn true>
		<cfcatch>
			<cfreturn false>
		</cfcatch>
		</cftry>	
	</cffunction>
	--->
</cfcomponent>

<cfcomponent>
	<cffunction name="checkEmail" access="remote" returnformat="JSON">
		<cfargument name="email"  type="string">
		<cfset local.result="">
		<cfdump var="#arguments#">
		<cftry>
			<cfquery name="local.validateEmail" datasource="coldfusion">
				SELECT 
					email 
				FROM 
					subscription
				WHERE 
					email=<cfqueryparam value="#email#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfif local.validateEmail.recordCount GT 0>
				<cfset local.result="Exists">
			<cfelse>
				<cfset local.result="NotExists">
			</cfif>
			<cfreturn local.result>
		<cfcatch>
			<cfoutput>#cfcatch.message#</cfoutput>
		</cfcatch>
		</cftry>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	</cffunction>

	
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
	
</cfcomponent>

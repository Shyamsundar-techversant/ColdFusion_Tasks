
<cfcomponent>
	<cffunction name="checkmail" access="remote" returnformat="JSON" >
        	<cfargument name="email" type="string" required="true">
        
    		<cfset var local = {}>
		<cfset local.cleanEmail = trim(arguments.email)>

       
        	<cfquery datasource="coldfusion" name="local.checkEmailQuery">
            		SELECT 
				COUNT(*) AS emailCount
            		FROM 
				subscription
            		WHERE 
				LOWER(email) = <cfqueryparam value="#lcase(local.cleanEmail)#" cfsqltype="cf_sql_varchar" maxlength="40">
        	</cfquery>

        
        	<cfif local.checkEmailQuery.emailCount GT 0>
            		<cfset local.result = "exists">
        	<cfelse>
            		<cfset local.result = "NotExists">
        	</cfif>

        
        	<cfreturn local.result>
    	</cffunction>

	<cffunction name="addSubscriber" access="remote" returntype="void">
        	<cfargument name="firstName" type="string" required="true">
        	<cfargument name="email" type="string" required="true">

        	<cfset var local = {}>

        	<cfquery datasource="subdetails">
            		INSERT INTO subscribers (firstname, email)
            		VALUES (
                		<cfqueryparam value="#arguments.firstName#" cfsqltype="cf_sql_varchar" maxlength="20">,
                		<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar" maxlength="40">
            		)
        	</cfquery>
    	</cffunction>
</cfcomponent>













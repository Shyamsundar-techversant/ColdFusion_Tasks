<cfparam name="form.firstName" default="">
<cfparam name="form.email" default="">

<cfset firstName = form.firstName>
<cfset email = form.email>

<cftry>
    <cfquery name="insertSubscriber" datasource="yourDataSource">
        INSERT INTO subscription(firstname, email)
        VALUES (<cfqueryparam value="#firstName#" cfsqltype="cf_sql_varchar">, <cfqueryparam value="#email#" cfsqltype="cf_sql_varchar">)
    </cfquery>
    
    <cfset result = {"success" = true}>
    <cfcatch>
        <cfset result = {"success" = false}>
    </cfcatch>
</cftry>

<cfheader name="Content-Type" value="application/json">
<cfoutput>#serializeJSON(result)#</cfoutput>

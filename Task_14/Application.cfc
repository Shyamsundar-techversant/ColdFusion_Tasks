<cfcomponent>
    <cfset this.name="logApp">
    <cfset this.sessionManagement=true>
    <cfset this.sessionTimeOut=createTimespan(0, 0, 30,0)>
</cfcomponent>
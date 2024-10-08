<cfcomponent>
    <cfset this.name="logApp">
    <cfset this.sessionManagement=true>
    <cfset this.sessionTimeOut=createTimespan(0, 0, 5,0)>
</cfcomponent>
<cfcomponent>
	<cfset this.name="captchaApp">
	<cfset this.sessionManagement="true">
	<cfset this.sessionTimeOut=createTimespan(0,0,30,0)>
	<cffunction name="onApplicationStart" returntype="boolean">
		<cfset application.captchaText=createUUID()>
		<cfreturn true>
	</cffunction>
</cfcomponent>
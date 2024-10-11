<cfcomponent>
	<cfset this.name="captchaApp">
	<cfset this.sessionManagement="true">
	<cfset this.sessionTimeOut=createTimespan(0,0,30,0)>
	<cffunction name="onApplicationStart" returntype="boolean">
		<cfset application.captchaText=createUUID()>
		<cfset session.captchaText=left(application.captchaText,6)>
		<cfreturn true>
	</cffunction>
</cfcomponent>
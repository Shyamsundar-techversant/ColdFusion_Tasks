<cfcomponent>
	<cfset this.name="Address book">
	<cfset this.sessionManagement="true">
	<cfset this.sessionTimeOut=createTimespan(0,0,30,0)>
	<cffunction name="onApplicationStart" returntype="void">
		<cfset application.imageSavePath="C:\ColdFusion2021\cfusion\wwwroot\CF_Tasks\Address_Book\Uploads">
		<cfset application.dbObj=createObject("component","Components.main")>
	</cffunction>	
</cfcomponent>

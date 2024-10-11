<cfcomponent>
	<cfset this.name="logApp">
	<cfset this.sessionManagement=true>
	<cfset this.sessionTimeOut=createTimespan(0, 0, 30,0)>
	<cffunction name="onApplicationStart" returntype="boolean">
		<cfset application.imageSavePath="C:\ColdFusion2021\cfusion\wwwroot\CF_Tasks\Task_14\Images">
		<cfset application.thumbPath="C:\ColdFusion2021\cfusion\wwwroot\CF_Tasks\Task_14\Thumbnail">
		<cfreturn true>
	</cffunction>
</cfcomponent>
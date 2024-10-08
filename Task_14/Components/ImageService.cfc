<cfcomponent>
	<cffunction name="uploadImage" access="public" returntype="struct">
		<cfargument name="form" required="true">
		<cfargument name="fileField" required="true">
		<cfset var local = {}> <!-- Create local scope -->

		<cftry>
			<!-- Upload Image -->
			<cffile action="upload" 
					fileField="#arguments.fileField#" 
					destination="C:\ColdFusion2021\cfusion\wwwroot\CF_Tasks\Task_14\Images" 
					nameConflict="makeunique">

			<!-- Thumbnail Creation -->
			<cfset local.thumbnailFileName = "thumb_#cffile.serverFile#">
			<cfimage source="#cffile.serverDirectory##cffile.serverFile#" 
					 action="resize" 
					 width="20" 
					 height="20" 
					 destination="#cffile.serverDirectory##local.thumbnailFileName#">

			<!-- Store Image Details -->
			<cfset local.imageDetails = {
				"imageName" = arguments.form.imageName,
				"description" = arguments.form.description,
				"fileName" = cffile.serverFile,
				"filePath" = cffile.serverDirectory,
				"fileUrl" = "/CF_Tasks/Task_14/Images/#cffile.serverFile#",
				"thumbnailUrl" = "/CF_Tasks/Task_14/Images/#local.thumbnailFileName#"
			}>

			<!-- Store Image In Session -->
			<cfif NOT structKeyExists(session, "uploadedImages")>
				<cfset session.uploadedImages = []>
			</cfif>
			<cfset arrayAppend(session.uploadedImages, local.imageDetails)>

			<cfreturn local.imageDetails>	
		<cfcatch>
			<cfthrow message="Upload Failed: #cfcatch.message#">
		</cfcatch>		
		</cftry>
	</cffunction>
</cfcomponent>

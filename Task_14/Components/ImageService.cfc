	<cfcomponent>
		<!---Method to upload image--->

		<cffunction name="uploadImage" access="public" returntype="struct">
			<cfargument name="form" required="true">
			<cfargument name="fileField" required="true">
			<cfset var imageDetails={}>
			<cfset var allowedExtensions="jpg,jpeg,png,gif">
			<cfset var maxFileSize=1*1024*1024>
				
			<cftry>
				<!---Upload Image--->
				<cffile action="upload" filefield="#arguments.fileField#" destination="C:/ColdFusion2021/cfusion/wwwroot/CF_Tasks/Task_14/Images" 				accept="#allowedExtensions#" nameconflict="makeunique">	
				
				<!---File Type validaton--->
				<cfif cffile.clientFileExt NOT IN listToArray(allowedExtensions)>
					<cfthrow message="Invalid file type.Please upload jpg,png,or gif files only">
				</cfif>

				<!---File size validation--->
				<cfif cffile.fileSize GT maxFileSize>
					<cfthrow message="File size cannot exceeds 1 MB">	
				</cfif>	

				<!--- Thumbnail Creation--->
				<cfset var thumbnailFileName="thumb_#cffile.serverFile#">
				<cfimage source="#cffile.serverDirectory##cffile.serverFile#" action="resize" width="20" height="20" 								destination="#cffile.serverDirectory##thumbNailFileName#">

				<!---Store Image Details--->
				<cfset local.imageDetails={
					"imageName"=arguments.form.imageName,
					"description"=arguments.form.description,
					"fileName"=cffile.serverFile,
					"filePath"=cffile.serverDirectory,
					"fileUrl"=C:/ColdFusion2021/cfusion/wwwroot/CF_Tasks/Task_14/Images/#cffile.serverFile#,
					"thumbnailUrl"=C:/ColdFusion2021/cfusion/wwwroot/CF_Tasks/Task_14/Images/#thumbNailFileName#
				}>
				
				<!---Store Image In Session--->
				<cfif NOT sturctKeyExists(session,"uploadedImages")>
					<cfset session.uploadedImages=[]>
				</cfif>
				<cfset arrayAppend(session.uploadedImages,imageDetails)>

				<cfreturn imageDetails>	
			<cfcatch>
				<cfthrow message="Upload Failed:#cfcatch.message#>
			</cfcatch>		
			</cftry>	
		</cffunction>

	</cfcomponent>
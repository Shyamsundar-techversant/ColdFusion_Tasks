	<cfcomponent>
		<!---Method to upload image--->

		<cffunction name="uploadImage" access="public" returntype="struct">
			<cfargument name="form" required="true">
			<cfargument name="fileField" required="true">
			<cfset var imageDetails={}>
			<cfset var allowedExtensions=".jpg,.jpeg,.png,.gif">
			<cfset var maxFileSize=1*1024*1024>
				
			<cftry>
				<!---Upload Image--->
				<cffile action="upload" filefield="#arguments.fileField#" destination="C:/ColdFusion2021/cfusion/wwwroot/CF_Tasks/Task_14/Images" 					accept="#allowedExtensions#" nameconflict="makeunique">	
				
				<!---File Type validaton--->
					<cfif cffile.clientFileExt NOT IN listToArray(allowdExtensions)>
						<cfthrow message="Invalid file type.Please upload jpg,png,or gif files only">
					</cfif>
				<!---File size validation--->
					<cfif cffile.fileSize GT maxFileSize>
						<cfthrow message="File size cannot exceeds 1 MB">	
					</cfif>	
				<!--- Thumbnail Creation--->
					<cfset var thumbnailFileName="thumb_#cffile.serverFile#">
					
				
			<cfcatch>
		
			</cfcatch>
		
			</cftry>	
		</cffunction>

	</cfcomponent>
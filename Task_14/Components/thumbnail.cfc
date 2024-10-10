<cfcomponent>
	<cffunction name="imgToThumbNail" access="public" returntype="boolean">
		<cfargument name="imageName" type="string" required="true">
		<cfargument name="description" type="string" required="true">
		<cfargument name="imageFile" required="true" type="string">
		<cftry>
			<!--- Resize the image--->
			<cfimage 
				action="resize"
				source="#arguments.imageFilePath#"
				width="20"
				height="20"
				destination="#arguments.thumbNailPath#">
			<!--- Store image details into sesssion--->
			<cfif NOT structKeyExists(session,"uploadedImages")>
				<cfset session.uploadedImages=[]>
			</cfif>		
			<cfset newImageDetails={
				"imageName"=#arguments.imageName#,
				"description"=#arguments.description#,
				"imageUrl"= "./Images/#arguments.imageFile#",
				"thumbNailUrl"= "./Thumbnail/thumb_#arguments.imageFile#"
				}>	
			<!--- Append new image details to new session array--->
			
			<cfreturn true>
		<cfcatch>

		</cfcatch>
		</cftry>	
		<cfreturn true>

	</cffunction>
</cfcomponent>

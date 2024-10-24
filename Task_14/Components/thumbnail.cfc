<cfcomponent>
	<cffunction name="imgToThumbNail" access="public" returntype="boolean">
		<cfargument name="imageName" type="string" required="true">
		<cfargument name="description" type="string" required="true">
		<cfargument name="imageFilePath" type="string" required="true">
		<cfargument name="thumbNailPath" type="string" required="true">
		<cfargument name="imageFile" type="string" required="true">
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
				<cfset newImageDetails={
					"imageName"=#arguments.imageName#,
					"description"=#arguments.description#,
					"imageUrl"= "./Images/#arguments.imageFile#",
					"thumbNailUrl"= "./Thumbnail/thumb_#arguments.imageFile#"
					}>	
				<!--- Append new image details to new session array--->
				<cfset arrayAppend(session.uploadedImages,newImageDetails)>
			</cfif>
			<cfreturn true>
		<cfcatch>
			<cfoutput>#cfcatch.message#</cfoutput>
			<cfreturn false>
		</cfcatch>
		</cftry>	
		<cfreturn true>
	</cffunction>
</cfcomponent>

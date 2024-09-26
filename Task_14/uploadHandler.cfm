	<cfset imageService=createObject("component","Components.ImageService")>
	<cftry>
		<!---Call the CFC function to upload image --->
		<cfset imageDetails=imageService.uploadImage(form,"imageFile")>
		<cfoutput>Image Uploaded successfully</cfoutput>
		<cflocation url="imageList.cfm">
	<cfcatch>
		<cfthrow message="#cfcatch.message#">
	</cfcatch>
	</cftry>
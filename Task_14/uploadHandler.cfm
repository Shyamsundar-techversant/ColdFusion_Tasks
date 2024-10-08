	<cfif structKeyExists(form,"imageName") AND structKeyExists(form,"description") AND structKeyExists(form,"imageFile")>
		<cffile action="upload" filefield="imageFile" destination="C:\ColdFusion2021\cfusion\wwwroot\CF_Tasks\Task_14\Images"
				nameconflict="makeunique">
		<cfset imageFilePath="C:\ColdFusion2021\cfusion\wwwroot\CF_Tasks\Task_14\Images\#cffile.SERVERFILE#">	
		<cfdump var="#cffile#" abort>

		<!--- Create Thumbnail Path--->	
		<cfset thumbNailFilePath="C:\ColdFusion2021\cfusion\wwwroot\CF_Tasks\Task_14\Thumbnail\thumb_#cffile.SERVERFILE#">
		
		<!--- Resize--->
		<cfimage action="resize"
			 source="#imageFilePath#"
			 width="20"
			 height="20"
			 destination="#thumbNailFilePath#">

		<!--- Store the Image details into session--->
		<cfif NOT structKeyExists(session,"uploadedImages")>
			<cfset session.uploadedImages=[]>		
		</cfif>
		<cfset newImageDetails={
			"imageName" = form.imageName,
			"description" = form.description,
			"imageUrl" = "./Images/#cffile.SERVERFILE#",
			"thumbnailUrl" = "./Thumbnail/thumb_#cffile.SERVERFILE#"
			}>
		<!---Append New image Details to Session Array--->
		<cfset arrayAppend(session.uploadedImages,newImageDetails)>
		<cfoutput>
			<p>Image Uploaded Successfully.</p>
			<a href="imageList.cfm">Image List</a>
		</cfoutput>
	</cfif>
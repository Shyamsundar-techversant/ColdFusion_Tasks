	<cfset imageDetails=''>
	
	<!---Loop through the session images to find the selected one  --->
	<cfloop array="#session.uploadedImages#" index="image">
		<cfif image.imageName EQ URL.imageName>
			<cfset imageDetails=image>
		</cfif>	
	</cfloop>

	<cfif imageDetials NEQ ''>
		<h2>Image Details</h2>
		<p><strong>Name:</strong>#imageDetials.imageName#</p>
		<p><strong>Description:</strong>#imageDetails.description#</p>
		<p><img src="#imageDetails.fileUrl#" alt="#imageDetails.imageName#"></p>
	<cfelse>
		<p>No images found</p>
	</cfif>
	<cfoutput>
		<h2>Uploaded Image</h2>
		<cfif arrayLen(session.uploadeImage) GT 0)>
			<cfloop array="#session.uploadedImages#" index="image">
				<div>
					<!--- Display the thumbnail image--->
					<img src="#image.thumbnailUrl#" width="20" height="20" alt="#image.imageName#">
					
					<a href="imageDetails.cfm?imageName=#URLEncodedFormat(image.imageName)#">#image.imageName#</a>
				</div>
			</cfloop>		
		<cfelse>
			<cfoutput>No Images Uploded yet</cfoutput>
		</cfif>
	</cfoutput>
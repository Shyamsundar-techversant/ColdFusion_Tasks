<cfparam name="url.imageName" default="">

<cfif url.imageName NEQ "">
    <!--- Find the selected image from the session --->
    <cfset selectedImage = "" />
    <cfloop array="#session.uploadedImages#" index="image">
        <cfif image.imageName EQ url.imageName>
            <cfset selectedImage = image>
            <cfbreak>
        </cfif>
    </cfloop>

    <cfif isDefined("selectedImage") AND isStruct(selectedImage)>
        <h2>Image Details</h2>
        <p><strong>Image Name:</strong> <cfoutput>#selectedImage.imageName#</cfoutput></p>
        <p><strong>Description:</strong><cfoutput> #selectedImage.description#</cfoutput></p>
        <p><strong>Uploaded Image:</strong><br>
            <img src="<cfoutput>#selectedImage.imageUrl#</cfoutput>" alt="<cfoutput>#selectedImage.imageName#</cfoutput>" width="200">
        </p>
        <a href="imageList.cfm">Back to Image List</a>
    <cfelse>
        <p>No details found for this image.</p>
    </cfif>
<cfelse>
    <p>No image selected.</p>
</cfif>

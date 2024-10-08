<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image List</title>
</head>
<body>
    <h2>Uploaded Images</h2>

    <cfif structKeyExists(session, "uploadedImages") AND arrayLen(session.uploadedImages) GT 0>
        <table border="1" cellpadding="10" cellspacing="0">
            <thead>
                <tr>
                    <th>Thumbnail</th>
                    <th>Image Name</th>
                </tr>
            </thead>
            <tbody>
                <cfloop array="#session.uploadedImages#" index="image">
                    <tr>
                        <td>
                            <img src="<cfoutput>#image.thumbnailUrl#</cfoutput>" alt="Thumbnail for #image.imageName#" width="20" height="20">
                        </td>
                        <td>
                            <!--- Link the image name to the details page --->
                            <a href="imageDetails.cfm?imageName=<cfoutput>#urlEncodedFormat(image.imageName)#</cfoutput>"><cfoutput>#image.imageName#</cfoutput></a>
                        </td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    <cfelse>
        <p>No images have been uploaded yet.</p>
    </cfif>
</body>
</html>

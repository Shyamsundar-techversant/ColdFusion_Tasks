<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>TASK 14</title>
	</head>
	<body>
		<h2>TASK 14</h2>
		<form name="img-form" action="" method="post" enctype="multipart/form-data">
			<label for="img-name">Enter Image name</label>
			<input type="text" id="img-name" name="imageName"><br><br>
			<label for="description">Description</label>
			<textarea id="description" row="5" cols="20" name="description"></textarea><br><br>
			<label for="img">Upload Image : </label>
			<input type="file" name="imageFile" accept=".jpg,.png,.jpeg,.gif" id="img" required onchange="return validateImg()">
			<div id="imgError"></div><br>
			<input type = "submit" value="Upload" onclick="validateForm(event)">	
		</form>	
		<script src="script.js"></script>

		<h2>Result</h2>
			
		 <cfif structKeyExists(form,"imageName") AND structKeyExists(form,"description") AND structKeyExists(form,"imageFile")>
			<cfset imgObj=createObject("component","Components.thumbnail")>
			<cfset imageName=form.imageName>
			<cfset description=form.description>
			<cffile action="upload" fileField="imageFile" destination="#application.imageSavePath#" nameconflict="makeunique">
			<cfset imageFilePath="#application.imageSavePath##cffile.SERVERFILE#">
			<cfset imageFile="#cffile.SERVERFILE#">
			<!---Create Thumbnail path--->
			<cfset thumbNailPath="#application.thumbPath#thumb_#cffile.SERVERFILE#">
			<cfset imgObj=createObject("component","Components.thumbnail")>
			<cfset result=imgObj.imgToThumbNail("#imageName#","#description#","#imageFile#")>			
		</cfif> 
	</body>
</html>
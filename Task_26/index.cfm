<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Task 26</title>
	</head>
	<body>
		<h1>Task 26</h1>
		<form name="data-form" action="index.cfm" method="post" enctype="multipart/form-data">
			<label for="fileUpload">Upload the file : </label>
			<input type="file" id="fileUpload" name="fileUpload"><br><br>
			<input type ="submit" value="submit">
		</form>

		<h2>Result: </h2>
		<cfif structKeyExists(form,"fileUpload")>
			<cffile action="upload" filefield="fileUpload" destination="#application.filePath#" nameconflict="makeunique" result="fileUploaded">
			<cfset uploadedPath="#application.filePath#\#fileUploaded.SERVERFILE#">
			<!--- Reading the text content from the file --->
			<cfif fileUploaded.FILEEXISTED>
				<cfset fileContent=fileRead(uploadedPath)>
				<cfset wordList=listToArray(fileContent, " ,.!?")>
				<cfset addObj=createObject("component","Components.task_26")>
				<cfset result=addObj.addWordsToDb("#wordList#")>
				<cfif result>	
					<cfoutput>#arrayLen(wordList)# words have been inserted into the database.</cfoutput>
				</cfif>
			<cfelse>
				<cfoutput>Error in uploading the file</cfoutput>
			</cfif>
		<cfelse>
			<cfoutput>No file uploaded</cfoutput>
		</cfif>
	</body>
</html>
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
			<cffile action="upload" filefield="fileUpload" destination="C:\ColdFusion2021\cfusion\wwwroot\CF_Tasks\Task_26\Uploads" 						nameconflict="makeunique" result="fileUploaded">
			<cfset uploadedPath="C:\ColdFusion2021\cfusion\wwwroot\CF_Tasks\Task_26\Uploads\#fileUploaded.SERVERFILE#">
			<!--- Reading the text content from the file --->
			<cfif fileUploaded.FILEEXISTED>
				<cfset fileContent=fileRead(uploadedPath)>
				<cfset wordList=listToArray(fileContent, " ,.!?")>
				<cfloop array="#wordList#" index="word">
					<cfif len(word) GT 0>
						<cfquery datasource="coldfusion">
							INSERT INTO docData(words)
							VALUES(<cfqueryparam value="#word#" cfsqltype="cf_sql_varchar">)
						</cfquery>		
					</cfif>
				</cfloop>
				<cfoutput>#arrayLen(wordList)# words have been inserted into the database.</cfoutput>
			<cfelse>
				<cfoutput>Error in uploading the file</cfoutput>
			</cfif>
		<cfelse>
			<cfoutput>No file uploaded</cfoutput>
		</cfif>
	</body>
</html>
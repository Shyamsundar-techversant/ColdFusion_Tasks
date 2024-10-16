<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Task 25</title>
	</head>
	<body>
		<h1>Task 25</h1>
		<form name="data-form" action="index.cfm" method="post">
			<label for="text">Enter something:</label><br>
			<textarea name="textData" id="text" rows="10" cols="25">
			</textarea><br><br>
			<input type="submit" value="Submit">
		</form>
		<h2>Result:</h2>
		<cfif structKeyExists(form,"textData")>
			<cfset text=trim(form.textData)>
			<!--- Split the text into individual words --->
			<cfset wordList = listToArray(text, " ,.!?")>
			<var dump="#wordList#">
			<cfset addObj=createObject("component","Components.task_25")>
			<cfset result=addObj.addWordsToDb("#wordList#")>
			<cfif result>
				<cfoutput>#arrayLen(wordList)# words have been inserted into the database.</cfoutput>
			</cfif>
		<cfelse>
			<cfoutput>No data received.</cfoutput>
		</cfif>
	</body>
</html>
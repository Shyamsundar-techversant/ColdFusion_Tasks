<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8>
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<title>Task 2</title>
	</head>
	<body>
		<h1>Task 1</h1>
		<form name="first-task-form" action="task2.cfm" method="post" >
			<label for="value">Value</label>
			<input type="number" id="value" min="1" max="5" name="grade">
			<input type="submit">
		</form>	
		<cfif structKeyExists(FORM,"grade")>
			<cfset gradeObj=createObject("component","Components.task2")>
			<cfset result=gradeObj.processGrade(form.grade)>	
			<cfoutput>Result: #result#>
		</cfif>
	</body>
</html>


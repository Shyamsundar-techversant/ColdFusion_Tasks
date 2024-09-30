<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<title>Task 3</title>
	</head>
	<body>
		<h1>Task 3</h1>
		<form name="first-task-form" action="task3.cfm" method="post" >
			<label for="value">Value</label>
			<input type="text" id="value" name="numbers">
			<input type="submit">
		</form>
		<cfif structKeyExists(form,"numbers")>
			<cfset numObj=createObject("component","Components.task3")>
			<cfset result=numObj.numEval(form.numbers)>
			<cfdump var="#result#">
		</cfif>
	</body>
</html>

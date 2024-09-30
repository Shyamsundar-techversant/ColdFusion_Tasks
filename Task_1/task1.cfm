
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<title>Task 1</title>
	</head>
	<body>
		<h1>Task 1</h1>
		<form name="first-task-form" action="task1.cfm" method="post" >
			<label for="value">Value</label>
			<input type="number" id="value" min="1" max="5" name="grade">
			<input type="submit">
		</form>
		<cfif structKeyExists(form,"grade")>
			<cfinvoke component="Components.task1" method="processGrade" returnvariable="result">
				<cfinvokeargument name="grade" value="#form.grade#">
			</cfinvoke>
			<cfoutput>
				Result:#result#
			</cfoutput>
		</cfif>
	</body>
</html>
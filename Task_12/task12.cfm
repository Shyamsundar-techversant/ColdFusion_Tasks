<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>TASK 12</title>
	</head>
	<body>
		<h1>TASK 12</h1>

		<form name="data-form" action="" method="post">
			<label for="value">Enter value : </label>
			<input type="number" max="9" id="value" name="value">
			<input type="submit" value="Submit">
		</form>
		
		<cfif structKeyExists(FORM,"value")>
		
			<cfquery name="name" datasource="coldfusion">
				SELECT * FROM name;
			</cfquery>
			<cfdump var="#name#">
		</cfif>
	</body>
</html>

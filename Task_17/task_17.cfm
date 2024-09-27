	<!DOCTYPE html>
	<html lang="en">
		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">	
			<title>Task 17</title>
			<link href="style.css" rel="stylesheet">
		</head>
		<body>
			<h1>Task 17</h1>
			<form name="num-form" action="" method="post" id="numForm">
				<label for="value">Enter a value : </label>
				<input type="text" id="value" name="value" autocomplete="off" placeholder="Enter a number"><br>
				<span class="error" id="validation-error"></span><br>
				<input type="submit" value="Submit"><br>
			</form>
	
			<cfif structKeyExists(form,"value")>
				<cfset num=form.value>
				<cfif num MOD 2 EQ 0>
					<cfoutput><div class="even">1</div></cfoutput>
				<cfelse>
					<cfoutput><div class="odd">1</div></cfoutput>
				</cfif>
			</cfif>	
		</body>

		<script src="script.js"></script>
	</html>
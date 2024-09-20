<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Task 9 </title>		
	</head>
	<body>
		<h1>Task 9</h1>

		<form name="struct-form" action="" method="post">
			<label for="value1">Enter value 1 : </label>
			<input type="text" id="value1" name="value1"><br><br>
			<label for="value2">Enter value 2 : </label>
			<input type="text" id="value2" name="value2"><br><br>	
			<input type="submit" value="Submit">			
		</form>
		
		<h2>Output</h2>
		<cfapplication name="form" sessionManagement="true" sessionTimeout="#createTimeSpan(0,0,2,0)#">
		<cfif structKeyExists(FORM,"value1") AND structKeyExists(FORM,"value2")>
			<cfset keyToAdd=FORM.value1>
			<cfset valueToAdd=FORM.value2>
			<cfif NOT structKeyExists(session,"formData")>
				<cfset session.formData=structNew()>
			</cfif>
			<cfif structKeyExists(session.formData,keyToAdd)>
				<cfoutput><p>#keyToAdd# already present.Cannot add again</p></cfoutput>
			<cfelse>
				<cfset session.formData[keyToAdd]=valueToAdd>
				<cfdump var="#session.formData#">
			</cfif>
			
		<cfelse>
			<cfoutput>Invalid Inputs</cfoutput>
		</cfif>
	</body>
</html>
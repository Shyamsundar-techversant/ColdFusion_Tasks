<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Task 24</title> 
	</head>
	<body>
		<h1>Task 24</h1>
		<form name="subscribe-form" action="" method="post">
			<input type="text" id="firstname" placeholder="Enter your firstname" required name="firstname"><br>
			<input type="email" id="email" placeholder="Enter your email" name="email">
			<button id="check-btn">Check</button><br><br>
			<span id="email-error"></span>
			<button type="submit" id="submit-btn" disabled>Submit</button>
		</form> 

		
		<cfif structKeyExists(form,"firstname") AND structKeyExists(form,"email")>
			<cfset dbObj=createObject("component","Components.checkEmail")>
			<cfset result=dbObj.insertData("#form.firstname#","#form.email#")>	
		</cfif>		
		<script src="jquery-3.7.1.js"></script>
		<script src="script.js"></script> 
	</body>
</html>
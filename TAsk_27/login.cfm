<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="style.css" rel="stylesheet">
		<title>Task 27</title>
	</head>
	<body>
		<section class="form-section">
			<div class="container">
				<form name="data-form" action="" method="post">
					<div class="header">
						<h4>LogIn</h4>
					</div>
					<div class="user-data">
						<input type="text" id="username" name="userName" placeholder="Enter Username" autocomplete="off">
						<input type="password" id="password" name="password" placeholder="Enter the password" autocomplete="off">
						<div><input type="submit" value="Submit" class="submit-form"></div>
					</div>
				</form>
			</div>
		</section>
		<cfif structKeyExists(form,"userName") AND structKeyExists(form,"password")>
			<cfset validUser=false>
			<!--- Querry the database to check the username and password --->
			<cfquery name="getUser" datasource="coldfusion">
				SELECT * FROM userAuth
				WHERE username=<cfqueryparam value="#form.userName#" cfsqltype="cf_sql_varchar">
				AND userPassWord=<cfqueryparam value="#form.password#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<!---If user exists --->
			<cfif getUser.recordCount EQ 1>
				<cfset validUser=true>
				<cfset session.isLoggedIn=true>
				<cfset userName=form.userName>
				<cflocation url="welcome.cfm">
			<cfelse>
				<cfoutput>Inavalid username or password.</cfoutput>
			</cfif>
		<cfelse>
			<cfoutput>No data submitted.</cfoutput>
		</cfif>


	</body>
</html>
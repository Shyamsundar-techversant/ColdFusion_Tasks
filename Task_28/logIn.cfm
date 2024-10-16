<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="style.css" rel="stylesheet">
		<title>LogIn</title>
	</head>
	<body>
		<section class="form-section">
			<div class="container">
				<form name="data-form" action="" method="post">
					<div class="header">
						<h4>LogIn</h4>
					</div>
					<div class="user-data">
						<input type="email" id="email" name="email" placeholder="Enter your email">
						<input type="password" id="password" name="password" placeholder="Enter the password">
						<div><input type="submit" value="LogIn" class="submit-form"></div>
					</div>
					<div class="reg-log">
                        			<a href="reg.cfm">Don't have an accounter?Register here.</a>
                    			</div>
				</form>
			</div>
		</section>
		<cfif  structKeyExists(form,"email") AND structKeyExists(form,"password")>
			<cfset dbObj=createObject("component","Components.task_28")>
			<cfset result=dbObj.userLogIn("#form.email#","#form.password#")>
		</cfif>
	</body>
</html>
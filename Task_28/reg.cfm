<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="style.css" rel="stylesheet">
		<title>Register</title>
	</head>
	<body>
		<section class="form-section">
			<div class="container">
				<form name="data-form" action="" method="post">
					<div class="header">
						<h4>Register</h4>
					</div>
					<div class="user-data">
						<input type="text" id="username" name="username" placeholder="Enter Username">
                        			<input type="email" id="email" name="email" placeholder="Enter your Email">
						<input type="password" id="password" name="password" placeholder="Enter the password">
						<select name="role">
							<option value="">Select your role</option>
							<option value="admin">Admin</option>
							<option value="editor">Editor</option>
							<option value="user">User</option>
						</select>
						<div><input type="submit" value="Register" class="submit-form"></div>
					</div>
					<div class="reg-log">
						<a href="logIn.cfm">Already have an account? Please LogIn.</a>
					</div>
				</form>
			</div>
		</section>
  
       		 <cfif structKeyExists(form, "username") AND structKeyExists(form,"email") 
           		 AND structKeyExists(form,"password") AND structKeyExists(form, "role")>
         		   <cfset dbObj=createObject("component","Components.task_28")>
         		   <cfset result=dbObj.registerUser("#form.username#","#form.email#","#form.password#","#form.role#")>
     		 </cfif>
	</body>
</html>
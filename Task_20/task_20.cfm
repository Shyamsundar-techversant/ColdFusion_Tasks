<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Task 20</title>
	</head>
	<body>
		<!---Genereate Captcha Text--->
		<cfapplication  name="Form" sessionManagement="true" sessionTimeout="#createTimeSpan(0,0,2,0)#">
		<cfif NOT structKeyExists(session,"captchaText") OR NOT structKeyExists(form,"captchaUser")>
			<cfset captchaText=createUUID()>
			<cfset session.captchaText=left(captchaText,6)>
		</cfif>
		<!---Store the Captch text in Session--->

		<!---Create Captcha Image--->
		
		<h1>Task 20</h1>
		<form name="data-form" action="" method="post">
			<label for="user-email">Enter Email : </label>
			<input type="email" id="user-email" name="userEmail"><br><br>
			<label for="captcha">Enter CAPTCHA : </label>
			<cfimage action="captcha" width="500"
			 height="100" fontsize="24" font="Arial"
			 text="#session.captchaText#">	
			</cfimage>
			<input type="text" id="captcha" name="captchaUser" required><br><br>
			<input type="submit" value="Submit">
		</form>
		<cfif structKeyExists(form,"userEmail") AND structKeyExists(form,"captchaUser")>
			<cfif form.captchaUser EQ session.captchaText>
				<cfoutput>Email Address Successfully subscribe our newsletter.</cfoutput>
			<cfelse>
				<cfoutput>Invalid Captcha.</cfoutput>
			</cfif>
		</cfif>
	</body>
</html>
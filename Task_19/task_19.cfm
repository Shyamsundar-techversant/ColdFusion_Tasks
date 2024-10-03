<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport",content="width=device-width, initial-scale=1.0">
		<title>Task 19</title>
	</head>
	<body>
		<form name="web-form" action="" method="post">
			<input type="submit" Value="Submit">
		</form>
		
		<cfif structKeyExists(cookie,"VisitsCounter")>
			<cfset visits=cookie.VisitsCounter+1>
		<cfelse>
			<cfset visits=1>
		</cfif>

		<!--- Set the Updated Value of Cookie--->
		<cfcookie name="VisitsCounter" value="#visits#" expires="#dateAdd('n', 5, now())#">
		<cfoutput>You visited the website #visits# times.</cfoutput>
		
		<script>
			//Prevent resubmit on refresh and back button
			if(window.history.replaceState){
				window.history.replaceState(null,null,window.location.href);
			}
		</script>
	</body>
</html>
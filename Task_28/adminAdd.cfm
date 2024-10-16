<cfif not structKeyExists(session, "username") OR (session.role NEQ "admin" AND session.role NEQ "editor")>
	<cflocation url="redirect.cfm" addtoken="false">
</cfif>
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
						<h4>Add Page</h4>
					</div>
					<div class="user-data">
						<input type="text" id="pagename" name="pagename" placeholder="Enter page name" class="data-inputs">
						<label for="pagedesc">About the page:</label>
						<textarea name="pagedesc" id="pagedesc" cols="15" rows="10">
						</textarea>
						<div><input type="submit" value="Add" class="submit-form"></div>
					</div>
				</form>
			</div>
		</section>
		<cfif  structKeyExists(form,"pagename") AND structKeyExists(form,"pagedesc")>
			<cfset result=application.dbObj.addPage("#form.pagename#","#form.pagedesc#")>
		</cfif>
	</body>
</html>
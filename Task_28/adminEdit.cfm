<cfif not structKeyExists(session, "username") OR (session.role NEQ "admin" AND session.role NEQ "editor")>
	<cflocation url="redirect.cfm" addtoken="false">
<cfelse>
	<cfparam name="url.id" default=0>
	<cfif url.id NEQ 0>
		<cfset result = application.dbObj.getPage(#url.id#)>	
	</cfif>
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
						<h4>Edit Page</h4>
					</div>
					<div class="user-data">
						<cfoutput>
							<input type="text" id="pagename" name="pagename" placeholder="Enter page name" class="data-inputs"
								value="#result.pagename#">
							<label for="pagedesc">About the page:</label>
							<textarea name="pagedesc" id="pagedesc" cols="15" rows="10">
								#result.pagedesc#
							</textarea>
							<div><input type="submit" value="Edit" class="submit-form"></div>
						</cfoutput>
					</div>
				</form>
			</div>
		</section>
		<cfif  structKeyExists(form,"pagename") AND structKeyExists(form,"pagedesc") AND url.id NEQ 0>
			<cfset pageid=Val(url.id)>
			<cfset pagename=form.pagename>
			<cfset pagedesc=form.pagedesc>
			<cfset editPageData=application.dbObj.editPage(#pageid#,"#pagename#","#pagedesc#")>
		</cfif>
	</body>
</html>
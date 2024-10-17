<cfif not structKeyExists(session, "username") OR (session.role NEQ "admin" AND session.role NEQ "editor")>
	<cflocation url="redirect.cfm" addtoken="false">
<cfelse>
	<h1>Welcome <cfoutput>#session.username#</cfoutput></h1>
	<cfset result=application.dbObj.displayData()>
</cfif>

<html>
	<head>
		<title>Admin Dashboard</title>
		<link href="style.css" rel="stylesheet">
	</head>
	<body>
		<section class="admin-section">
			<div class="container">
 				<div class="add-page">
					<button class="add-btn"><a href="adminAdd.cfm">Add</a></button>
				</div>
				<table border="1">
					<tr>
						<th>Pagename</th>
						<th>PageDesc</th>
						<th>Options</th>
					</tr>
					<cfoutput>
						<cfloop query="#result#"> 
							<tr>
 								<td>#result.pagename#</td>
								<td>#result.pagedesc#</td>
								<td>
									<button class="btn opt-btn">
										<a href="adminEdit.cfm?id=#result.pageid#">Edit</a>													</button>
									<button class="btn opt-btn delete-button" data-id="#result.pageid#">
										Delete
									</button>
								</td>
							</tr>
						</cfloop>
					</cfoutput>
				</table>
			</div>
		</section>
		<div class="delete-page" id="deletePage">
			<div class="delete-head">Delete page</div>
			<div>
				<p class="dlt-content">Are you want to delete page?</p>
			</div>
			<div class="dlt-buttons">
				<button class="cancel-btn dlt-btn close-page">Cancel</button>
				<button class="delete-btn dlt-btn" >Yes</button>
			</div>
		</div>
		<div id="overlay" class="close-page">
		</div>
		<script src="./Js/jquery-3.7.1.min.js"></script>
		<script src="script.js"></script>
	</body>
</html>
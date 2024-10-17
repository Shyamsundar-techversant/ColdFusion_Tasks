<cfset result=application.dbObj.displayData()>
<html>
	<head>
		<title>Admin Dashboard</title>
		<link href="style.css" rel="stylesheet">
	</head>
	<body>
		<h1>Welcome <cfoutput>#session.username#</cfoutput></h1>
		<section class="admin-section">
			<div class="container">
				<table border="1">
					<tr>
						<th>Pagename</th>
						<th>PageDesc</th>
					</tr>
					<cfoutput>
						<cfloop query="#result#"> 
							<tr>
 								<td>#result.pagename#</td>
								<td>#result.pagedesc#</td>
							</tr>
						</cfloop>
					</cfoutput>
				</table>
			</div>
		</section>
		<script src="./Js/jquery-3.7.1.min.js"></script>
		<script src="script.js"></script>
	</body>
</html>
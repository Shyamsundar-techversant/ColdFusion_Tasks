<cfif NOT structKeyExists(session,"username") OR NOT structKeyExists(session,"userId")>
	<cflocation url="logIn.cfm" addtoken="false">	
</cfif>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Address Book</title>
		<link href="style.css" rel="stylesheet" type="text/css">
		<link href="./css/bootstrap.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-							Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" 
		referrerpolicy="no-referrer"/>	
	</head>
	<body>
		<sectioin class="reg-page">
			<header class="header">
				<div class="container">
					<nav class="navigation">
						<div class="logo">
							<i class="fa-solid fa-address-book"></i>
							ADDRESS BOOK	
						</div>
						<div class="reg-buttons">
							<button class="btn sign-up">
								<a href="logIn.cfm?logOut=1">
									<i class="fa-solid fa-arrow-left"></i>LogOut
								</a>
							</button>
						</div>
					</nav>
				</div>			
			</header>
		</section>
		<section class="user-details">
			<div class="container">
				<div class="user-options">
					<div class="options">
						<button>A</button>
						<button>B</button>
						<button>C</button>
					</div>
				</div>
			</div>
			<div class="container">
				<cfoutput>
					<div class="users">
						<div class="create-profile">
							<div class="user-img-logo">
								<i class="fa-solid fa-user"></i>
							</div>
							<h4>#session.username#</h4>
							<button class="btn user-creation">CREATE CONTACT</button>
						</div>
						<div class="user-profiles">
			
						</div>
					</div>
				</cfoutput>
			</div>
		</section>	
		<div class="add-edit-contact">
			<div class="card">
				<div class="card-body">
			</div>
		</div>
	</body>
</html>



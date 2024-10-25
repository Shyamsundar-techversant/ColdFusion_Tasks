<cfif NOT structKeyExists(session,"username") OR NOT structKeyExists(session,"userId")>
	<cflocation url="logIn.cfm" addtoken="false">	
</cfif>
<cfif structKeyExists(form,"submit")>
	<cffile action="upload" fileField="uploadImg" destination=#application.imageSavePath# nameconflict="makeunique">

	<cfset imageAddress = application.imageSavePath & "\" & cffile.SERVERFILE>	
	<cfset addValidationResult=application.dbObj.createContact(
										form.title,
										form.firstname,
										form.lastname,
										form.gender,
										form.dob,
										imageAddress,
										form.email,
										form.phone,
										form.address,
										form.street,
										form.pincode
									)
	> 
	<cfdump var="#addValidationResult#">
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
			<div class="container">			
					<form action="" method="post" enctype="multipart/form-data">
						<div class="form-head">
							<h4>CREATE CONTACT</h4>
						</div>
						<div class="row mb-3">
							<div class="col">
								<label for="title" class="form-label">Title</label>
								<cfset titleValues=application.dbObj.getTitle()>
								<select name="title" class="form-select" id="title">
									<option value="">Select</option>
									<cfoutput>
										<cfloop query="titleValues">
											<option value="#titleValues.id#">#titleValues.titles#</option>
										</cfloop>
									</cfoutput>
								</select>
							</div>
							<div class="col">
								<label for="firstname" class="form-label">Firstname : </label>
								<input type="text" class="form-control" id="firstname" name="firstname" required>
							</div>
							<div class="col">
								<label for="lastname" class="form-label">Lastname : </label>
								<input type="text" class="form-control" id="lastname" name="lastname" required>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col">
								<label for="gender" class="form-label">Gender</label>
								<cfset genderValues=application.dbObj.getGender()>
								<select name="gender" class="form-select" id="gender">
									<option value="">Select</option>
									<cfoutput>
										<cfloop query="genderValues">
											<option value="#genderValues.id#">#genderValues.gender_values#</option>
										</cfloop>	
									</cfoutput>
								</select>
							</div>
							<div class="col">
								<label for="dob" class="form-label">Date Of Birth</label>
								<input type="date" class="form-control" id="dob" name="dob" required>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col">
								<label for="upload-img" class="form-label">Upload Photo </label>
								<input type="file" class="form-control" id="upload-img" name="uploadImg" required>
							</div>
						</div>
						<div class="form-head">
							<h4>CONTACT DETAILS</h4>
						</div>
						<div class="row mb-3">
							<div class="col">
								<label for="email" class="form-label">Email</label>
								<input type="email" class="form-control" id="email" name="email" required>
							</div>
							<div class="col">
								<label for="phone" class="form-label">Phone</label>
								<input type="number" class="form-control" id="phone" name="phone" required>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col">
								<label for="address" class="form-label">Address</label>
								<textarea class="form-control" id="address" name="address" rows="4" cols="7" required>
								</textarea>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col">
								<label for="street" class="form-label">Street</label>
								<input type="text" class="form-control" id="street" name="street" required>
							</div>
							<div class="col">
								<label for="pincode" class="form-label">Pincode</label>
								<input type="text" class="form-control" id="pincode" name="pincode" required>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="user-form-buttons">
									<button class="cancel-user-form user-btn">Cancel</button>
									<button class="add-details user-btn" type="submit" name="submit">Add Contact</button>
								</div>
							</div>
						</div>
					</form>
			</div>
		</div>
	
	</body>
</html>



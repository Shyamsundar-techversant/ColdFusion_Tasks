<cfif NOT structKeyExists(session,"username") OR NOT structKeyExists(session,"userId")>
	<cflocation url="logIn.cfm" addtoken="false">	
</cfif>
<cfif structKeyExists(form,"submit")>


	 <cfset variables.addValidationResult=application.dbObj.validateContactForm(
										form.title,
										form.firstname,
										form.lastname,
										form.gender,
										form.dob,
										form.uploadImg,
										form.email,
										form.phone,
										form.address,
										form.street,
										form.pincode
									)
	> 
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

			<!---<div class="error-container">
				<div class="error-content">
					<cfif structKeyExists(variables,"addValidationResult")>
						<cfoutput>
							<cfloop array="#variables.addValidationResult#" index="error">
								<span class="validation-error">#error#</span><br>
							</cfloop>
						</cfoutput>
					</cfif>	
				</div>
			</div>--->

			<div class="container">
				
					<div class="users">
						<div class="create-profile">
							<div class="user-img-logo">
								<i class="fa-solid fa-user"></i>
							</div>
							<cfoutput><h4>#session.username#</h4></cfoutput>
							<button type="button" class="btn btn-primary user-creation" data-bs-toggle="modal" 
								data-bs-target="#staticBackdrop">
 								 CREATECONTACT
							</button>
						</div>
						<div class="user-profiles">
							
						</div>
					</div>
				
			</div>
		</section>

		<!-- Modal -->
		<div	class="modal fade" 
			id="staticBackdrop" 
			data-bs-backdrop="static" 
			data-bs-keyboard="false" 
			tabindex="-1" 
			aria-labelledby="staticBackdropLabel" 		
			aria-hidden="true"
		>
			<div class="modal-dialog add-edit-contact">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">CREATE CONTACT</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div>
							<div class="container">			
									<form action="" method="post" enctype="multipart/form-data">
										<div class="row mb-3">
											<div class="col">
												<label for="title" class="form-label">Title</label>
												<cfset titleValues=application.dbObj.getTitle()>
												<select name="title" class="form-select" id="title">
													<option value="">Select</option>
													<cfoutput>
														<cfloop query="titleValues">
															<option value="#titleValues.id#">
																#titleValues.titles#
															</option>
														</cfloop>
													</cfoutput>
												</select>
											</div>
											<div class="col">
												<label for="firstname" class="form-label">Firstname : </label>
												<input type="text" class="form-control" id="firstname" name="firstname" 												required>
											</div>
											<div class="col">
												<label for="lastname" class="form-label">Lastname : </label>
												<input type="text" class="form-control" id="lastname" name="lastname" 												required>
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
															<option value="#genderValues.id#">
																#genderValues.gender_values#
															</option>
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
												<input type="file" class="form-control" id="upload-img" 													name="uploadImg" required>
											</div>
										</div>
										<div class="form-head">
											<h4>CONTACT DETAILS</h4>
										</div>
										<div class="row mb-3">
											<div class="col">
												<label for="email" class="form-label">Email</label>
												<input type="email" class="form-control" id="email" name="email" 												required>
											</div>
											<div class="col">
												<label for="phone" class="form-label">Phone</label>
												<input type="tel" class="form-control" id="phone" name="phone" required 												maxlength="10">
											</div>
										</div>
										<div class="row mb-3">
											<div class="col">
												<label for="address" class="form-label">Address</label>
												<textarea class="form-control" id="address" name="address" rows="4" 												cols="7" required>
												</textarea>
											</div>
										</div>
										<div class="row mb-3">
											<div class="col">
												<label for="street" class="form-label">Street</label>
												<input type="text" class="form-control" id="street" name="street" 												required>
											</div>
											<div class="col">
												<label for="pincode" class="form-label">Pincode</label>
												<input type="text" class="form-control" id="pincode" name="pincode" 												required>
											</div>
										</div>
										<div class="row">
											<div class="col">
												<div class="user-form-buttons">
													<button class="cancel-user-form user-btn" 
													data-bs-dismiss="modal" >
														Cancel
													</button>
													<button class="add-details user-btn" type="submit" 														name="submit">
														Add Contact
													</button>
												</div>
											</div>
										</div>
									</form>
							</div>
						</div>						

					</div>
				</div>
			</div>
		</div>

		<script src="./js/bootstrap.bundle.min.js"></script>
	</body>
</html>



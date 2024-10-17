<cfset result =createObject("component","Components.task23").getPositions()>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Task 23</title>
		<link href="style.css" rel="stylesheet">
	</head>

	<body>
		<!--- Form Section --->
		<section class="form-section">
			<div class="container">
				<form class="user-details" action="" method="post" enctype="multipart/form-data">
					<div class="form-header">
						<span class="logo">WUFOO</span>
						<span class="sponsor">by SurveyMonkey</span>
					</div>
					<div class="form-body">
						<div class="form-body-head">
							<span class="emp-application">Employment Application</span>
							<span class="incorporation">Infinity Box Inc.</span>
						</div>
						<ul class="job-details">
							<li>
								<label for="position" class="form-label emp-label">Which position you are looking for
									?</label>
								<select name="position" id="position" class="data-field"
									onchange="return validatePosition()">
									<option value="" selected></option>
									<cfoutput>
										<cfloop query="result">
											<option value="#result.id#">#result.position#</option>		
										</cfloop>
									</cfoutput>
								</select>
								<div class="required-data" id="position-error"></div>
							</li>
							<li>
								<label class="form-label emp-label">Are you willing to relocate ?</label>
								<div class="relocation">
									<input type="radio" id="yes-relocate" name="relocate" value="Yes"
										onclick="return validateRelocation()">
									<label for="Yes">Yes</label>
								</div>
								<div class="relocation">
									<input type="radio" id="no-relocate" name="relocate" value="No"
										onclick="return validateRelocation()">
									<label for="No">No</label>
								</div>
								<div class="required-data" id="relocate-error"></div>
							</li>
							<li>
								<label for="join-date" class="form-label emp-label">When can you start ?</label>
								<input type="date" id="join-date" name="joinDate" class="data-field"
									onchange="return validateJoinDate()">
								<div class="required-data" id="join-date-error"></div>
							</li>
							<li>
								<label for="portfolio" class="form-label">Personal Website</label>
								<input type="text" id="portfolio" name="portfolio" class="data-field"
									onkeyup="return validatePortfolio()">
								<div class="required-data" id="portfolio-error"></div>
							</li>
							<li>
								<label for="resume" class="form-label">Attach a copy of your resume</label>
								<input type="file" id="resume" name="resume" onchange="return validateResume()">
								<div class="required-data" id="resume-error">
							</li>
							<li>
								<label for="salary" class="form-label">Salary requirments</label>
								<span><span id="dollar">$</span><input type="text" id="salary" name="salary"
										class="data-field" onkeyup="return validateSalary()"></span>
								<div class="required-data" id="salary-error"></div>
							</li>
						</ul>
						<h6 class="contact-info-head">Your Contact Information</h6>
						<ul class="personal-details">
							<li>
								<label for="name" class="form-label emp-label">Name</label>
								<div class="name-details">
									<div>
										<label for="firstname" class="form-label">First :</label>
										<input type="text" id="firstname" name="firstName" class="data-field"
											onkeyup="return validateFirstName()">
										<div class="required-data" id="firstname-error"></div>
									</div>
									<div>
										<label for="lastname" class="form-label">Last :</label>
										<input type="text" id="lastname" name="lastName" class="data-field"
											onkeyup="return validateLname()">
										<div class="required-data" id="lastname-error"></div>
									</div>
								</div>
							</li>
							<li>
								<label for="email" class="form-label emp-label">Email Address</label>
								<input type="email" id="email" name="empEmail" class="data-field"
									onkeyup="return validateEmail()">
								<div class="required-data" id="email-error"></div>
							</li>
							<li>
								<label for="mob" class="form-label emp-label">Phone</label>
								<input type="tel" id="mob" class="data-field" name="phone" onkeyup="return validatePhone()">
								<div class="required-data" id="phone-error"></div>
							</li>
							<li>
								<input type="submit" value="Submit" class="submit" onclick="validateForm(event)">
								<div class="required-data" id="submit-error"></div>
							</li>
						</ul>
						<div class="terms">
							<p>This site is protected by reCAPTCHA Enterprise and the Google
								<a href="#">Privacy Policy</a>and <a href="#">Terms of Service</a> apply.
							</p>
						</div>
					</div>
				</form>
			</div>
		</section>
		<cfif structKeyExists(form, "position" ) AND structKeyExists(form, "relocate" ) AND structKeyExists(form, "joinDate" )
			AND structKeyExists(form, "portfolio" ) AND structKeyExists(form, "resume" ) AND structKeyExists(form, "salary" )
			AND structKeyExists(form, "firstName" ) AND structKeyExists(form, "lastName" ) AND structKeyExists(form,"empEmail") 
    			AND structKeyExists(form, "phone" )>

			<cffile action="upload" filefield="resume" destination="#application.resumeFilePath#" nameconflict="makeunique">
			<cfset resumePath="#application.resumeFilePath#\#cffile.SERVERFILE#">
			<cfset formData={
        			position = form.position,
				relocate = form.relocate,
        			joinDate = form.joinDate,
				portfolio = form.portfolio,
				resumePath,
				salary = form.salary,
				firstName = form.firstName,
				lastName = form.lastName,
				empEmail = form.empEmail,
				phone =form.phone
			}>

			<cfset result = createObject("component","Components.task23").saveData(formData)>
			<cfdump  var="#result#">
		<cfelse>
			<cfoutput>
				<p>Formdata missing....</p>
			</cfoutput>
		</cfif>

		<script src="script.js"></script>
	</body>
</html>

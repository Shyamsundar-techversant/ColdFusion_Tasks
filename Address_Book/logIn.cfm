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
						</div>
						<div class="reg-buttons">
							<button class="btn sign-up" onclick="signUpForm()"><i class="fa-solid fa-user"></i>SignUp</button>
							<button class="btn log-in" onclick="logInForm()"><i class="fa-solid fa-right-to-bracket"></i>LogIn</button>		
						</div>
					</nav>
				</div>			
			</header>
			<section class="form-section">
				<div class="container">
					<div class="user-registration">
						<div class="card">
							<div class="contact-form">
								<div class="contact-logo">
									<div class="contact-icon"><i class="fa-solid fa-address-book"></i></div>
								</div>
								<div class="reg-form pb-3">
									<form name="registration-form" action="" method="post" class="login-form">
										<div class="form-head">
											<h2 id="formHead">LogIn</h2>
										</div>
										<div class="user-inputs mb-3">
											<input type="text" id="username" name="username" placeholder="Username" 
											class="form-control">							
										</div>
										<div class="user-inputs mb-3">
											<input type="password" id="password" name="password"
											 placeholder="Password" class="form-control">				
										</div>
										<div class="user-inputs ">
											<button type="submit" class="sign" id="logIn">LogIn</button>		
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</section>
		<script src="./js/bootstrap.bundle.min.js"></script>
		<script src="script.js"></script>	
	</body>
</html>
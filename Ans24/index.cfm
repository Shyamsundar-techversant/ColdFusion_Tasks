<!DOCTYPE html>
<html lang="en">
	<head>
    		<meta charset="UTF-8">
    		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    		<title>Subscribe Form</title>
    		<script src="./js/jquery.js"></script>
    		<script src="./js/script.js"></script> 
	</head>
	<body>
    		<div class="container">
        		<h2>CF TASK 24</h2>
        		<form id="subscribeForm" method="post" action="processSubscription.cfm" enctype="multipart/form-data">
            			<label for="firstName">First Name:</label>
            			<input type="text" id="firstName" name="firstName" required><br><br>

            			<label for="email">Email:</label>
            			<input type="email" id="email" name="email" required>

            			<button type="button" id="checkEmailBtn">Check Email</button><br><br>

            			<button type="submit" id="submitBtn" disabled>Submit</button>

        		</form>
    		</div>
	</body>
</html>

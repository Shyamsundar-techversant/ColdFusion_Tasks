<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>TASK 14</title>
	</head>
	<body>
		<h2>TASK 14</h2>
		<form name="img-form" action="uploadHandler.cfm" method="post">
			<label for="img-name">Enter Image name</label>
			<input type="text" id="img-name" name="imageName"><br><br>
			<label for="description">Description</label>
			<textarea id="description" row="5" cols="20" name="description"></textarea><br><br>
			<label for="img">Upload Image : </label>
			<input type="file" name="imageFile" accept=".jpg,.png,.jpeg,.gif" id="img" required>
			<div id="imgError"></div><br>
			<input type = "submit" value="Upload">	
		</form>

	</body>
</html>
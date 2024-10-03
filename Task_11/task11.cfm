<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width , initial-scale=1.0">
		<title>Task 11</title>
	</head>
	<body>
		<cfset multiplyObj=createObject("component","Components.task11")>
		<cfset res1=multiplyObj.multiply(1,2)>
		<cfdump var=#res1# label="Result of multiply(1,2)"><br>
		<cfset res2=multiplyObj.multiply(1,2,3)>
		<cfdump var=#res2# label="Result of multiply(1,2,3)"><br>
		<cfset res3=multiplyObj.multiply(1,2,3,4)>
		<cfdump var=#res3# label="Result of multiply(1,2,3,4)"><br>
	</body>
</html>
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
		<cfset res2=multiplyObj.multiply(1,2,3)>
		<cfset res3=multiplyObj.multiply(1,2,3,4)>
		<cfoutput>
			1.#res1# <br>
			2.#res2# <br>
			3.#res3#
		</cfoutput>

	</body>
</html>
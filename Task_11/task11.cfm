<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width , initial-scale=1.0">
		<title>Task 11</title>
	</head>
	<body>
		<cfscript>
			function multiply(){
				var result = 1;
				for(i=1;i<=ArrayLen(arguments);i++){
					result=result*arguments[i];
				}	
				return result;
			}
		</cfscript>
		<cfset res1=multiply(1,2)>
		<cfdump var=#res1# label="Result of multiply(1,2)"><br>
		<cfset res2=multiply(1,2,3)>
		<cfdump var=#res2# label="Result of multiply(1,2,3)"><br>
		<cfset res3=multiply(1,2,3,4)>
		<cfdump var=#res3# label="Result of multiply(1,2,3,4)"><br>
	</body>
</html>
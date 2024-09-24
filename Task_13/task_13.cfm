<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="widht=device-width, initial-scale=1.0">
		<title>TASK 13</title>
	</head>
	<body>
		<h1>TASK 13</h1>
		<form name="data-form" action="" method="post">
			<label for="value">Enter the value : </label>
			<input type="text" id="value" name="value"> 
			<input type="submit" value="Search">
		</form>

		<cfparam name="form.value" default="">
		<cfset text= "the quick brown fox jumps over the lazy dog">
		<cfif Len(Trim(form.value))>
		<!---Change Text to Case Insensitive--->
			<cfset text=LCase(text)>
			<cfset textToCheck=LCase(form.value)>
			
			<!---Count Occurence of the Search word--->
			<cfset textOccurCount=(Len(text)-Len(REReplace(text,textToCheck,"","ALL")))/Len(textToCheck)>
			<cfif textOccurCount GT 0>
				<cfoutput><p>Found the keyword #textOccurCount# times</cfoutput>
			<cfelse>
				<cfoutput><p>Invalid Input</p></cfoutput>
			</cfif>				
		</cfif>				
	</body>
</html>
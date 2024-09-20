<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8>
		<meta name="viewport" content="width=device-width initial-scale=1.0">
		<title>Task 10</title>
	</head>
	<body>
		<h1>Task 10</h1>
		<form name="struct-form" action="" method="post">
			<label for="value1">Enter value 1 : </label>
			<input type="text" id="value1" name="value1"><br><br>
			<label for="value2">Enter value 2 : </label>
			<input type="text" id="value2" name="value2"><br><br>
			<input type ="submit" value="Submit">
		</form>
		<cfapplication  name="Form" sessionManagement="true" sessionTimeout="#createTimeSpan(0,0,2,0)#">
		<cfif structKeyExists(FORM,"value1") AND structKeyExists(FORM,"value2")>
			<cfif NOT structKeyExists(session,"formData")>
				<cfset session.formData=structNew()>
			</cfif>
			<cfset session.formData[FORM.value1]=FORM.value2>
			<cfset arrayToSort=arrayNew(1)>
			<cfset structKeyArray=structKeyList(session.formData)>
			<cfset arrayToSort=listToArray(structKeyArray)>

			<!---Sort the array --->
			<cfset arraySort(arrayToSort,"text",'asc')>
			<cfloop index="i" from="1" to="#arrayLen(arrayToSort)#">
				<cfoutput><div>#arrayToSort[i]#:#session.formData[arrayToSort[i]]#</div></cfoutput>
			</cfloop>
		</cfif>

	</body>
</html>
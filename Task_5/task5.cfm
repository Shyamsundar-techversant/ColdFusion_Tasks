<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Task 5</title>
</head>
	<body>
		<h1>Task 5</h1>
		<form name="age-form" action="task5.cfm" method="post" >
			<label for="user-dob">Enter your DOB</label>
			<input type="date" id="user-dob" name="userBirth"><br><br>
			<label for="mother-dob">Enter Mother's DOB</label>
			<input type="date" id="mother-dob" name="motherBirth"><br><br>
			<input type="submit" value="Calculate">
		</form>

		<h2>Output</h2>

			
		<cfif structKeyExists(FORM,"userBirth") AND structKeyExists(FORM,"motherBirth")>
			<cfset userBirth=parseDateTime(FORM.userBirth)>
			<cfset motherBirth=parseDateTime(FORM.motherBirth)>
			<cfset currentDate=Now()>
			<cfif DateCompare(userBirth,currentDate) LT 0 AND DateCompare(motherBirth,currentDate) LT 0>
				<cfif DateCompare(userBirth,motherBirth) LT 0>
					<cfoutput>Mother's Dob must be earlier than User's Age.</cfoutput>
				<cfelse>
					<cfset userAge=DateDiff("yyyy",userBirth,currentDate)>
					<cfoutput><p>Your Age:#userAge# </p></cfoutput>
					<cfset deliveryAge=DateDiff("yyyy",motherBirth,userBirth)>
					<cfoutput><p> Your mother was #deliveryAge# when your delivery</p></cfoutput>
		
					<!---Get Remaining dates for birthday--->
					<cfset userNextBirthDate=createDate(year(currentDate),Month(userBirth),Day(userBirth))>
					<cfset motherNextBirthDate=createDate(year(currentDate),Month(motherBirth),Day(motherBirth))>
					<cfif DateCompare(userNextBirthDate,currentDate) LT 0>
						<cfset userNextBirthDate=DateAdd("yyyy",1,userNextBirthDate)>	
					</cfif>	
					<cfif DateCompare(motherNextBirthDate,currentDate) LT 0>
						<cfset motherNextBirthDate=DateAdd("yyyy",1,motherNextBirthDate)>
					</cfif>	
					<cfset daysRemainUser=DateDiff("d",currentDate,userNextBirthDate)>
					<cfset daysRemainMotherBirth=DateDiff("d",currentDate,motherNextBirthDate)>
						<cfoutput>
							<p>Days Remaining for your birthday : #daysRemainUser#</p>
							<p>Days Remaining for your mother's birthday: #daysRemainMotherBirth#</p>
						</cfoutput>		
				</cfif>			
			<cfelse>
				<cfoutput>Please Enter Valid DOB </cfoutput>
			</cfif>
		</cfif>
	</body>
</html>
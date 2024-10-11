<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Task 21</title>
	</head>
	<h1>Task 21</h1>
	<form name="greeting-form" action="" method="post" enctype="multipart/form-data">
		<label for="baby-name">Enter Birthday Babay's Name : </label>
		<input type="text" id="baby-name" name="babyName"><br><br>
		<label for="email-id">Enter Email ID : </label>
		<input type="email" id="email-id" name="emailId"><br><br>
		<label for="wish">Birthday Wishes:</label><br>
		<textarea id="wish" name="bdayWish" rows="5" cols="18"></textarea><br><br>
		<label for="greetingImage">Upload Greeting Image : </label>
		<input type="file" id="greetingImage" name="greetImg"><br><br>
		<input type="submit" value="Submit">
	</form>
	<cfif structKeyExists(form,"babyName") AND structKeyExists(form,"emailId") AND structKeyExists(form,"bdayWish") AND structKeyExists(form,"greetImg")>
		<cffile action="upload" filefield="greetImg" destination="#application.imageSavePath#" nameconflict="makeunique">
		<cfset imageFile="#application.imageSavePath#\#cffile.SERVERFILE#">
		<cfset babyName=form.babyName>
		<cfset emailId=form.emailId>
		<cfset bdayWish=form.bdayWish>
		<cfset mailObj=createObject("component","Components.birthday")>
		<cfset result=mailObj.sendMail("#babyName#","#emailId#","#bdayWish#","#imageFile#")>
		<cfoutput>#result#</cfoutput>
	</cfif>
</html>
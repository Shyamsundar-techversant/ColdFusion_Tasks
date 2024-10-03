<cftry>
	<cfif structKeyExists(form,"babyName") AND structKeyExists(form,"emailId") AND structKeyExists(form,"bdayWish") AND structKeyExists(form,"greetImg")>
		<!--- Save Image to Server --->
		<cffile action="upload" filefield="greetImg" destination="C:\ColdFusion2021\cfusion\wwwroot\CF_Tasks\Task_21\Images" nameconflict="makeunique">
		<!--- Get the Saved Path--->
		<cfset uploadedFilePath="C:\ColdFusion2021\cfusion\wwwroot\CF_Tasks\Task_21\Images\#cffile.SERVERFILE#">
		<!---Send Email--->
		<cfmail to="#form.emailId#"
		from="shyamsms466340@gmail.com"
		subject="Happy Birthday #form.babyName#"
		type="html">
			<p>Dear #form.babyName#</p>,
			<p>#form.bdayWish#</p>
			<p>With Love</p>
			<p>Shyam</p>
			<cfmailparam file="#uploadedFilePath#" disposition="attachment" text="session.captchaText">
		</cfmail>
		<cfoutput>Email Send Successfully</cfoutput>
	</cfif>
<cfcatch>
	<cfoutput>#cfcatch.message#</cfoutput>
</cfcatch>
</cftry>
<cfcomponent>
	<cffunction name="sendMail" type="string" returntype="string">
		<cfargument name="babyName" type="string" required="true">
		<cfargument name="emailId" type="string" required="true">
		<cfargument name="bdayWish" type="string" required="true">
		<cfargument name="imageFile" type="string" required="true">
		<cftry>
			<!--- Send Mail--->
			<cfmail 
				to="#arguments.emailId#"
				from="shyamsms466340@gmail.com"
				subject="Happy Birthday : #arguments.babyName#"
				type="html">
				<p>Dear #arguments.babyName#</p>
				<p>#arguments.bdayWish#</p>
				<p>With Love</p>
				<p>Shyam</p>
				<cfmailparam file="#imageFile#" disposition="attachment">
			</cfmail>
			<cfset local.result="Email Sent Successfully">
			<cfreturn local.result>	
		<cfcatch>
			<cfset local.result="#cfcatch.message#">
			<cfreturn false>
		</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>
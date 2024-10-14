<cfif structKeyExists(form, "firstName") AND structKeyExists(form, "email")>
	
	<cfset subscriberService = createObject("component", "checkEmail")>

    	<cfset subscriberService.addSubscriber(trim(form.firstName), trim(form.email))>

    
    	<cfoutput>
        	<h2>Subscription successful! Thank you, #form.firstName#</h2>
    	</cfoutput>

<cfelse>
        <cfoutput>
        	<p>Error: Missing data. Please complete the form</p>
    	</cfoutput>
</cfif>







	   

    

<cfif structKeyExists(form, "position" ) AND structKeyExists(form, "relocate" ) AND structKeyExists(form, "joinDate" )
	AND structKeyExists(form, "portfolio" ) AND structKeyExists(form, "resume" ) AND structKeyExists(form, "salary" )
	AND structKeyExists(form, "firstName" ) AND structKeyExists(form, "lastName" ) AND structKeyExists(form,"empEmail") 
    	AND structKeyExists(form, "phone" )>

<cffile action="upload" filefield="resume" destination="#application.resumeFilePath#" nameconflict="makeunique">
<cfset resumePath="#application.resumeFilePath#\#cffile.SERVERFILE#">
<cfset formData={
        position = form.position,
        relocate = form.relocate,
        joinDate = form.joinDate,
        portfolio = form.portfolio,
	resumePath,
        salary = form.salary,
        firstName = form.firstName,
        lastName = form.lastName,
        empEmail = form.empEmail,
        phone =form.phone
}>

<cfset result = createObject("component","Components.task23").saveData(formData)>
<cfdump  var="#result#">

<cfelse>
	<cfoutput>
		<p>Formdata missing....</p>
	</cfoutput>
</cfif>
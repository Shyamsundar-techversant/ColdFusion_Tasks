<h2>Result:</h2>
<cfset sizeObj=createObject("component","Components.task_25")>
<cfset result=sizeObj.wordCounts()>
<cfif result.countWords.recordCount GT 0>
	<cfloop query="result.countWords">
		<cfset fontSize = "#wordCount*10#px">
		<cfset randomColor ="##" & LCASE(FormatBaseN(randRange(0, 16777215), 16))>
		<span style="font-size:<cfoutput>#fontSize#</cfoutput>; color:<cfoutput>#randomColor#</cfoutput>"><cfoutput>#words# : #wordCount#</cfoutput>
		</span><br><br>
	</cfloop>	
<cfelse>
	<cfoutput>No Valid data in the database.</cfoutput>
</cfif>

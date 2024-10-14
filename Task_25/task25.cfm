<h2>Result:</h2>
<cfset wordObj=createObject("component","Components.task_25")>
<cfset result=wordObj.wordCounts()>
<cfif result.countWords.recordCount GT 0>
	<table border="1">
        	<tr>
			<th>Word</th>
			<th>Count</th>
		</tr>
        <cfloop query="result.countWords">
            <tr>
                <td><cfoutput>#words#</cfoutput></td>
                <td><cfoutput>#wordCount#</cfoutput></td>
            </tr>
        </cfloop>
    </table>
<cfelse>
	<cfoutput>No Valid data in the database.</cfoutput>
</cfif>
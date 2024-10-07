<cfquery datasource="coldfusion" name="wordCounts">
	SELECT words,COUNT(words) AS wordCount
	FROM docData
	WHERE LENGTH(words) >=3 AND 
	words NOT LIKE '%[0-9]%'
	GROUP BY words
	ORDER BY 
	wordCount DESC,
	LENGTH(words) DESC,
	words ASC; 
</cfquery>
<h2>Result:</h2>
<cfif wordCounts.recordCount GT 0>
	<table border="1">
        	<tr>
			<th>Word</th>
			<th>Count</th>
		</tr>
        <cfloop query="wordCounts">
            <tr>
                <td><cfoutput>#words#</cfoutput></td>
                <td><cfoutput>#wordCount#</cfoutput></td>
            </tr>
        </cfloop>
    </table>
<cfelse>
	<cfoutput>No Valid data in the database.</cfoutput>
</cfif>
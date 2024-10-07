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
	<cfloop query="wordCounts">
		<cfset fontSize = "#wordCounts.wordCount*10#px">
		<cfset randomColor ="##" & LCASE(FormatBaseN(randRange(0, 16777215), 16))>
		<span style="font-size:<cfoutput>#fontSize#</cfoutput>; color:<cfoutput>#randomColor#</cfoutput>"><cfoutput>#words# : #wordCount#</cfoutput>
		</span><br><br>
	</cfloop>	
<cfelse>
	<cfoutput>No Valid data in the database.</cfoutput>
</cfif>

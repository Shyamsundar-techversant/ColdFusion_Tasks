<cfcomponent>
	<!--- Add Words To DB --->
	<cffunction name="addWordsToDb" access="public" returntype="boolean">
		<cfargument name="words" type="array" required="true">
		<cftry>
			<cfloop array="#words#" index="word">
				<cfif len(word) GT 0>
					<cfquery datasource="coldfusion">
						INSERT INTO
						 	wordData(words)
						VALUES(
							<cfqueryparam value="#word#" cfsqltype="cf_sql_varchar">
						)
					</cfquery>		
				</cfif>
			</cfloop>
			<cfreturn true>
		<cfcatch>
			<cfreturn false>
		</cfcatch>
		</cftry>
	</cffunction>

	<!--- Count Words --->
	<cffunction name="wordCounts" access="public" returntype="struct">
		<cfset local.result=structNew()>
		<cftry>
			<cfquery datasource="coldfusion" name="local.countWords">
				SELECT 
					words,
					COUNT(words) AS wordCount
				FROM 
					wordData
				WHERE 
					LENGTH(words) >=3 
				AND 
					words NOT LIKE '%[0-9]%'
				GROUP BY 
					words
				ORDER BY 
					wordCount DESC,
					LENGTH(words) DESC,
					words ASC; 
			</cfquery>
			<cfset local.result.countWords=local.countWords>
			<cfreturn local.result>
		<cfcatch>
			<cfoutput>#cfcatch.message#</cfoutput>
		</cfcatch>
		</cftry>	
	</cffunction>
</cfcomponent>



<cfcomponent>
    <!---  User Registration    --->
	<cffunction  name="registerUser" access="public" returntype="boolean">
        	<cfargument name="username" type="string" required="true">
		<cfargument name="email" type="string" required="true">
		<cfargument name="password" type="string" required="true">
		<cfargument name="role" type="string" required="true">
		<cfset local.hashedPassword=hash(#arguments.password#,"SHA-512")>
		<cftry>
			<cfquery name="local.checkEmail" datasource="coldfusion">
				SELECT 
					email
				FROM 
					users
				WHERE
					email=<cfqueryparam value="#arguments.email#">
			</cfquery>
			<cfif local.checkEmail.recordCount GT 0>
				<cfoutput>
					<p>Email Id already Exists</p>
				</cfoutput>
				<cfreturn false>
			<cfelse>
				<cfquery name="local.regUser" datasource="coldfusion">
					INSERT INTO 
						users(username,
						email,
						password,
						role
					)
					VALUES(
						<cfqueryparam value="#arguments.username#"  cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#arguments.role#" cfsqltype="cf_sql_varchar">
 					)                  
				</cfquery>
				<cfset session.isLoggedIn=true>
				<cfset session.username=arguments.username>
				<cfset session.role=arguments.role>
				<cfif session.role EQ "admin" OR session.role EQ "editor">
					<cflocation url="./adminIndex.cfm" addtoken="false">
				<cfelse>
					<cflocation url="./userIndex.cfm" addtoken="false">
				</cfif>
				<cfreturn true>
			</cfif>
		<cfcatch>
			<cfoutput>#cfcatch.message#</cfoutput>
			<cfreturn false>
		</cfcatch>
		</cftry>
    </cffunction>

    <!---   User LogIn   --->

	<cffunction  name="userLogIn" access="public" returntype="boolean">
		<cfargument name="email" type="string" required="true">
		<cfargument name="password" type="string" required="true">
		<cfset local.hashedPassword=hash(#arguments.password#,"SHA-512")>
		<cftry>
			<cfquery name="local.logUser" datasource="coldfusion">
				SELECT 
					username,
					email,
					password,
					role
				FROM 
					users
				WHERE
					email=<cfqueryparam value="#arguments.email#">
				AND
					password=<cfqueryparam value="#local.hashedPassword#">
			</cfquery>
        		<cfif local.logUser.recordCount EQ 1>
            			<cfset session.isLoggedIn=true>
            			<cfset session.username=local.logUser.username>
             			<cfset session.role=local.logUser.role>
				<cfif local.logUser.role EQ "admin" OR local.logUser.role EQ "editor">
					<cflocation url="./adminIndex.cfm" addtoken="false">
				<cfelse>
					<cflocation url="./userIndex.cfm" addtoken="false">
				</cfif>           
				<cfreturn true>
			<cfelse>
				<cfoutput><p>Invalid email id or password</p></cfoutput>
				<cfreturn false>
			</cfif>
		<cfcatch>
			<cfoutput>#cfcatch.message#</cfoutput>
			<cfreturn false>	
		</cfcatch>
		</cftry>
	</cffunction>

	<!---  Fetch All Data from the page Table  --->  
	<cffunction  name="displayData" access="public" returntype="query">
		<cftry>
			<cfquery name="local.dispData" datasource="coldfusion">
				SELECT 
					pageid,
					pagename,
					pagedesc
				FROM 
					pages               
			</cfquery>
			<cfif local.dispData.recordCount GT 0>
				<cfreturn local.dispData>
			<cfelse>
				<cfoutput><p>No data added yet.</p></cfoutput>
			</cfif>
		<cfcatch>
			<cfoutput>#cfcatch.message#</cfoutput>
		</cfcatch>
		</cftry>
	</cffunction>

	<!--- Add Page--->
	<cffunction name="addPage" access="public" returntype="void">
		<cfargument name="pagename" type="string" required="true">
		<cfargument name="pagedesc" type="string" required="true">
		<cftry>
			<cfquery name="local.pageAdd" datasource="coldfusion">
				INSERT INTO 
					pages(
						pagename,
						pagedesc
					)
				VALUES(
					<cfqueryparam value="#arguments.pagename#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.pagedesc#" cfsqltype="cf_sql_varchar">
				)									
			</cfquery>
			<cflocation url="./adminIndex.cfm" addtoken="false">
		<cfcatch>
			<cfoutput>#cfcatch.message#</cfoutput>
		</cfcatch>
		</cftry>
	</cffunction>

	<!--- Edit Pages--->
	<cffunction name="editPage" access="public" returntype="void">
		<cfargument name="pageid" type="integer" required="true">
		<cfargument name="pagename" type="string" required="true">
		<cfargument name="pagedesc" type="string" required="true">
		<cftry>
		<cfquery name="local.pageEdit" datasource="coldfusion">
			UPDATE 
				pages
			SET 
				pagename=<cfqueryparam value="#arguments.pagename#" cfsqltype="cf_sql_varchar">,
				pagedesc=<cfqueryparam value="#arguments.pagedesc#" cfsqltype="cf_sql_varchar">
			WHERE	
				pageid=<cfqueryparam value="#arguments.pageid#" cfsqltype="cf_sql_integer">
		</cfquery>
		<cflocation url="adminIndex.cfm" addtoken="false">	
		<cfcatch>
			<cfoutput>#cfcatch.message#</cfoutput>
		</cfcatch>
		</cftry>	
	</cffunction>

	<!--- Get Page --->
	<cffunction name="getPage" access="public" returntype="query">
		<cfargument name="pageid" type="integer" required="true">
		<cftry>
			<cfquery name="local.getPageData" datasource="coldfusion">
				SELECT 
					pageid,
					pagename,
					pagedesc
				FROM 
					pages
				WHERE 
					pageid=<cfqueryparam value="#arguments.pageid#" cfsqltype="cf_sql_integer">
			</cfquery>
			<cfreturn local.getPageData> 
		<cfcatch>
			<cfoutput>#cfcatch.message#</cfoutput>
		</cfcatch>
		</cftry>
	</cffunction>

	<!--- Delete Page--->
	<cffunction name="deletePage" access="remote" returnformat="JSON">
		<cfargument name="pageid" type="integer" required="true">
		<cfset local.result="">
		<cftry>
			<cfquery datasource="coldfusion" result="delResult">
				DELETE	FROM 
					pages
				WHERE
					pageid=<cfqueryparam value="#arguments.pageid#" cfsqltype="cf_sql_integer">			
			</cfquery>
			<cfif delResult.recordCount GT 0>
				<cfset local.result="Success">			
			<cfelse>
				<cfset local.result="Failed">
			</cfif>
			<cfreturn local.result>
		<cfcatch>
			<cfoutput>#cfcath.message#</cfoutput>
		</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>





<cfcomponent>
	<!--- FORM VALIDATION --->
	<cffunction name="validateForm" access="public" returntype="array">
		<cfargument name="fullName" type="string" required="true">
		<cfargument name="userEmail" type="string" required="true">
		<cfargument name="username" type="string" required="true">
		<cfargument name="password" type="string" required="true">
		<cfargument name="passwordConf" type="string" required="true">
		<cfset local.errors=[]>
		<!--- Validate firstname --->
		<cfif len(trim(arguments.fullName)) EQ 0>
			<cfset arrayAppend(local.errors,"*Fullname is required")>
		<cfelseif NOT reFindNoCase("^[A-Za-z]+(\s[A-Za-z]+)?$",arguments.fullName)>
			<cfset arrayAppend(local.errors,"*Enter a valid fullname")>
		</cfif>	
			
		<!--- Validate Email--->
		<cfif len(trim(arguments.userEmail)) EQ 0>
			<cfset arrayAppend(local.errors,"*Email is required")>
		<cfelseif NOT reFindNoCase("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",arguments.userEmail)>
			<cfset arrayAppend(local.errors,"*Enter a valid email")>
		</cfif>
			
		<!--- Validate Username--->
		<cfif len(trim(arguments.username)) EQ 0>
			<cfset arrayAppend(local.errors,"*Please enter the username")>
		<cfelseif NOT reFindNoCase("^[a-zA-Z_][a-zA-Z0-9_]{4,14}$",arguments.username)>
			<cfset arrayAppend(local.errors,"*Please enter a valid username")>
		</cfif>
			
		<!--- Validate Password --->
		<cfif len(trim(arguments.password)) EQ 0>
			<cfset arrayAppend(local.errors,"*Please enter the password")>
		<cfelseif NOT reFindNoCase("^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",arguments.password)>
			<cfset arrayAppend(local.errors,"*Please enter a valid password")>
		</cfif>
			
		<!---Confirm Password Validation --->
		<cfif len(trim(arguments.passwordConf)) EQ 0>
			<cfset arrayAppend(local.errors,"*Password confirmation required")>
		<cfelseif arguments.passwordConf NEQ arguments.password>
			<cfset arrayAppend(local.errors,"*Password confirmation failed")>
		</cfif>
		<cfreturn local.errors>
	</cffunction>

	<!--- Register User--->
	<cffunction name="registerUser" access="public" returntype="string">
		<cfargument name="fullName" type="string" required="true">
		<cfargument name="emailId" type="string" required="true">
		<cfargument name="userName" type="string" required="true">
		<cfargument name="password" type="string" required="true">
		<cfset local.hashedPassword=hash(#arguments.password#,"SHA-512")>
		<cfset local.result="">
		<cftry>
			<cfquery name="local.registerUser" datasource="coldfusion">
				SELECT 	
					email,userName
				FROM 
					registeredUsers
				WHERE 
					email=<cfqueryparam value="#arguments.emailId#" cfsqltype="cf_sql_varchar">
				AND	
					userName = <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">

			</cfquery>
			<cfif local.registerUser.recordCount GT 0>
				<cfset local.result="User Already Exist">
			<cfelse>
				<cfquery name="local.insertUser" datasource="coldfusion">
					INSERT INTO
							registeredUsers(
										fullName,
										email,
										userName,	
										password
									)
					VALUES(
							<cfqueryparam value="#arguments.fullName#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#arguments.emailId#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">
						)
				</cfquery>
				<cflocation url="logIn.cfm" addtoken="false">
			</cfif>
			<cfreturn local.result>
		<cfcatch>
			<cfdump var="#cfcatch#">
			<cfreturn local.result>
		</cfcatch>
		</cftry>
	</cffunction>

	<!-- LOGIN FORM --->
	<cffunction name="logUser" access="public" returntype="string">
		<cfargument name="userName" type="string" required="true">
		<cfargument name="password" type="string" required="true">
		<cfset local.hashedPassword=hash(#arguments.password#,"SHA-512")>
		<cfset local.result="">
		<cftry>
			<cfquery name="local.userLog" datasource="coldfusion">
				SELECT 
					userName,
					userId
				FROM 
					registeredUsers
				WHERE 
					userName=<cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">
				AND
					password=<cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">
								
			</cfquery>
			<cfif local.userLog.recordCount EQ 1>
				<cfset result="LogIn successful">
				<cfset session.username=arguments.username>
				<cfset session.userId=local.userLog.userId>
				<cflocation url="home.cfm" addtoken="false">
			</cfif>
			<cfreturn local.result>
		<cfcatch>
			<cfdump var="#cfcatch#">
			<cfset local.result="#cfcatch.message#">
			<cfreturn local.result>
		</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>



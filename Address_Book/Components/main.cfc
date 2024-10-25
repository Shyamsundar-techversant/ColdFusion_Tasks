<cfcomponent>
	<!--- FORM VALIDATION --->
	<cffunction name="validateForm" access="public" returntype="array">
		<cfargument name="fullName" type="string" required="true">
		<cfargument name="userEmail" type="string" required="true">
		<cfargument name="username" type="string" required="true">
		<cfargument name="password" type="string" required="true">
		<cfargument name="passwordConf" type="string" required="true">
		<cfset local.errors=[]>
		<!--- Validate fullname --->
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

	<!--- GET TITLE--->
	<cffunction name="getTitle" access="public" returntype="query">
		<cftry>
			<cfquery name="local.titleValue" datasource="coldfusion">
				SELECT 
					id,
					titles
				FROM 	
					title
			</cfquery>
			<cfif local.titleValue.recordCount EQ 3>
				<cfreturn local.titleValue>
			</cfif>
		<cfcatch>
			<cfset local.result="#cfcatch.message#">
			<cfreturn local.result>
		</cfcatch>
		</cftry>	
	</cffunction>

	<!--- GET GENDER --->
	<cffunction name="getGender" access="public" returntype="query">
		<cftry>
			<cfquery name="local.genderValues" datasource="coldfusion">
				SELECT 
					id,
					gender_values
				FROM 
					gender
			</cfquery>
			<cfif local.genderValues.recordCount EQ 3>
				<cfreturn local.genderValues>
			</cfif>
		<cfcatch>
	
			<cfset local.result="#cfcatch.message#">
			<cfreturn local.result>
		</cfcatch>
		</cftry>
	</cffunction>

	<!--- CREATE CONTACT --->
	<cffunction name="createContact" access="public" returntype="array">
		<cfargument name="title" type="string" required="true">
		<cfargument name="firstname" type="string" required="true">
		<cfargument name="lastname" type="string" required="true">
		<cfargument name="gender" type="string" required="true">
		<cfargument name="dob" type="date" required="true">
		<cfargument name="imageAddress" type="string" required="true">
		<cfargument name="email" type="string" required="true">
		<cfargument name="phone" type="integer" required="true">
		<cfargument name="address" type="string" required="true">
		<cfargument name="street" type="string" required="true">
		<cfargument name="pincode" type="string" required="true">

		<cfset local.errors=[]>	

		<!--- Title --->
		<cfset local.titleArr=[]>	
		<cfset local.titleValues=getTitle()>
		<cfloop query="local.titleValues">
			<cfset arrayAppend(local.titleArr,local.titleValues.titles)>
		</cfloop>
		<cfif NOT ArrayContains(local.titleArr,arguments.title)>
			<cfset arrayAppend(local.errors,"*Enter a valid title")>
		</cfif>

		<!--- VALIDATE FIRSTNAME --->	
		<cfif len(trim(arguments.firstname)) EQ 0>
			<cfset arrayAppend(local.errors,"*Firstname is required")>
		<cfelseif NOT reFindNoCase("^[A-Za-z]+(\s[A-Za-z]+)?$",arguments.firstname)>
			<cfset arrayAppend(local.errors,"*Enter a valid firstname")>
		</cfif>

		<!--- VALIDATE LASTNAME--->
		<cfif len(trim(arguments.lastname)) EQ 0>
			<cfset arrayAppend(local.errors,"*Lastname is required")>
		<cfelseif NOT reFindNoCase("^[A-Za-z]+(\s[A-Za-z]+)?$",arguments.lastname)>
			<cfset arrayAppend(local.errors,"*Enter a valid firstname")>
		</cfif>

		<!--- VALIDATE GENDER --->
		<cfset local.genderArr=[]>
		<cfset local.genderValues=getGender()>
		<cfloop query="local.genderValues">
			<cfset arrayAppend(local.genderArr,local.genderValues.gender_values)>	
		</cfloop>
		<cfif NOT ArrayContains(local.genderArr,arguments.gender)>
			<cfset arrayAppend(local.errors,"*Please enter a valid gender")>
		</cfif>

		<!--- VALIDATE DOB --->
		<cfif NOT IsDate(arguments.dob)>
			<cfset arrayAppend(local.errors,"*Please enter a valid date")>
		</cfif>

		<!--- VALIDATE IMAGE --->		
		<cfif FileExists(arguments.imageAddress)>
			<cfset local.maxSize=5*1024*1024>
			<cfset local.allowedExtensions="image/jpeg,image/png,image/gif">
			<cffile action="read" file=#arguments.imageAddress# variable="local.fileContent">
			<cfif local.fileContent.FILESIZE GT maxSize>
				<cfset arrayAppend(local.errors,"*Image size should be less than 5 MB")>
			</cfif>	
			<cfif NOT ListFindNoCase(local.allowedExtensions,local.fileContent.SERVERFILEEXT)>
				<cfset arrayAppend(local.errors,"*Image should be jpeg,png or gif format")>
			</cfif>		
		</cfif>
		<!---VALIDATE EMAIL --->
		<cfif len(trim(arguments.email)) EQ 0>
			<cfset arrayAppend(local.errors,"*Email is required")>
		<cfelseif NOT reFindNoCase("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",arguments.email)>
			<cfset arrayAppend(local.errors,"*Enter a valid email")>
		</cfif>
	
		<!--- VALIDATE PHONE--->
		<cfif len(trim(arguments.phone)) EQ 0>
			<cfset arrayAppend(local.errors,"*Phone number is required")>
		<cfelseif NOT reFindNoCase("^\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$",arguments.phone)>
			<cfset arrayAppend(local.errors,"*Enter a valid phone number")>
		</cfif>
		
		<!--- VALIDATE ADDRESS--->
		<cfif len(trim(arguments.address)) EQ 0>
			<cfset arrayAppend(local.errors,"*Address is required")>
		</cfif>
	
		<!--- VALIDATE STREET --->
		<cfif len(trim(arguments.street)) EQ 0>
			<cfset arrayAppend(local.errors,"*Street name is required")>
		</cfif>

		<!---VALIDATE PINCODE --->
		<cfif len(trim(arguments.pincode)) EQ 0>
			<cfset  arrayAppend(local.errors,"*Pincode is required")>
		<cfelseif NOT reFindNoCase("^[1-9][0-9]{5}$",arguments.pincode)>
			<cfset arrayAppend(local.errors,"*Enter a valid pincode")>
		</cfif>
		<cfreturn local.errors>
	</cffunction> 

</cfcomponent>



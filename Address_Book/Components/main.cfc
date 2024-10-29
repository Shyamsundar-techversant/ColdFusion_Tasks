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

	<!--- VALIDATE CONTACT FORM--->
	<cffunction name="validateContactForm" access="public" returntype="array">
		<cfargument name="title" type="string" required="true">
		<cfargument name="firstname" type="string" required="true">
		<cfargument name="lastname" type="string" required="true">
		<cfargument name="gender" type="string" required="true">
		<cfargument name="dob" type="string" required="true">
		<cfargument name="uploadImg" type="string" required="true">
		<cfargument name="email" type="string" required="true">
		<cfargument name="phone" type="string" required="true">
		<cfargument name="address" type="string" required="true">
		<cfargument name="street" type="string" required="true">
		<cfargument name="pincode" type="string" required="true">

		<cfset local.errors=[]>	

		<!--- Title --->
		<cfset local.titleArr=[]>	
		<cfset local.titleValues=getTitle()>
		<cfloop query="local.titleValues">
			<cfset arrayAppend(local.titleArr,local.titleValues.id)>
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
			<cfset arrayAppend(local.errors,"*Enter a valid lastname")>
		</cfif>

		<!--- VALIDATE GENDER --->
		<cfset local.genderArr=[]>
		<cfset local.genderValues=getGender()>
		<cfloop query="local.genderValues">
			<cfset arrayAppend(local.genderArr,local.genderValues.id)>	
		</cfloop>
		<cfif NOT ArrayContains(local.genderArr,arguments.gender)>
			<cfset arrayAppend(local.errors,"*Please enter a valid gender")>
		</cfif> 

		<!--- VALIDATE DOB --->
		<cfif len(arguments.dob) EQ 0>
			<cfset arrayAppend(local.errors,"*Please enter date of birth")>
		<cfelseif NOT IsDate(arguments.dob)>
			<cfset arrayAppend(local.errors,"*Please enter a valid date")>
		</cfif> 
		
		<!--- VALIDATE IMAGE --->		
		<cfset local.maxSize=5*1024*1024>
		<cfset local.allowedExtensions = "jpeg,jpg,png,gif">
		<cfif len(trim(uploadImg)) EQ 0>
			<cfset arrayAppend(local.errors,"* Photo is required")>
		<cfelse>
			<cfset local.uploadDir=expandPath('./Uploads/')>
			<cfif NOT directoryExists(local.uploadDir)>
				<cfdirectory action="create" directory="#local.uploadDir#">
			</cfif>
			<cfif structKeyExists(form,"uploadImg")>
				<cffile action="upload"
					fileField="uploadImg"
					destination="#application.imageSavePath#"
					nameconflict="makeunique"
					result="local.uploadedImage"
				>
			</cfif>
			<cfif local.uploadedImage.FILESIZE GT maxSize>
				<cfset arrayAppend(local.errors,"*Image size should be less than 5 MB")>
			</cfif>	

			<cfif NOT ListFindNoCase(local.allowedExtensions,"#local.uploadedImage.CLIENTFILEEXT#")>
				<cfset arrayAppend(local.errors,"*Image should be jpeg,png or gif format")>
			</cfif>
			<cfset local.imagePath=local.uploadedImage.SERVERDIRECTORY>
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
		<cfelseif NOT reFindNoCase("^[6-9]\d{9}$",arguments.phone)>
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
		
		<!--- ADD FUNCTION CALL	--->
		<cfif arrayLen(local.errors) EQ 0>
			<cfset addCont=addContact(
							arguments.title,
							arguments.firstname,
							arguments.lastname,
							arguments.gender,
							arguments.dob,
							local.imagePath,
							arguments.email,
							arguments.phone,
							arguments.address,
							arguments.street,
							arguments.pincode
						)
			>
			<cfreturn local.errors>
		<cfelse>	
			<cfreturn local.errors>
		</cfif> 
	</cffunction> 
	
	<!--- ADD CONTACT --->
	<cffunction name="addContact" access="public" returntype="void">
		<cfargument name="title" type="string" required="true">
		<cfargument name="firstname" type="string" required="true">
		<cfargument name="lastname" type="string" required="true">
		<cfargument name="gender" type="string" required="true">
		<cfargument name="dob" type="string" required="true">
		<cfargument name="uploadImg" type="string" required="true">
		<cfargument name="email" type="string" required="true">
		<cfargument name="phone" type="string" required="true">
		<cfargument name="address" type="string" required="true">
		<cfargument name="street" type="string" required="true">
		<cfargument name="pincode" type="string" required="true">
		
		<cfset local.titleId= int(arguments.title)>
		<cfset local.genderId=int(arguments.gender)>	
		<cfset local.pincode = int(arguments.pincode)>
		<cfset local.phone = int(arguments.phone)>
		<cftry>
			<cfquery name="local.contactAdd" datasource="coldfusion">
				INSERT INTO
					contacts(
						contactId,
						titleId,
						firstName,
						lastName,
                        			genderId,
                        			dob,
                        			imagePath,
                        			address,
						street,
						pincode,
						email,
						phone
					)
				VALUES(
					<cfqueryparam value= #session.userId#  cfsqltype="cf_sql_integer">,
					<cfqueryparam value="#local.titleId#" cfsqltype="cf_sql_integer">,
					<cfqueryparam value="#arguments.firstname#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.lastname#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#local.genderId#" cfsqltype="cf_sql_integer"> ,
					<cfqueryparam value="#arguments.dob#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.uploadImg#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.street#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#local.pincode#" cfsqltype="cf_sql_integer">,
					<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#local.phone#" cfsqltype="cf_sql_bigint">
				)
			</cfquery>
 		<cfcatch>
			<cfdump var="#cfcatch#">
		</cfcatch>
		</cftry>
			
	</cffunction>

</cfcomponent>



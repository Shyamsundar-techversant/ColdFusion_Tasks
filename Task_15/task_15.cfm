	<!--- By Invoke method --->

	<!-- Call multiply(1, 2) using cfinvoke -->
	<h2>By invoke </h2>
	<cfinvoke component="Components.task_15" method="multiply" returnvariable="result1">
    		<cfinvokeargument name="1" value="1">
		<cfinvokeargument name="2" value="2">
	</cfinvoke>
	<cfoutput>Result of multiply(1, 2): #result1#</cfoutput><br>

	<!--- Call multiply(1, 2, 3) using cfinvoke --->
	<cfinvoke component="Components.task_15" method="multiply" returnvariable="result2">
		<cfinvokeargument name="1" value="1">
		<cfinvokeargument name="2" value="2">
		<cfinvokeargument name="3" value="3">
	</cfinvoke>
	<cfoutput>Result of multiply(1, 2, 3): #result2#</cfoutput><br>

	<!--- Call multiply(1, 2, 3) again using cfinvoke --->
	<cfinvoke component="Components.task_15" method="multiply" returnvariable="result3">
		<cfinvokeargument name="1" value="1">
		<cfinvokeargument name="2" value="2">
		<cfinvokeargument name="3" value="3">
		<cfinvokeargument name="4" value="4">
	</cfinvoke>
	<cfoutput>Result of multiply(1, 2, 3, 4): #result3#</cfoutput><br> 
	
	<!--- By using cfobject tag--->
	<h2>By cfobject tag</h2>
	<cfobject component="Components.task_15" name="objMultiply">
	<cfset res1=objMultiply.multiply(1,2)>
	<cfoutput>Result of mulitply(1,2):#res1#</cfoutput><br>

	<cfset res2=objMultiply.multiply(1,2,3)>
	<cfoutput>Result of multiply(1,2,3):#res2#</cfoutput><br>
	
	<cfset res3=objMultiply.multiply(1,2,3,4)>
	<cfoutput>Result of multiply(1,2,3,4):#res3#</cfoutput>



	<!--- By createObject() --->
	<h2>By createObject()</h2>	
	<cfset multiplyObj=createObject("component","Components.task_15")>
	<cfset res1=multiplyObj.multiply(1,2)>
	<cfset res2=multiplyObj.multiply(1,2,3)>
	<cfset res3=multiplyObj.multiply(1,2,3,4)>
	<cfoutput>Result of multiply(1,2) : #res1#</cfoutput><br>
	<cfoutput>Result of multiply(1,2,3):#res2#</cfoutput><br>
	<cfoutput>Result of multiply(1,2,3,4):#res3#</cfoutput><br>


	




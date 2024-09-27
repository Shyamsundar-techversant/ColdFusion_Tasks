	<!--- Crate new query with specified columns--->
	<cfset myQuery=QueryNew("ID,Name,Email","Integer,Varchar,Varchar")>
	
	<!--- Add First Row--->
	<cfset QueryAddRow(myQuery)>
	<cfset QuerySetCell(myQuery,"ID",1,1)>
	<cfset QuerySetCell(myQuery,"Name","Sree",1)>
	<cfset QuerySetCell(myQuery,"Email","sree@gmail.com",1)>

	<!--- Add Second Row--->
	<cfset QueryAddRow(myQuery)>
	<cfset QuerySetCell(myQuery,"ID",2,2)>
	<cfset QuerySetCell(myQuery,"Name","Anu",2)>
	<cfset QuerySetCell(myQuery,"Email","anu@gmail.com",2)>
	
	<!---Add Third Row--->
	<cfset QueryAddRow(myQuery)>
	<cfset QuerySetCell(myQuery,"ID",3,3)>
	<cfset QuerySetCell(myQuery,"Name","Narmadha",3)>
	<cfset QuerySetCell(myQuery,"Email","narmada@gmail.com",3)>


	<cfdump var="#myQuery#">
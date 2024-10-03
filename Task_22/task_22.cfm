<cfset newQuery=QueryNew("Name,Age,Location","Varchar,Integer,Varchar")>
<cfset QueryAddRow(newQuery)>
<cfset QuerySetCell(newQuery,"Name","Saravanan",1)>
<cfset QuerySetCell(newQuery,"Age",27,1)>
<cfset QuerySetCell(newQuery,"Location","Dubai",1)>

<cfset QueryAddRow(newQuery)>
<cfset QuerySetCell(newQuery,"Name","Ram",2)>
<cfset QuerySetCell(newQuery,"Age",26,2)>
<cfset QuerySetCell(newQuery,"Location","Kovipatti",2)>

<cfdump var="#newQuery#">
<cfset datasrc = "cfb">

<cfdbinfo 
    type="dbnames"
    datasource="#datasrc#"
    name="dbdata">

<cfdump var="#dbdata#" label="dbnames">

<cfdbinfo 
    type="tables"
	dbname="cfb"
    datasource="#datasrc#"
    name="dbdata">

<cfdump var="#dbdata#" label="tables">

<cfdbinfo 
    type="columns"
	dbname="cfb"
	table="product"
    datasource="#datasrc#"
    name="dbdata">

<cfdump var="#dbdata#" label="columns">

<cfdbinfo 
    type="index"
	dbname="cfb"
	table="product"
    datasource="#datasrc#"
    name="dbdata">

<cfdump var="#dbdata#" label="index">

<cfdbinfo 
    type="version"
	dbname="cfb"
    datasource="#datasrc#"
    name="dbdata">

<cfdump var="#dbdata#" label="version">

<cfset myTable = "product">

<cfdbinfo 
    type="foreignkeys"
	dbname="cfb"
	table="#myTable#"
    datasource="#datasrc#"
    name="dbdata">

<cfdump var="#dbdata#" label="foreignkeys">

<cfset isJumpTable = listLen(dbdata.fktable_name,"_")>
<cfif isJumpTable>
<cfoutput>JumpTable = '#dbdata.fktable_name#'<br></cfoutput>
<cfset joinedTable = listGetAt(dbdata.fktable_name,3-isJumpTable,"_")>
<cfdbinfo 
    type="foreignkeys"
	dbname="cfb"
	table="#joinedTable#"
    datasource="#datasrc#"
    name="dbdata">

<cfdump var="#dbdata#" label="foreignkeys join table">

</cfif>
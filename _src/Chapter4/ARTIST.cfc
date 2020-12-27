<cfcomponent persistent="true" table="ARTISTS">
	<!---- properties ---->
	<cfproperty name="ARTISTID" ormtype="int" fieldtype="id"  /> 
	<cfproperty name="FIRSTNAME" ormtype="string"  /> 
	<cfproperty name="LASTNAME" ormtype="string"  /> 
	<cfproperty name="ADDRESS" ormtype="string"  /> 
	<cfproperty name="CITY" ormtype="string"  /> 
	<cfproperty name="STATE" ormtype="string"  /> 
	<cfproperty name="POSTALCODE" ormtype="string"  /> 
	<cfproperty name="EMAIL" ormtype="string"  /> 
	<cfproperty name="PHONE" ormtype="string"  /> 
	<cfproperty name="FAX" ormtype="string"  /> 
	<cfproperty name="THEPASSWORD" ormtype="string"  /> 	
</cfcomponent> 

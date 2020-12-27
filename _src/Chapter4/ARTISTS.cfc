<cfcomponent persistent="true" table="ARTISTS"  schema="APP" output="false">
	<!---- properties ---->
	
	<cfproperty name="ARTISTID" column="ARTISTID" type="numeric" ormtype="int" fieldtype="id"  /> 
	<cfproperty name="FIRSTNAME" column="FIRSTNAME" type="string" ormtype="string"  /> 
	<cfproperty name="LASTNAME" column="LASTNAME" type="string" ormtype="string"  /> 
	<cfproperty name="ADDRESS" column="ADDRESS" type="string" ormtype="string"  /> 
	<cfproperty name="CITY" column="CITY" type="string" ormtype="string"  /> 
	<cfproperty name="STATE" column="STATE" type="string" ormtype="string"  /> 
	<cfproperty name="POSTALCODE" column="POSTALCODE" type="string" ormtype="string"  /> 
	<cfproperty name="EMAIL" column="EMAIL" type="string" ormtype="string"  /> 
	<cfproperty name="PHONE" column="PHONE" type="string" ormtype="string"  /> 
	<cfproperty name="FAX" column="FAX" type="string" ormtype="string"  /> 
	<cfproperty name="THEPASSWORD" column="THEPASSWORD" type="string" ormtype="string"  /> 	
</cfcomponent> 

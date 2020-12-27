<cfcomponent persistent="true" table="GALLERYADMIN"  schema="APP" output="false">
	<!---- properties ---->
	
	<cfproperty name="GALLERYADMINID" column="GALLERYADMINID" type="numeric" ormtype="int" fieldtype="id"  /> 
	<cfproperty name="FIRSTNAME" column="FIRSTNAME" type="string" ormtype="string"  /> 
	<cfproperty name="LASTNAME" column="LASTNAME" type="string" ormtype="string"  /> 
	<cfproperty name="EMAIL" column="EMAIL" type="string" ormtype="string"  /> 
	<cfproperty name="ADMINPASSWORD" column="ADMINPASSWORD" type="string" ormtype="string"  /> 	
</cfcomponent> 

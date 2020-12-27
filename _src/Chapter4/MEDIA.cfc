<cfcomponent persistent="true" table="MEDIA"  schema="APP" output="false">
	<!---- properties ---->
	
	<cfproperty name="MEDIAID" column="MEDIAID" type="numeric" ormtype="int" fieldtype="id"  /> 
	<cfproperty name="MEDIATYPE" column="MEDIATYPE" type="string" ormtype="string"  />
	
	<cfproperty name="works" cfc="ART"
		fkcolumn="MEDIAID" fieldtype="one-to-many" >
		
</cfcomponent> 

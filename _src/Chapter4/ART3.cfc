<cfcomponent persistent="false" entityname="art2" table="ART"  schema="APP" output="false">
	<cfproperty name="ARTID" column="ARTID" ormtype="int" fieldtype="id"  /> 
	<cfproperty name="ARTISTID" column="ARTISTID" ormtype="int"
		insert="false" update="false" /> 
	<cfproperty name="ARTNAME" column="ARTNAME" ormtype="string"  /> 
	<cfproperty name="DESCRIPTION" column="DESCRIPTION" ormtype="clob"  /> 
	<cfproperty name="PRICE" column="PRICE" ormtype="double"  /> 
	<cfproperty name="LARGEIMAGE" column="LARGEIMAGE" ormtype="string"  /> 
	<cfproperty name="MEDIAID" column="MEDIAID" ormtype="int"
		insert="false" update="false" /> 
	<cfproperty name="ISSOLD" column="ISSOLD" ormtype="short"  />	
	<!--- Relations --->
	<cfproperty name="ARTISTS" singularname="ARTIST" type="array" 
		fieldtype="many-to-one" cfc="ARTIST" fkcolumn="ARTISTID"/>
	<cfproperty name="MEDIA" singularname="MEDIA" type="array" 
		fieldtype="many-to-one" cfc="MEDIA" fkcolumn="MEDIAID"/>
</cfcomponent> 

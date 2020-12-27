<cfcomponent persistent="true" table="ART"  schema="APP" output="false">
	<!---- properties ---->
	
	<cfproperty name="ARTID" column="ARTID" type="numeric" ormtype="int" fieldtype="id"  /> 
	<cfproperty name="ARTISTID" column="ARTISTID" type="numeric" ormtype="int" 
		insert="false" update="false" /> 
	<cfproperty name="ARTNAME" column="ARTNAME" type="string" ormtype="string"  /> 
	<cfproperty name="DESCRIPTION" column="DESCRIPTION" type="string" ormtype="clob"  /> 
	<cfproperty name="PRICE" column="PRICE" type="numeric" ormtype="double"  /> 
	<cfproperty name="LARGEIMAGE" column="LARGEIMAGE" type="string" ormtype="string"  /> 
	<cfproperty name="MEDIAID" column="MEDIAID" type="numeric" ormtype="int" 
		insert="false" update="false" /> 
	<cfproperty name="ISSOLD" column="ISSOLD" type="numeric" ormtype="short"  /> 
	
	<cfproperty name="artist" cfc="ARTISTS"
		 fkcolumn="ARTISTID" fieldtype="many-to-one" >
	<cfproperty name="media" cfc="MEDIA"
		fkcolumn="MEDIAID" fieldtype="many-to-one" >
	<cfproperty name="order" fieldtype="many-to-many"
		cfc="ORDERS" fkcolumn="ARTID"
		linkTable="ORDERITEMS" inverseJoinColumn="ORDERID">
		
</cfcomponent> 

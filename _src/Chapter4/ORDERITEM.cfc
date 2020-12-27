<cfcomponent persistent="true" table="ORDERITEMS"  schema="APP" output="false">
	<!---- properties ---->
	
	<cfproperty name="ORDERITEMID" column="ORDERITEMID" type="numeric" ormtype="int" fieldtype="id"  /> 
	<cfproperty name="ORDERID" column="ORDERID" type="numeric" ormtype="int"  /> 
	<cfproperty name="ARTID" column="ARTID" type="numeric" ormtype="int"  /> 
	<cfproperty name="PRICE" column="PRICE" type="numeric" ormtype="double"  /> 	
</cfcomponent> 

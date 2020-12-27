<cfcomponent persistent="true" table="ORDERITEMS"  schema="APP" output="false">
	<!---- properties ---->
	
	<cfproperty name="ORDERITEMID" column="ORDERITEMID" type="numeric" ormtype="int" fieldtype="id"  /> 
	<cfproperty name="ORDERID" column="ORDERID" type="numeric" ormtype="int" insert="false" update="false" /> 
	<cfproperty name="ARTID" column="ARTID" type="numeric" ormtype="int" insert="false" update="false" /> 
	<cfproperty name="PRICE" column="PRICE" type="numeric" ormtype="double"  /> 
	
	<cfproperty name="order" fieldtype="many-to-one"
		cfc="ORDERS" fkcolumn="ORDERID" >
	<cfproperty name="art" fieldtype="many-to-one"
		cfc="ART" fkcolumn="ARTID" >
		
</cfcomponent> 

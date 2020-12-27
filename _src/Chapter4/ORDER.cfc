<cfcomponent persistent="true" table="ORDERS"  schema="APP" output="false">
	<!---- properties ---->
	
	<cfproperty name="ORDERID" column="ORDERID" type="numeric" ormtype="int" fieldtype="id"  /> 
	<cfproperty name="TAX" column="TAX" type="numeric" ormtype="double"  /> 
	<cfproperty name="TOTAL" column="TOTAL" type="numeric" ormtype="double"  /> 
	<cfproperty name="ORDERDATE" column="ORDERDATE" type="date" ormtype="timestamp"  /> 
	<cfproperty name="ORDERSTATUSID" column="ORDERSTATUSID" type="numeric" ormtype="int" insert="false" update="false" /> 
	<cfproperty name="CUSTOMERFIRSTNAME" column="CUSTOMERFIRSTNAME" type="string" ormtype="string"  /> 
	<cfproperty name="CUSTOMERLASTNAME" column="CUSTOMERLASTNAME" type="string" ormtype="string"  /> 
	<cfproperty name="ADDRESS" column="ADDRESS" type="string" ormtype="string"  /> 
	<cfproperty name="CITY" column="CITY" type="string" ormtype="string"  /> 
	<cfproperty name="STATE" column="STATE" type="string" ormtype="string"  /> 
	<cfproperty name="POSTALCODE" column="POSTALCODE" type="string" ormtype="string"  /> 
	<cfproperty name="PHONE" column="PHONE" type="string" ormtype="string"  /> 	
</cfcomponent> 

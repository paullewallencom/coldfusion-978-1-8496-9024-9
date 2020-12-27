<cfcomponent persistent="true" table="ORDERSTATUS"  schema="APP" output="false">
	<!---- properties ---->
	
	<cfproperty name="ORDERSTATUSID" column="ORDERSTATUSID" type="numeric" ormtype="int" fieldtype="id"  /> 
	<cfproperty name="STATUS" column="STATUS" type="string" ormtype="string"  /> 	
</cfcomponent> 

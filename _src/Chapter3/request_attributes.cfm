<!--- request_attributes.cfm --->
<cfscript>
if(NOT isDefined("attributes")){
	attributes = structNew();
}
structAppend(attributes,url);
structAppend(attributes,form);
</cfscript>
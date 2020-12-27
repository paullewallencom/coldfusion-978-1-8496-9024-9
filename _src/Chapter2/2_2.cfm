<!--- Example: 2_2.cfm --->
<!--- Processing --->
<cfscript>
objProduct = createObject("component","product_1");
result = objProduct.get_name();
</cfscript>
<!--- Content --->
<cfoutput>
	#result#
</cfoutput>
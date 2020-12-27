<!--- Example: 2_2b.cfm --->
<!--- Processing --->
<cfscript>
objProduct = createObject("component","product_1").init();
result = objProduct.get_name();
</cfscript>
<!--- Content --->
<cfoutput>
	#result#
</cfoutput>
<!--- Example: 2_4.cfm --->
<!--- Processing --->
<cfscript>
objProduct = createObject("component","product_2").init();
rsProducts = objProduct.getRecordset();
</cfscript>
<!--- Content --->
<cfdump var="#rsProducts#">
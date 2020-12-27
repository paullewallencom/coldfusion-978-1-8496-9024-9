<!--- Example: product_list.cfm --->
<!--- Processing --->
<cfparam name="url.message" default="">
<cfscript>
objProduct = createObject("component","product").init(dsn="cfb");
rsProducts = objProduct.getRecordset();
</cfscript>
<!--- Content --->
<cfif url.message NEQ "">
	<div>
		<cfoutput>#url.message#</cfoutput>
		<hr />
	</div>
</cfif>
<h3>Select a product to edit.</h3>
<ul>
	<li><a href="product_edit.cfm">+ New Product</li></li>
	<cfoutput query="rsProducts">
	<li><a href="product_edit.cfm?id=#rsProducts.id#">#rsProducts.name#</li></cfoutput>
</ul>
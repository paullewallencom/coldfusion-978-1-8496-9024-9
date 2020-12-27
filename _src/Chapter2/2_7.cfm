<!--- Example: 2_7.cfm --->
<!--- Processing --->
<cfparam name="url.id" default="0">
<cfscript>
objProduct = createObject("component","product_3").init();
rsProducts = objProduct.getRecordset();
objProduct.load(url.id);
</cfscript>
<!--- Content --->
<ul><cfoutput query="rsProducts">
	<li><a href="?id=#rsProducts.id#">#rsProducts.name#</a></li></cfoutput>
</ul>
<cfif objProduct.get('name') NEQ "">
	<cfoutput>
		<table>
			<tr>
				<th>Product</th>
				<td>#objProduct.get('name')#</td>
			</tr>
			<tr>
				<th>Description</th>
				<td>#objProduct.get('description')#</td>
			</tr>
			<tr>
				<th>Price</th>
				<td>#dollarFormat(objProduct.get('price'))#</td>
			</tr>
		</table>
	</cfoutput>
</cfif>
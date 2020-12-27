<!--- Example: 2_6.cfm --->
<!--- Processing --->
<cfparam name="url.id" default="0">
<cfscript>
objProduct = createObject("component","product_2").init();
rsProducts = objProduct.getRecordset();
objProduct.load(url.id);
</cfscript>
<!--- Content --->
<ul><cfoutput query="rsProducts">
	<li><a href="?id=#rsProducts.id#">#rsProducts.name#</a></li></cfoutput>
</ul>
<cfif objProduct.get_name() NEQ "">
	<cfoutput>
		<table>
			<tr>
				<th>Product</th>
				<td>#objProduct.get_name()#</td>
			</tr>
			<tr>
				<th>Description</th>
				<td>#objProduct.get_description()#</td>
			</tr>
			<tr>
				<th>Price</th>
				<td>#dollarFormat(objProduct.get_price())#</td>
			</tr>
		</table>
	</cfoutput>
</cfif>
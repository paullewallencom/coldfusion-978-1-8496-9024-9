<!--- Example: 2_5.cfm --->
<!--- Processing --->
<cfparam name="url.id" default="0">
<cfscript>
objProduct = createObject("component","product_2").init();
rsProducts = objProduct.getRecordset();
rsProduct = objProduct.load(url.id);
</cfscript>
<!--- Content --->
<ul><cfoutput query="rsProducts">
	<li><a href="?id=#rsProducts.id#">#rsProducts.name#</a></li></cfoutput>
</ul>
<cfif rsProduct.recordCount EQ 1>
	<cfoutput>
		<table>
			<tr>
				<th>Product</th>
				<td>#rsProduct.name#</td>
			</tr>
			<tr>
				<th>Description</th>
				<td>#rsProduct.description#</td>
			</tr>
			<tr>
				<th>Price</th>
				<td>#dollarFormat(rsProduct.price)#</td>
			</tr>
		</table>
	</cfoutput>
</cfif>
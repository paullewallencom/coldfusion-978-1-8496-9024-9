<html>
<head>
	<title>Grid Example</title>
</head>
<body>
<h2>Grid Example</h2>
<cfform>
	<cfgrid name="products" title="Products"
			format="html" striperows="yes"
			pageSize="3" collapsible="true"
			bind="cfc:product.getGridRecordSet(
				{cfgridpage},{cfgridpagesize},
				{cfgridsortcolumn},{cfgridsortdirection})">
		<cfgridcolumn name="name" header="Product" width="120"/>
		<cfgridcolumn name="description" header="Description" width="300"/>
		<cfgridcolumn name="price" header="Price" width="120"/>
		<cfgridcolumn name="section" header="Price" width="120"/>
	</cfgrid>
</cfform>
</body>
</html>
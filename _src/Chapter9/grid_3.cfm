<html>
<head>
	<title>Grid Example</title>
</head>
<body>
<h2>Grid Example</h2>
<cfform name="bob">
	<cfgrid name="products"
			format="html" striperows="yes"
			pageSize="3"
			selectOnLoad="yes" preservepageonsort="yes"
			selectmode="edit"  
			delete="true" deletebutton="X"
			onChange="cfc:product.updateRow({cfgridaction},{cfgridrow},{cfgridchanged})"
			bind="cfc:product.getGridRecordSet(
				{cfgridpage},{cfgridpagesize},
				{cfgridsortcolumn},{cfgridsortdirection})">
		<cfgridcolumn name="name" header="Product" width="120"/>
		<cfgridcolumn name="description" header="Description" width="300"/>
		<cfgridcolumn name="price" header="Price" width="120"/>
	</cfgrid>
</cfform>
</body>
</html>
<html>
<head>
	<title>CFInput Example</title>
</head>
<body>
<h2>Grid Example</h2>
<cfform name="bob">
	<cfgrid name="products"
			format="html" striperows="yes"
			pageSize="3"
			selectOnLoad="yes" preservepageonsort="yes"
			selectmode="Single"  
			delete="true" deletebutton="X"
			onChange="cfc:product.updateRow({cfgridaction},{cfgridrow},{cfgridchanged})"
			bind="cfc:product.getGridRecordSet(
				{cfgridpage},{cfgridpagesize},
				{cfgridsortcolumn},{cfgridsortdirection})">
		<cfgridcolumn name="ID" display="false"/>
		<cfgridcolumn name="name" header="Product" width="120"
			href="grid_4.cfm" hrefkey="ID" target="_blank"/>
		<cfgridcolumn name="description" header="Description" width="300"/>
	</cfgrid>
</cfform>
</body>
</html>
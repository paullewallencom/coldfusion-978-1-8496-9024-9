<cfscript>
	oProduct = createObject("component","product").init(dsn:'cfbootcamp');
	rsProducts = oProduct.getRecordset();
</cfscript>
<html>
<head>
	<title>Grid Example</title>
</head>
<body>
<h2>Grid Example</h2>
<cfform>
	<cfgrid name="products" query="rsProducts" groupfield="section"
			format="html" striperows="yes">
	</cfgrid>
</cfform>

</body>
</html>
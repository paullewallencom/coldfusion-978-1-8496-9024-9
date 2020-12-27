<html>
<head>
	<title>CFTree Example</title>
</head>
<body>
<h2>CFTree Example</h2>
<cfform name="bob">
	<cftree name="dirTree" format="html">
		<cftreeitem bind="cfc:objTree.getNodes({cftreeitemvalue},{cftreeitempath})">
	</cftree>
</cfform>
</body>
</html>
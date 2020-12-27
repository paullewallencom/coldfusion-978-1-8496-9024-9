<html>
<head>
	<title>CFMenu Example</title>
	<script>
	</script>
</head>
<body>
<cflayout
	type="border"
	name="myLayout">
	<cflayoutarea name="region1" 
		position="top" align="center">
		<strong>Header Section</strong>
	</cflayoutarea>
	<cflayoutarea name="region2" 
		position="left" size="140">
		<cfmenu name="sbMenu" type="vertical">
			<cfmenuitem display="Home" href="javascript:alert('Home')" />
			<cfmenuitem display="Shop" />
			<cfmenuitem display="About Us" href="javascript:alert('About Us')" />
		</cfmenu>
	</cflayoutarea>
	<cflayoutarea name="region3" 
		position="center" overflow="hidden">
			Main Content Region
			<p id="status"></p>
	</cflayoutarea>
	<cflayoutarea name="region5"
		position="bottom">
		Footer Section
	</cflayoutarea>
</cflayout>
</body>
</html>
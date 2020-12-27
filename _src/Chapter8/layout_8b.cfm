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
	<cflayoutarea name="region3" 
		position="center" overflow="hidden">
		<cfmenu name="sbMenu" type="horizontal">
			<cfmenuitem display="Home" href="javascript:alert('Home')" />
			<cfmenuitem display="Shop">
				<cfmenuitem display="Catalog" />
				<cfmenuitem display="Specials" />
				<cfmenuitem divider="true" />
				<cfmenuitem display="Order History" />
			</cfmenuitem>
			<cfmenuitem display="About Us" href="javascript:alert('About Us')" />
		</cfmenu>
		<br />
		<form style="margin-left: 160px;">
			<select>
				<option>Menu Checker</option>
			</select>
		</form>
	</cflayoutarea>
	<cflayoutarea name="region5"
		position="bottom">
		Footer Section
	</cflayoutarea>
</cflayout>
</body>
</html>
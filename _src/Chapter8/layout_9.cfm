<html>
<head>
	<title>Tool Tips Example</title>
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
		<p>
		This is an example of a <cftooltip sourcefortooltip="myTip.cfm"><strong>tooltip</strong></cftooltip> where the tip is actually pulled from another web page. If you wanted this could even be dynaic content. Mouse over the word tooltip in the fist sentence to see the tip.
		</p>
		<br />
		<form style="margin-left: 160px;">
			<cftooltip tooltip="This is our <strong>static</strong> tip.">
			<select>
				<option>Tip Checker</option>
			</select>
			</cftooltip>
		</form>
	</cflayoutarea>
	<cflayoutarea name="region5"
		position="bottom">
		Footer Section
	</cflayoutarea>
</cflayout>
</body>
</html>
<html>
<head>
	<title>CFDiv Example</title>
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
		position="left" style="width:120px"
		title="Sidebar Section" collapsible="true">
		<ul>
			<li>One</li>
			<li>Two</li>
			<li>Three</li>
		</ul>
	</cflayoutarea>
	<cflayoutarea name="region3" 
		position="center" overflow="hidden">
			<cflayout name="myTabs" type="tab">
				<cflayoutarea
					title="Tab 1">
					<p>Box Region 1</p>
				</cflayoutarea>
				<cflayoutarea
					title="Tab 2">
					<p>Box Region 2</p>
				</cflayoutarea>
				<cflayoutarea
					title="Tab 3">
					<p>Box Region 3</p>
				</cflayoutarea>
			</cflayout>
	</cflayoutarea>
	<cflayoutarea name="region5" 
		position="bottom">
		Footer Section
	</cflayoutarea>
</cflayout>
</body>
</html>

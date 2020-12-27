<html>
<head>
	<title>CFDiv Example</title>
	<script>
	// Configuration for second window
	var config =
	{x:100,y:100,width:300,modal:false,closable:false,
		dragable:true,resizeable:true,initShow:false,minheight:150,minwidth:150}
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
		<strong>Sidebar Section</strong>
		<ul>
			<li>One</li>
			<li>Two</li>
			<li>Three</li>
		</ul>
		<cfpod name="myPod" title="Control 1" 
				width="138" height="60">
			<form>
				<input
					type="button" value="Show Window"
					onClick="ColdFusion.Window.show('window1')">
				<input
					type="button" value="Hide Window"
					onClick="ColdFusion.Window.hide('window1')">
			</form>
		</cfpod>
		<cfpod name="myPod2" title="Control 2" 
				width="138" height="85">
			<form>
				<input
					type="button" value="Make Window"
					onClick="ColdFusion.Window.create('window2', 'Created In Browser Window', 'popWindowContent.cfm', config)">
				<input
					type="button" value="Show Window"
					onClick="ColdFusion.Window.show('window2')">
				<input
					type="button" value="Hide Window"
					onClick="ColdFusion.Window.hide('window2')">
			</form>
		</cfpod>
	</cflayoutarea>
	<cflayoutarea name="region3" 
		position="center" overflow="hidden">
			Main Content Region
	</cflayoutarea>
	<cflayoutarea name="region5"
		position="bottom">
		Footer Section
	</cflayoutarea>
</cflayout>

<cfwindow name="window1" title="Popup Window"
	draggable="false" resizable="false"
	height="300" width="300" x="50" y="50">
This is a stubborn window that has limited features.
</cfwindow>
</body>
</html>
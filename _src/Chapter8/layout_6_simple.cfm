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
		position="left" size="120">
		<strong>Sidebar Section</strong>
		<ul>
			<li>One</li>
			<li>Two</li>
			<li>Three</li>
		</ul>
		<cfpod name="myPod" title="Pod 1" 
				width="118" height="40">
			This is pod content.
		</cfpod>
		<cfpod name="myPod2" title="Pod 2" 
				width="118" height="60">
			This is more pod content.
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
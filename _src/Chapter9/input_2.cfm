<html>
<head>
	<title>CFInput Example</title>
</head>
<body>
<h2>CFInput Example</h2>
<cfform name="bob">
	<cfinput name="boxOne" value="Pre-Set Value" /><br/>
	<cfinput name="boxTwo" /><br/>
	<cfinput name="boxThree" bind="{boxOne}" bindonload="true" />
</cfform>
</body>
</html>
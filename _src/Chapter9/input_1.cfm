<html>
<head>
	<title>CFInput Example</title>
</head>
<body>
<h2>CFInput Example</h2>
<cfform name="bob">
	<cfinput name="boxOne" /><br/>
	<cfinput name="boxTwo" /><br/>
	<cfinput name="boxThree" bind="{boxOne}" />
</cfform>
</body>
</html>
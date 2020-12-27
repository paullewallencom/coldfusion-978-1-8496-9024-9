<html>
<head>
	<title>CFInput Example</title>
</head>
<body>
<h2>CFInput Example</h2>
<cfform name="bob">
	<cfinput name="boxOne" value="1234567890" mask="999-999-9999" /><br/>
	<cfinput name="boxTwo" /><br/>
	<cfinput name="boxThree" bind="{boxOne}" 
		bindonload="true" mask="999-999-9999" />
</cfform>
</body>
</html>
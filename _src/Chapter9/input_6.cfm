<html>
<head>
	<title>CFInput Example</title>
</head>
<body>
<h2>CFInput Example</h2>
<cfform name="bob">
	<cfinput name="boxOne" type="text" typeahead="true"
		autosuggest="cfc:names.getUsers({cfautosuggestvalue})" />
	<br/>
</cfform>
</body>
</html>
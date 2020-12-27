<html>
<head>
	<title>CFSelect Example</title>
</head>
<body>
<cfif structKeyExists(form,"rtext")>
	<h2>Submitted Rich Text</h2>
	<cfoutput>#form.rtext#</cfoutput>
</cfif>
<h2>CFTextArea Example</h2>
<cfform name="bob">
	<cftextarea richText="true" name="rtext"
		toolbar="Basic" />
	<cfinput name="submit" type="submit" value="Store">
</cfform>
</body>
</html>
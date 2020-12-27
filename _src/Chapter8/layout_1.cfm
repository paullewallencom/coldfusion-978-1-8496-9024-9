<html>
<head>
	<title>CFDiv Example</title>
</head>
<body>
<h2>Ticket Example</h2>
<cfform>
	<cfinput name="purchaser" type="text">&nbsp;Name<br />
	<cfinput name="forDay" type="datefield">&nbsp;Date<br />
</cfform>
<cfdiv 
	bind="url:ticket_reply.cfm?purchaser={purchaser}&forDay={forDay}" 
	id="dynaDiv" 	style="background-color:##DDDDDD;">
</body>
</html>
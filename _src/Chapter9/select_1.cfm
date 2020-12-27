<html>
<head>
	<title>CFSelect Example</title>
</head>
<body>
<h2>CFSelect Example</h2>
<cfform name="bob">
	Departments:<br/>
	<cfselect name="dept_id"
		bind="cfc:hr.getDepts()"
		bindonload="true" />
	<br/>
	<br/>
	Employees:<br/>
	<cfselect name="emp_id"
		bind="cfc:hr.getEmployees({dept_id})" />
</cfform>
</body>
</html>
<cfdump var="#form#">

<form name="frmTest" method="post">
	<input name="id" type="text"><br />
	<input name="product" type="text"><br />
	<input name="description" type="text"><br />
	<input name="price" type="text"><br />
	<input name="item[1].title" type="text"><br />
	<input name="item[1].price" type="text"><br />
	<input name="item[2].title" type="text"><br />
	<input name="item[2].price" type="text"><br />
	<input name="item[3].title" type="text"><br />
	<input name="item[3].price" type="text"><br />
	<input type="submit" value="submit">
</form>

<cftry>
	<cfdump var="#form['item[2].title']#">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>
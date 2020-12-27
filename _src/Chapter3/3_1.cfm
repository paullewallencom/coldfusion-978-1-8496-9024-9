<!--- Example: 3_1.cfm --->
<!--- Processing --->
<!--- Content --->
<form action="3_1.cfm" method="post">
	<table>
		<tr>
			<td>Name:</td>
			<td>
				<input type="text" name="name" id="idName" value="" />
			</td>
		</tr>
		<tr>
			<td>Description:</td>
			<td>
				<textArea name="description" id="idDescription"></textArea>
			</td>
		</tr>
		<tr>
			<td>Price:</td>
			<td>
				<input type="text" name="price" id="idPrice" value="" />
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<input type="submit" value="submit" />
			</td>
		</tr>
	</table>
</form>
<cfdump var="#form#"/>
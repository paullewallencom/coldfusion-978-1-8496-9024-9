<!--- Example: product_edit.cfm --->
<!--- Processing --->
<cfinclude template="request_attributes.cfm">
<cfparam name="attributes.id" default="0">
<cfscript>
myRedirect = "";
objProduct = createObject("component","product").init(dsn="cfb");
if(structKeyExists(attributes,"submit")){
	result = objProduct.saveStruct(attributes);
	myRedirect = "product_list.cfm?message=#result.message#";
} else {
	objProduct.load(attributes.id);
}
</cfscript>
<cfif myRedirect NEQ "">
	<cflocation url="#myRedirect#">
</cfif>

<!--- Content --->
<cfoutput>
<form action="product_edit.cfm" method="post">
	<input type="hidden" name="id" value="#objProduct.get('id')#">
	<table>
		<tr>
			<td>Name:</td>
			<td>
				<input type="text" name="name" id="idName" value="#objProduct.get('name')#" />
			</td>
		</tr>
		<tr>
			<td>Description:</td>
			<td>
				<textArea name="description" id="idDescription">#objProduct.get('description')#</textArea>
			</td>
		</tr>
		<tr>
			<td>Price:</td>
			<td>
				<input type="text" name="price" id="idPrice" value="#objProduct.get('price')#" />
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<input type="submit" name="submit" value="submit" />
			</td>
		</tr>
	</table>
</form>
</cfoutput>
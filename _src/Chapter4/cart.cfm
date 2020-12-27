<cfscript>
if(structKeyExists(session,"cartID")){
	cart = entityLoadbyPK("ORDERS",session.cartID);
} else {
	cart = entityNew("ORDERS");
	cart.setOrderStatus(entityLoad("ORDERSTATUS",{STATUS="pending"},true));
	cart.setTax(0);
	cart.setTotal(0);
	cart.setCustomerFirstName("CF9DT");
	cart.setCustomerLastName("Student");
	cart.setCustomerLastName("123 Anywhere St");
	cart.setCity("no");
	cart.setState("ST");
	cart.setPostalCode("0000");	
	entitySave(cart);
	session.cartID = cart.getORDERID();
}
if(structKeyExists(url,"remove")){
	cart.removeItem(entityLoad("ART",url.remove,true));
}
if(structKeyExists(url,"buy")){
	art = entityLoadByPK("ART",URL.buy);
	if(!cart.hasItem(art)){
		cart.addItem(art);
	}
}
cart.setOrderDate(now());
entitySave(cart);
</cfscript>
<cfinclude template="navigation.cfm"/>
<cfoutput>
<h1>Cart</h1>
<table border="1">
	<tr>
		<td>Item</td>
		<td>Price</td>
		<td>Remove</td>
	</tr><cfif isArray(cart.getItem()) AND arrayLen(cart.getItem())><cfloop array="#cart.getItem()#" index="i"> 
	<tr>
		<td>#i.getArtName()#</td>
		<td>#dollarFormat(i.getPrice())#</td>
		<td><a href="cart.cfm?remove=#i.getArtID()#">Remove</a></td>
	</tr></cfloop><cfelse>
	<tr>
		<td colspan="4">No Items In Cart</td>
	</tr></cfif>
</table>
<div>
  <span><a href="art_items.cfm">Items for Sale</a></span>
  &nbsp;
  <span><a href="cart.cfm">Cart</a></span>
</div>

</cfoutput>
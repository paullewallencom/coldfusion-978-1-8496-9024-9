<!--- Example: 2_3.cfm --->
<!--- Processing --->
<cfscript>
objProduct = createObject("component","product_1").init();
objProduct.set_name(name="Egg Plant");
objProduct.set_description(description="A plant with egg like fruit.");
objProduct.set_price(price="2.57");
</cfscript>
<!--- Content --->
<cfoutput>
Name:	#objProduct.get_name()#<br />
Description:	#objProduct.get_description()#<br />
Price:	#objProduct.get_price()#<br />
</cfoutput>
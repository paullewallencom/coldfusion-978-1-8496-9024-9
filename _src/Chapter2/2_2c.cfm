<!--- Example: 2_2d.cfm --->
<!--- Processing --->
<cfscript>
objProduct = createObject("component","product_1").init();
objProduct.set_name(name="Egg Plant");
objProduct.set_description(description="A plant with egg like fruit.");
objProduct.set_price(price="2.57");
myName = objProduct.get_name();
myPrice = objProduct.get_price();
</cfscript>
<!--- Content --->
<cfoutput>
	#myName#<br />
	#objProduct.get_description()#<br />
	#myPrice#
</cfoutput>
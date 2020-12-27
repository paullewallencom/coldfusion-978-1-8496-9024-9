<cfimport prefix="coop" taglib="/share/tags/coop"/>
<cfscript>
_init.txtTwo.style = "color:green;";
_init.txtTwo.value = "Wow, preDOM has the final say!";
</cfscript>
<coop:coop>

	<coop:text id="tstText" value="my text"/>
	<br />
	<coop:button id="tstButton" value="my button"/>
	<br />
	<coop:text id="txtTwo">
	Text inside tag pairs works as the value attribute.
	</coop:text>
	
</coop:coop>
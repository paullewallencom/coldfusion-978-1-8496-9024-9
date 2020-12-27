<cfimport prefix="coop" taglib="/share/tags/coop/"/>
<cfscript>
tst.tstButton.value = "This is my button!";
tst.tstButton.width = 400;
</cfscript>
<coop:coop rootvar="tst">
	<coop:form id="myForm">
		<coop:b id="tstButton" value="my button"/>
	</coop:form>
</coop:coop>
<cfdump var="#_init#">
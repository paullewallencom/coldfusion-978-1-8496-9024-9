<cfimport prefix="coop" taglib="/share/tags/coop"/>
<cfscript>
</cfscript>
<coop:coop>

	<coop:form id="myForm">
		<coop:selectList id="mySelect" label="Select List"
			data="one,two,three,four" selected="three" />
		<coop:submit value="Send Selection"/>
	</coop:form>
	
</coop:coop>

<br />

<cfdump var="#form#">
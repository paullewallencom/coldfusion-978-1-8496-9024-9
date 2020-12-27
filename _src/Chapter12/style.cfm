<cfimport prefix="coop" taglib="/share/tags/coop"/>
<cfscript>
_init.persona.data = "user,designer,developer";
_init.persona.selected = "designer";

_init.altpersona.data = "red,green,blue";

// sos.bufferContent.addHeadContent(type:'css',src:'/share/js/jquery/ui/css/ui.all.css');
/*
sos.bufferContent.addHeadContent(type:'css',content:'<style>
.coopFieldLabel {
	color:green;
}
</style>
');
*/
</cfscript>

<coop:coop>
	<coop:css>
	#myForm .coopFieldLabel {
		color:green;
		text-align:right;
		padding-right:5px;
		float:left;
		width:140px;
	}
	#altForm .coopFieldLabel {
		color:blue;
		text-align:right;
		padding-right:5px;
		float:left;
		width:140px;
	}
	</coop:css>
	
	<coop:form id="myForm" mode="edit">
		<coop:textBox id="firstName" label="First Name" />
		<coop:textBox id="lastName" label="Last Name" />
		<coop:selectList id="persona" label="Persona" />
		<coop:submit value="Submit" />
	</coop:form>

	<hr />
	
	<coop:form id="altForm" mode="edit">
		<coop:textBox id="altfirstName" label="Name (First, Last)" allowBreak="false" />
		<coop:textBox id="altlastName" />
		<coop:selectList id="altpersona" label="Persona" />
		<coop:submit value="Submit" />
	</coop:form>
	
</coop:coop>

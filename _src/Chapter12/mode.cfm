<cfimport prefix="coop" taglib="/share/tags/coop"/>
<cfscript>
_init.myForm.mode="view";
</cfscript>
<coop:coop>

	<coop:form id="myForm">
		<coop:selectList id="myAdd" label="Edit Modes (add)"
			editModes="add"
			data="one,two,three,four" selected="one" />
		<coop:selectList id="myEdit" label="Show Modes (edit,show)"
			showModes="edit,view"
			data="one,two,three,four" selected="two" />
		<coop:selectList id="mySelect" label="Select List"
			data="one,two,three,four" selected="three" />
		<coop:submit value="Send Selection"/>
	</coop:form>
	
</coop:coop>
<cfimport prefix="coop" taglib="/share/tags/coop"/>
<cfscript>
_init.myRadio.data = "animal,vegetable,mineral";
_init.myRadio.selected = "vegetable";
_init.myCheck.data = "red,green,blue";
_init.myCheck.selected = "red,blue";
</cfscript>
<coop:coop>

	<coop:selectList id="mySelect" label="Select List"
		data="one,two,three,four" selected="three" />
	<coop:radioButtonList id="myRadio" label="Radio Button List" />
	<coop:checkBoxList id="myCheck" label="Check Box List" />
	<coop:list id="myList" label="List" data="Apple,Pear,Orange" />
</coop:coop>
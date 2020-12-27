<cfimport prefix="coop" taglib="/share/tags/coop"/>
<cfscript>
_init.myRender_include.data = [
	{
		display = 'Wheat',
		value = 1,
		price = 2.33,
		available = true
	},
	{
		display = 'Rye',
		value = 1,
		price = 2.07,
		available = false
	},
	{
		display = 'White',
		value = 1,
		price = 1.45,
		available = true
	}
];
_init.myRender_module.data = _init.myRender_include.data;
</cfscript>
<coop:coop>

	<coop:form id="myForm">
		<coop:list id="myRender_include" data="Provolone,Swiss,TOFU" renderPath="#_getSiteRootPath()#render/includes/" renderInclude="cheese"/>
		<hr>
		<coop:list id="myRender_module" data="Wheat,Rye,White" renderPath="#_getSiteRootPath()#render/modules/" renderModule="cheese"/>
		<!---<br>
		<coop:list id="myRender_include2" data="" renderPath="#_getSiteRootPath()#render/includes/" renderInclude="cheese" runEmpty="true" />
		<br>
		<coop:list id="myRender_module2" data="" renderPath="#_getSiteRootPath()#render/modules/" renderModule="cheese" runEmpty="true" />
		<br>--->
		<coop:submit value="Send Selection"/>
	</coop:form>
	
</coop:coop>
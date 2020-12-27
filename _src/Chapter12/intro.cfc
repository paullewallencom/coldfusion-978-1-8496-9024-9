<cfcomponent extends="share.objects.coop.coop">

	<cffunction name="beforeViewCall" output="false" access="public">
		
		<cfargument name="init">
		
		<cfscript>
		var _init = arguments.init;
		
		_init.txtTwo.style = "background-color:yellow;";
		_init.txtTwo.value = "This preDOM came from the co-processor.";
		
		return _init;
		</cfscript>
	
	</cffunction>

</cfcomponent>
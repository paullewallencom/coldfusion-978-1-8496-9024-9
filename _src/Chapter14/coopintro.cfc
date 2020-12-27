<cfcomponent extends="share.objects.coop.coop">

	
	<cffunction name="beforeViewCall" 
		description="I am the last of the coop callbacks to get called." 
		displayname="onPostBack"
		 output="false" access="public" returntype="struct">
		
		<cfargument name="init" default="#structNew()#">
		
		<cfscript>
		var _init = arguments.init;
		
		_init.tstButton.style = "color:green;";
		
		return _init;
		</cfscript>
	
	</cffunction>

</cfcomponent>
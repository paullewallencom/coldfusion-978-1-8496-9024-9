<cfcomponent output="false">
	// This is purely a MIXIN method.
	<cffunction name="inject" access="public" output="false"></cffunction>
	
	// These are the script methods.
	<cffunction name="_abort" output="false" access="public">
		<cfargument name="showError" required="false" default="">
		
		<cfif arguments.showError NEQ ''>
			<cfabort showerror="#arguments.showError#">
		<cfelse>
			<cfabort>
		</cfif>
	</cffunction>
	
	<cffunction name="_argument" output="false" access="public">
		<cfargument name="name" required="true">
		<cfargument name="args" required="true">
		<cfargument name="default" requred="false" default="">
		<cfargument name="required" required="false" default="false">
		<cfif structKeyExists(arguments.args,arguments.name)>
			<cfif isSimpleValue(arguments.args[arguments.name]) AND arguments.args[arguments.name] EQ ''>
				<cfset arguments.args[arguments.name] = arguments.default>
			</cfif>
		<cfelse>
			<cfif arguments.required>
				<cfthrow detail="Missing required attribute: #arguments.name#">
			<cfelseif arguments.default NEQ ''>
				<cfset arguments.args[arguments.name] = arguments.default>
			</cfif>
		</cfif>
		<cfreturn arguments.args>
	</cffunction>
	
	<cffunction name="_dump" output="true" access="public">
		<cfargument name="var">
		<cfargument name="label" required="false" default="">
		<cfargument name="expand" default="true" required="false">
		<cfargument name="abort" default="false" required="false">
		<cfscript>
			if ( isSimpleValue(arguments.var)) {
				writeOutput("<br/> " & arguments.label & ": ");
			}
		</cfscript>
		<cfdump var="#arguments.var#" label="#arguments.label#" expand="#arguments.expand#">
		<cfif arguments.abort>
			<cfabort>
		</cfif>
	</cffunction>
	
	<cffunction name="_htmlHead" output="false" access="public">
		<cfargument name="text" required="true">
		
		<cfHtmlHead text="#arguments.text#">
	</cffunction>
	
	<cffunction name="_include" output="true" access="public">
		<cfargument name="template" required="true">
		
		<cfinclude template="#arguments.template#">
	</cffunction>
	
	<cffunction name="_location" output="false" access="public">
		<cfargument name="url" required="true">
		<cfargument name="addtoken" default="false">
		<cfargument name="type" default="cf">
		<cfargument name="typeTarget" default="">
		
		<cfscript>
		var locationScript = "";
		var myContent = "";
		
		if(arguments.type EQ "cfajax"){
			if(NOT structKeyExists(arguments,"typeTarget"))
				_throw(
					message:"Missing type target argument",
					detail:"When using _location() with type of 'cfajax' it must have a declared argument for typeTarget. This tells which AJAX dom element ID to target the content towards."
				);
			_htmlHead('
				<script language="javascript" type="text/javascript">
				ColdFusion.navigate("#arguments.url#", "#arguments.typeTarget#");
				</script>
			');
			_abort();
		} else if(arguments.type EQ "js") {
			_htmlHead('
				<script language="javascript" type="text/javascript">
				document.location.href = "#arguments.url#";
				</script>
			');
			_abort();
		}
		</cfscript>
		<cflocation url="#arguments.url#" addtoken="#arguments.addtoken#">
		<cfabort>
	</cffunction>
	
	<cffunction name="_param" output="false" access="public">
		<cfargument name="struct" required="true">
		<cfargument name="named" required="true">
		<cfargument name="value" default="">
		
		<cfscript>
		if(not structKeyExists(arguments.struct,arguments.named)) 
			arguments.struct[arguments.named]=arguments.value;
	    return arguments.struct;
		</cfscript>
	</cffunction>

	<cffunction name="_rethrow" output="true" access="public">
	   <cftry>
	      <cfcatch>
	      <cfrethrow>
	      </cfcatch>
	   </cftry>
	   <cfthrow type="Context validation error" message="Context validation error for CFRETHROW.">
	</cffunction>
	
	<cffunction name="_routeArguments" output="false" access="public">
		<cfargument name="routeList">
		<cfargument name="argStruct">

		<cfscript>
		var myArg = '';
		var myArgName = '';
		var argList = structKeyList(arguments.argStruct);
		var cntArgs = listLen(argList);
		var iArg = 0;
		var minKey = 0;
		var maxKey = 0;
		var cntRoute = listLen(routeList);
		var iRoute = 0;
		var returnArgs = structNew();
		var myValue = "";

		for(iArg=1; iArg LTE cntArgs; iArg = iArg + 1){
			myValue = listGetAt(argList,iArg);
			if(isNumeric(myValue)){
				if(myValue LT minKey OR minKey EQ 0){
					minKey = myValue;
				}
				if(myValue GT maxKey OR maxKey EQ 0){
					maxKey = myValue;
				}
			} else {
				returnArgs[myValue] = arguments.argStruct[myValue];
			}
		}
		if(minKey NEQ 0){
			for(iArg=minKey; iArg LTE maxKey; iArg = iArg + 1){
				iRoute = iArg - minKey + 1;
				if(iRoute LTE cntRoute){
					returnArgs[listGetAt(arguments.routeList,iRoute)] = arguments.argStruct[iArg];
				}
			}
		}
		
		
		return returnArgs;
		</cfscript>

	</cffunction>
	
	<cffunction name="_throw" output="true" access="public">
		<cfargument name="message" required="true">
		<cfargument name="detail" required="false" default="">
		<cfargument name="errorCode" required="false" default="">
		<cfargument name="extendedInfo" required="false" default="">
		<cfargument name="object" required="false" default="">
		<cfargument name="type" required="false" default="">
		<cfthrow message="#arguments.message#" detail="#arguments.detail#" errorcode="#arguments.errorCode#" extendedInfo="#arguments.extendedInfo#" type="#arguments.type#">
	</cffunction>
	
</cfcomponent>
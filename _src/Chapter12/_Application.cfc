<cfcomponent>

	<cfinclude template="_site/includes/_shortsession.cfm">
	
	<cffunction name="_defaults">
		<cfscript>
		REQUEST._site.application.length = {
			days = 0,
			hours = 0,
			minutes = 60,
			seconds = 0
		};
		REQUEST._site.session.length = {
			days = 0,
			hours = 0,
			minutes = 30,
			seconds = 0
		};
		</cfscript>
	</cffunction>
	
	<cffunction name="_init">
		<cfscript>
		if(REQUEST._api.hasSession){
			// session settings
			THIS.sessionManagement = true;
			THIS.sessionTimeout = _setTimeSpan(REQUEST._site.session.length);
			// client settings
			THIS.clientManagement = true;
			THIS.clientStorage = "cookie";
			// cookie settings
			THIS.setClientCookies = true;
			THIS.setDomainCookies = true;
		} else {
			// This application definition is for short sessions.
			// session settings
			THIS.sessionManagement = false;
			// client settings
			THIS.clientManagement = false;
			// cookie settings
			THIS.setClientCookies = false;
			THIS.setDomainCookies = false;
		}
		
		</cfscript>
		<cftry>
		<cfscript>
		THIS.applicationTimeout = _setTimeSpan(REQUEST._site.application.length);
		
		THIS.name = "#listRest(cgi.server_name,".")##REQUEST._temp.privateKey##REQUEST._temp.appNameMinor#";
		</cfscript>
			<cfcatch>
		<cfdump var="#REQUEST#">
		<cfdump var="#cfcatch#">
		<cfabort>
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="onApplicationStart">
		<cfscript>
		APPLICATION.__cfish = createObject("component","share.skins.objects.cfish").init(skin:REQUEST._temp.skin);
		
		APPLICATION.__cache.sosContent.cacheMap = _include("_site/includes/_sosContentCacheMap.cfm");
		
		APPLICATION.__CACHE = structNew();
		APPLICATION.__CACHE["site"] = structNew();
		</cfscript>
	</cffunction>
	
	<cffunction name="onSessionStart">
		<cfscript>
		var device = createObject("component","share.objects.sos.device")
				.init();
		
		SESSION.__CACHE = structNew();
		SESSION.__CACHE["site"] = structNew();
		</cfscript>
	</cffunction>
	
	<cffunction name="onRequestStart">
		<cfscript>
		structDelete(REQUEST,"_temp");
		
		if(listLast(CGI.SCRIPT_NAME,".")=="cfc"){
			REQUEST.__remote = true;
			structDelete(VARIABLES,"onRequest");
			structDelete(THIS,"onRequest");
			VARIABLES.remoted = true;
		} else {
			REQUEST.__remote = false;
		}
		structDelete(THIS,"_init");
		structDelete(VARIABLES,"_init");
		</cfscript>
	</cffunction>
	
	<cffunction name="onRequest">
		<cfscript>
		ATTRIBUTES = {};
		structAppend(ATTRIBUTES,URL);
		structAppend(ATTRIBUTES,FORM);
		
		_api = {
			cfish = createObject("component","share.skins.objects.cfish").init("sosensible").initRequest()
		};
		sos = {
			content = "",
			bufferContent = createObject("component","share.objects.sos.sosContent")
		};
		sos.content = _include(cgi.SCRIPT_NAME);
		
		if(!REQUEST.__remote){
			writeOutput(_include('_layout.cfm'));
		}
		</cfscript>
	</cffunction>
	
	<cffunction name="onRequestEnd">
		<!--- add code as needed --->
	</cffunction>
	
	<cffunction name="_include" access="public" returntype="string">
		<cfargument name="template">
		<cfset var includeContent = "">
		<cfsavecontent variable="includeContent"><cfinclude template="#ARGUMENTS.template#"></cfsavecontent>
		<cfreturn includeContent>
	</cffunction>
	
	<cffunction name="_setTimeSpan" output="false">
		<cfargument name="ts">
		
		<cfreturn createTimeSpan(ARGUMENTS.ts.days,ARGUMENTS.ts.hours,ARGUMENTS.ts.minutes,ARGUMENTS.ts.seconds)>
	</cffunction>
	
	<cfscript>
	function _getSlash() {
		var script = replace(getFileFromPath(CGI.SCRIPT_NAME),"/","\","ALL");
		return right(replaceNoCase(CGI.PATH_TRANSLATED, script, "", "ALL"),1);
	}
	
	function _getServerRootDirectory() {
		var currentPath = replace(CGI.SCRIPT_NAME,"/","\","ALL");
		return replaceNoCase(CGI.PATH_TRANSLATED, currentPath, "", "ALL") & _getSlash();
	}
	
	function _getSiteRootPath(){
		var arrServer = listToArray(_getServerRootDirectory(),"\/");
		var arrSite = "";
		var lenSite = 0;
		var arrRel = [];
		var i = 0;
		
		arrSite = listToArray(getdirectoryfrompath(getcurrenttemplatepath()),"\/");
		lenSite = arraylen(arrSite);
		
		for (i = 1; i <= arraylen(arrServer); i++) {
			if (comparenocase(arrServer[i],arrSite[i])) {
				if (i lte lenSite) { ArrayAppend(arrRel,arrSite[i]); }
			}
		}
		
		for (; i <= arraylen(arrSite); i++) {
			ArrayAppend(arrRel,arrSite[i]);
		}
		
		return "/#arrayToList(arrRel,"/")#/";
	}
	
	function _getSiteRootClassPath(){
		var arrServer = listToArray(_getServerRootDirectory(),"\/");
		var arrSite = "";
		var lenSite = 0;
		var arrRel = [];
		var i = 0;
		
		arrSite = listToArray(getdirectoryfrompath(getcurrenttemplatepath()),"\/");
		lenSite = arraylen(arrSite);
		
		for (i = 1; i <= arraylen(arrServer); i++) {
			if (comparenocase(arrServer[i],arrSite[i])) {
				if (i lte lenSite) { ArrayAppend(arrRel,arrSite[i]); }
			}
		}
		
		for (; i <= arraylen(arrSite); i++) {
			ArrayAppend(arrRel,arrSite[i]);
		}
		
		return "#arrayToList(arrRel,".")#.";
	}
	</cfscript>
</cfcomponent>
<cffunction name="onRequestStart">
	<cfscript>
	/*
	add logic to cancel issues caused by CFC call.
	*/
	
	if(listLast(CGI.SCRIPT_NAME,".")=="cfc"){
		REQUEST.__remote = true;
		structDelete(VARIABLES,"onRequest");
		structDelete(THIS,"onRequest");
		VARIABLES.remoted = true;
	} else {
		REQUEST.__remote = false;
	}
	</cfscript>
</cffunction>

<cffunction name="onRequest">
	<cfscript>
	ATTRIBUTES = {};
	structAppend(ATTRIBUTES,URL);
	structAppend(ATTRIBUTES,FORM);
	me = getCurrentTemplatePath();
	you = getBaseTemplatePath();
	dif = getRelative(you);
	rel = 
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
</cffunction>

<cffunction name="_include" access="public" returntype="string">
	<cfargument name="template">
	<cfset var includeContent = "">
	<cfsavecontent variable="includeContent"><cfinclude template="#ARGUMENTS.template#"></cfsavecontent>
	<cfreturn includeContent>
</cffunction>

<cfscript>
/**
* Retrieves the url for the current directory in full or relative format.
*
* @param pathType      Format to return the path in. Valid values are 'full' and 'relative'. Returns the text string 'invalid paramter' if the parameter is not 'full' or 'relative'. Default value for the parameter is 'relative'.
* @return Returns a string.
* @author Spike (spike@spike.org.uk)
* @version 1, October 9, 2001
*/
function GetHTTPDir() {
var format = "";
    if (arraylen(arguments)) {
     format = arguments[1];
        if (format EQ 'full') {
            return "http://#cgi.server_name##listDeleteAt(cgi.script_name,listlen(cgi.script_name,'/'),'/')#/";
        }
        else if (format EQ 'relative') {
            return "#listDeleteAt(cgi.script_name,listlen(cgi.script_name,'/'),'/')#/";
        }
        else {
            return 'invalid argument';
        }
    }
    else {
        return "#listDeleteAt(cgi.script_name,listlen(cgi.script_name,'/'),'/')#/";
    }
}

/**
* Returns a relative path from the current template to an absolute file path.
*
* @param abspath      Absolute path. (Required)
* @return Returns a string.
* @author Isaac Dealey (info@turnkey.to)
* @version 1, May 2, 2003
*/
function getRelative(abspath) {
    var aHere = listtoarray(getdirectoryfrompath(getcurrenttemplatepath()),"\/");
    var aThere = ""; var lenThere = 0;
    var aRel = ArrayNew(1); var x = 0;
    var newpath = "";
    
    aThere = ListToArray(abspath,"\/"); lenThere = arraylen(aThere);
    
    for (x = 1; x lte arraylen(aHere); x = x + 1) {
        if (x GT lenThere OR comparenocase(aHere[x],aThere[x])) {
            ArrayPrepend(aRel,".."); if (x lte lenThere) { ArrayAppend(aRel,aThere[x]); }
        }
    }
    
    for (; x lte arraylen(aThere); x = x + 1) { ArrayAppend(aRel,aThere[x]); }
    
    newpath = ArrayToList(aRel,"/");

    return newpath;
}

/**
* Returns a relative path from the current template to an absolute file path.
*
* @param abspath      Absolute path. (Required)
* @return Returns a string.
* @author Isaac Dealey (info@turnkey.to)
* @version 1, May 2, 2003
*/
function getRelativePath(abspath) {
    var aHere = listtoarray(getdirectoryfrompath(getcurrenttemplatepath()),"\/");
    var aThere = ""; var lenThere = 0;
    var aRel = ArrayNew(1); var x = 0;
    var newpath = "";
    
    aThere = ListToArray(abspath,"\/"); lenThere = arraylen(aThere);
    
    for (x = 1; x lte arraylen(aHere); x = x + 1) {
        if (x GT lenThere OR comparenocase(aHere[x],aThere[x])) {
            ArrayPrepend(aRel,".."); if (x lte lenThere) { ArrayAppend(aRel,aThere[x]); }
        }
    }
    
    for (; x lte arraylen(aThere); x = x + 1) { ArrayAppend(aRel,aThere[x]); }
    
	if(arrayLen(aRel)>0){
		arrayDeleteAt(aRel,arrayLen(aRel));
	}
	
    newpath = ArrayToList(aRel,"/") & "/";

    return newpath;
}

function _getSlash() {
	var script = replace(getFileFromPath(CGI.SCRIPT_NAME),"/","\","ALL");
	return right(replaceNoCase(CGI.PATH_TRANSLATED, script, "", "ALL"),1);
}

function _getServerRootDirectory() {
	var currentPath = replace(CGI.SCRIPT_NAME,"/","\","ALL");
	return replaceNoCase(CGI.PATH_TRANSLATED, currentPath, "", "ALL") & _getSlash();
}

function _getAbsPathTo(to){
    var arrFrom = listtoarray(_getServerRootDirectory(),"\/");
	var cntFrom = arrayLen(arrFrom);
    var arrTo = listToArray(ARGUMENTS.to,"\/");
	var cntTo = arraylen(arrTo);
    var arrRel = [];
	var i = 0;
    
    for (i = 1; i <= arraylen(arrTo); i = i + 1) {
        if (i > cntFrom || comparenocase(arrTo[i],arrFrom[i])) {
			if (i lte cntTo) { ArrayAppend(arrRel,arrTo[i]); }
        }
    }
    
    for (; i <= arraylen(arrTo); i = i + 1) {
		ArrayAppend(arrRel,arrTo[i]);
	}
	
    return '/#arrayToList(arrRel,"/")#';
}

function _getSiteRootPath(){
    var arrServer = listToArray(_getServerRootDirectory(),"\/");
    var arrSite = "";
	var lenSite = 0;
    var arrRel = [];
	var x = 0;
    
    arrSite = listToArray(getdirectoryfrompath(getcurrenttemplatepath()),"\/");
	lenSite = arraylen(arrSite);
    
    for (x = 1; x <= arraylen(arrServer); x = x + 1) {
        if (x > lenSite || comparenocase(arrServer[x],arrSite[x])) {
            ArrayPrepend(arrRel,"..");
			if (x lte lenSite) { ArrayAppend(arrRel,arrSite[x]); }
        }
    }
    
    for (; x <= arraylen(arrSite); x = x + 1) {
		ArrayAppend(arrRel,arrSite[x]);
	}
    
	if(arrayLen(arrRel)>0){
		arrayDeleteAt(arrRel,arrayLen(arrRel));
	}
	
    return "/#arrayToList(arrRel,"/")#/";
}
</cfscript>
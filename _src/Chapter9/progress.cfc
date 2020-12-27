<cfcomponent>
 
<cffunction name="getStatus" returnType="struct" access="remote">
	<cfscript>
	var strRet = {};
	var span = 0;
	var duration = 15;

	if(!structKeyExists(server,"progress")){
		server.progress = now();
	}
	strRet.span = abs(dateDiff('s',server.progress,now()));
	strRet.status = min(1,strRet.span/duration);
	if(strRet.status >= 1) {
		strRet.message = "... complete ...";
		structDelete(server,"progress");
	} else if(strRet.status > 0){
		strRet.message = "...working (#round(strRet.status*100)#%) complete...";
	} else {
		strRet.message = "...process starting...";
	}
	
	return strRet;
	</cfscript>
</cffunction>

</cfcomponent>
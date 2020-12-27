<cfcomponent output="false">
	<cffunction name="getNodes" returntype="array" output="false" access="remote">
		<cfargument name="nodeitemid" required="true">
		<cfargument name="nodeitempath" required="true">
		
		<cfscript>
		var myReturn = arrayNew(1);
		var myElement = structNew();
		
		if(arguments.nodeitemid == ""){
			arguments.nodeitemid = 0;
		}
		
		myElement.value = arguments.nodeitemid + 1;
		myElement.display = "Node #nodeitemid#";
		myReturn[1] = myElement;
		
		return myReturn;
		</cfscript>
		
	</cffunction>
	
	<cffunction name="getDir" returntype="array" output="false" access="remote">
		<cfargument name="nodeitempath" required="true">
		<cfargument name="nodeitemvalue" required="true">
		
		<cfscript>
		var myReturn = arrayNew(1);
		var myElement = structNew();
		var myPath = getDirectoryFromPath(GetCurrentTemplatePath());
		var mySlash = right(myPath,1);
		var myDir = "";
		var myValue = "";
		var i = 0;
		
		if(arguments.nodeitemvalue NEQ ""){
			myValue = "#mySlash##arguments.nodeitemvalue#";
			myValue = replace(myValue,"#mySlash##mySlash#","#mySlash#","ALL");
			myPath = "#myPath##arguments.nodeitemvalue#";
		}
		arguments.nodeitemvalue = replace(arguments.nodeitemvalue,"#mySlash##mySlash#","#mySlash#","ALL");
		myDir = getPathDirectory("#myPath#");
		
		for(i=0;i <= myDir.recordCount; i++){
			if(len(myDir.type[i])){
				myElement = structNew();
				if(myDir.type[i] == "file"){
					myElement.leafnode = true;
					myElement.img = "document";
					myElement.href = "javascript:alert('This would select the file (#myDir.name[i]#)')";
					myElement.value = "#myDir.name[i]#";
				} else {
					myElement.leafnode = false;
					myElement.img = "folder";
					myElement.value = "#myValue##mySlash##myDir.name[i]#";
				}
				myElement.display = "#myDir.name[i]#";
				arrayAppend(myReturn,myElement);
			}
		}

		return myReturn;
		</cfscript>
	</cffunction>
	
	<cffunction name="getPathDirectory" output="false" access="private">
		<cfargument name="path" required="true">
		<cfset var myReturn = "">
		
		<cfdirectory action="list" directory="#arguments.path#" name="myReturn" sort="asc">
		<cfquery dbtype="query" name="myReturn">
		SELECT *
		FROM myReturn
		ORDER BY type
		</cfquery>
		<cfreturn myReturn>
	</cffunction>
</cfcomponent>
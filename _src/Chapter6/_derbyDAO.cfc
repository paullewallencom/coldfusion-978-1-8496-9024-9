<cfcomponent output="false">
	<!--- MUST BE INCLUDED
	<cffunction name="init" output="false">
		<cfargument name="dsn">
		
		<cftry>
		<cfscript>
		variables.fields = 'active,authCheck,authExp_on,created_on,email,password,passwordAnswer,passwordQuestion,suspend,suspendReason,system,updated_on,user_id,user_main';
		variables.defaults = '1,@@,@@,##now()##,,@@,@@,@@,@@,0,@@,0,##now()##,0,@@';
		variables.pkey = 'user_id';
		variables.required = 'email,password,user_main';
		variables.numeric = 'active,suspend,system,user_id';
		variables.autoUpdate = 'updated_on';
		variables.table = 'users';
		variables.dsn = arguments.dsn;
		setRecord();
		
		return this;
		</cfscript>
			<cfcatch><cfdump var="#cfcatch#"><cfabort></cfcatch>
		</cftry>
	</cffunction>
	 --->
	
	// This is purely a MIXIN method.
	<cffunction name="inject" access="public" output="false"></cffunction>
	
	<cffunction name="isClean" access="public" output="false">
		<cfreturn variables.isClean>
	</cffunction>
	
	<cffunction name="setRecord" access="private" output="false">
		<cfargument name="rs" default="#queryNew(variables.fields)#">
		
		<cfscript>
		var iField = 0;
		var field = "";

		variables.data = structNew();
		for(iField=1; iField LTE listLen(variables.fields); iField=iField + 1){
			field = listGetAt(variables.fields,iField);
			if(rs.recordCount EQ 0){
				variables.data[field] = getDefault(field);
			} else {
				variables.data[field] = rs[field];
			}
		}
		
		variables.clean = true;
		</cfscript>

	</cffunction>
	
	<cffunction name="getDefault" access="private" output="false">
		<cfargument name="field" required="true">
		
		<cfscript>
		var myDefault = listGetAt(variables.defaults,listFind(variables.fields,arguments.field));
		var retDefault = "";
		
		if(field EQ variables.pkey){
			retDefault = 0;
		} else if(myDefault NEQ "@@"){
			retDefault = evaluate("#myDefault#");
		}
		
		return retDefault;
		</cfscript>
	</cffunction>
	
	<cffunction name="set" output="false">
		<cfargument name="field" required="true">
		<cfargument name="value" required="true">
		
		<cfscript>
		var iField = 0;
		var myField = "";
		
		if(variables.data[arguments.field] NEQ arguments.value){
			variables.data[arguments.field] = arguments.value;
			for(iField=1; iField LTE listLen(variables.autoUpdate); iField++){
				myField = listGetAt(variables.autoUpdate,iField);
				variables.data[myField] = getDefault(myField);
			}
			variables.clean = false;
		}
		</cfscript> 
	</cffunction>
	
	<cffunction name="get" output="false">
		<cfargument name="field" required="false" default="*">
		
		<cfscript>
		var mySimple = "";
		
		if(arguments.field EQ "*"){
			return variables.data;
		} else {
			if(structKeyExists(variables.data,arguments.field)){
				mySimple =  variables.data[arguments.field];
				return mySimple;
			} else {
				return "";
			}
		}
		</cfscript>
	</cffunction>
	
	<cffunction name="get_pkey" access="public" output="false">
		<cfscript>
		var mySimple = variables.data[variables.pkey];
		
		return mySimple;
		</cfscript>
	</cffunction>
	
	<cffunction name="getRecords" access="public" output="false">
		<cfargument name="where" required="false" default="">
		<cfargument name="order" required="false" default="">
		
		<cfset var rsRecords="">
		
		<cfquery name="rsRecords" datasource="#variables.dsn#">
		SELECT *
		FROM #variables.table#<cfif arguments.where NEQ "">
		WHERE 1 = 1
			AND #arguments.where#</cfif><cfif arguments.order NEQ "">
		ORDER BY
			#arguments.order#</cfif>
		</cfquery>
		
		<cfreturn rsRecords>
	
	</cffunction>
	
	<cffunction name="loadRecord" access="public" output="false">
		<cfargument name="id" default="0">
		
		<cfscript>
		setRecord(getRecords(where:"#variables.pkey# = #arguments.ID#"));
		
		return get_pkey();
		</cfscript>

	</cffunction>
	
	<cffunction name="setRecordStruct" access="public" output="false">
		<cfargument name="myStruct">
		
		<cfscript>
		var fields = structKeyList(arguments.myStruct);
		
		variables.data = structNew();
		for(iField=1; iField LTE listLen(fields); iField=iField + 1){
			variables.data[listGetAt(fields,iField)] = arguments.myStruct[listGetAt(fields,iField)];
		}
		</cfscript>
		
	</cffunction>
	
	<cffunction name="save" access="public" output="false">
		<cfscript>
		var myResult = variables.data[variables.pkey];
		
		if(variables.data[variables.pkey] EQ 0){
			myResult = insertRecord();
		} else {
			updateRecord();
		}
		
		return myResult;
		</cfscript>
	</cffunction>
	
	<cffunction name="isEntryField" access="private" output="false">
		<cfargument name="field" required="true">
		
		<cfscript>
		if(arguments.field NEQ variables.pkey AND structKeyExists(variables.data,arguments.field)){
			return true;
		} else {
			return false;
		}
		</cfscript>
	</cffunction>
	
	<cffunction name="isNumFld" access="private" output="false">
		<cfargument name="field" required="true">
		
		<cfscript>
		if(listFind(variables.numeric,arguments.field)){
			return true;
		} else {
			return false;
		}
		</cfscript>
		
	</cffunction>
	
	<cffunction name="getStoreFields" access="private" output="false">
		<cfscript>
		var iField = "";
		var listFields = "";
		</cfscript>
		
		<cfloop index="iField" list="#variables.fields#">
			<cfif isEntryField(iField)>
				<cfset listFields = listAppend(listFields,iField)>
			</cfif>
		</cfloop>
		
		<cfreturn listFields>
	</cffunction>
	
	<cffunction name="insertRecord" access="private" output="true">
		<cfscript>
		var rs = "";
		var iField = "";
		var id = "";
		var counter = 0;
		var myQuery = "";
		var listFields = getStoreFields();
		</cfscript>
		<cftry>

		<cfsavecontent variable="myQuery">
		SELECT * FROM #variables.table#
		WHERE<cfloop index="iField" list="#listFields#"><cfif counter++>,</cfif>
			#iField# = <cfif isNumFld(iField)>#variables.data[iField]#<cfelse>'#variables.data[iField]#'</cfif></cfloop>
		</cfsavecontent><cfset counter = 0>
		<cfquery name="rs" datasource="#variables.dsn#">
		INSERT INTO #variables.table#
		(<cfloop index="iField" list="#listFields#"><cfif counter++>,</cfif>
			#iField#</cfloop>
		)
		VALUES<cfset counter = 0>
		(<cfloop index="iField" list="#listFields#"><cfif counter++>,</cfif>
			<cfif isNumFld(iField)>#variables.data[iField]#<cfelse>'#variables.data[iField]#'</cfif></cfloop>
		)
		</cfquery>
		
		<cfquery name="rs" datasource="#variables.dsn#"><cfset counter = 0>
		SELECT * FROM #variables.table#
		WHERE<cfloop index="iField" list="#listFields#"><cfif counter++> AND </cfif>
			#iField# = <cfif isNumFld(iField)>#variables.data[iField]#<cfelse>'#variables.data[iField]#'</cfif></cfloop>
		</cfquery>
		
		<cfscript>
		variables.data[variables.pkey] = rs[variables.pkey];
		
		return get_pkey();
		</cfscript>
			<cfcatch>
				<cfdump var="#myquery#">
				<cfdump var="#cfcatch#">
				<cfabort>
			</cfcatch>
		</cftry>
	
	</cffunction>
	
	<cffunction name="updateRecord" access="private" output="false">
		<cfscript>
		var rs="";
		var counter = 0;
		var iField = "";
		var listFields = getStoreFields();
		</cfscript>
		
		<cfquery name="rs" datasource="#variables.dsn#">
		UPDATE #variables.table#
		SET<cfloop index="iField" list="#listFields#"><cfif counter++>,</cfif>
			#iField# = <cfif isNumFld(iField)>#variables.data[iField]#<cfelse>'#variables.data[iField]#'</cfif></cfloop>
		WHERE #variables.pkey# = #get_pkey()#
		</cfquery>
	
	</cffunction>
	
	<cffunction name="getBaseRs" access="private" output="false">
		<cfscript>
		var rs="";
		</cfscript>
		
		<cfquery name="rs" datasource="#variables.dsn#">
		SELECT top 1 FROM #variables.table#;
		</cfquery>
	</cffunction>

</cfcomponent>
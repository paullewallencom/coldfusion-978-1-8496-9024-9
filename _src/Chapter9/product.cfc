<cfcomponent output="false" extends="_sdo">

	<!--- Constructor Methods --->
	<cffunction name="init" access="public" output="false">
		<cfargument name="dsn" required="true">
		<cfargument name="id" default="0">
		
		<cfscript>
		variables.field.name = "id,name,description,price,section,sale";
		variables.field.defaults = "0,'','',0,'',0";
		variables.field.allowNull = "0,0,0,0,0,0";
		variables.table = "product";
		variables.pKeyField = "id";
		variables.pKeyNew = 0;
		variables.pKeyType = "autoInteger";
		variables.dsn = arguments.dsn;
		setDefaults();
		</cfscript>
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getGridRecordSet" access="remote" returntype="struct" output="false">
		<cfargument name="page" type="numeric" required="yes">
		<cfargument name="pageSize" type="numeric" required="yes">
		<cfargument name="gridSortColumn" type="string" required="no" default="">
		<cfargument name="gridSortDirection" type="string" required="no" default="">
		
		<cfscript>		
		init('cfbootcamp');
		
		return super.getGridRecordSet(
				page:arguments.page,
				pageSize:arguments.pageSize,
				gridSortColumn:arguments.gridSortColumn,
				gridSortDirection:arguments.gridSortDirection
			);
		</cfscript>
		
	</cffunction>
	
	<cffunction name="updateRow" access="remote" output="false">
		<cfargument name="action" type="string" required="yes">
		<cfargument name="row" type="struct" required="yes">
		<cfargument name="changed" type="struct" required="yes">
		
		<cfscript>
		var fields = "";
		var field = "";
		var value = "";	
		init('cfbootcamp');
		</cfscript>

		<cfswitch expression="#arguments.action#">
		   <!--- Process updates --->
		   <cfcase value="U">
		      <!--- Get column field and value --->
		      <cfset fields=StructKeyList(arguments.changed)>
		      <cfset field=ListFirst(fields)>
		      <cfset value=arguments.changed[field]>
		      <!--- Perform actual update --->
		      <cfquery datasource="#variables.dsn#">
		      UPDATE #variables.table#
		      SET #field# = <cfqueryparam value="#value#">
		      WHERE #variables.pKeyField# = #arguments.row[variables.pKeyField]#
		      </cfquery>
		   </cfcase>
		   <!--- Process deletes --->
		   <cfcase value="D">
		      <!--- Perform actual delete --->
		      <cfquery datasource="#variables.dsn#">
		      DELETE FROM #variables.table#
		      where #variables.pKeyField# = #arguments.row[variables.pKeyField]#
		      </cfquery>
		   </cfcase>
		</cfswitch>

		<cfreturn value />
	</cffunction>
	
</cfcomponent>
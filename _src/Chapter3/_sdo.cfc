<cfcomponent output="false">

	<!--- Constructor Methods --->
	<!--- *** This method should be created in data object.
	<cffunction name="init" access="public" output="false">
		<cfargument name="dsn" required="true">
		<cfargument name="id" default="0">
		
		<cfscript>
		variables.field.name = ""; // This is a list of the table fields.
		variables.field.defaults = ""; // This is a list of the field default values.
		variables.field.allowNull = ""; // This is a list of the fields nullable status.
		variables.table = ""; // This is the table name for the object data source.
		variables.pKeyField = ""; // This is the primary key field for the table.
		// variables.pKeyNew //  This is the new record trigger field value for new records;
		variables.pKeyType = ""; // uuid |autoInteger|custom
		variables.dsn = arguments.dsn;
		setDefaults();
		</cfscript>
		<cfreturn this />
	</cffunction>
	 --->
	
	<!--- Public Methods --->
	<cffunction name="get" access="public" output="false">
		<cfargument name="attribute" required="true">
		
		<cfset var myReturn = "">

		<cfif listContainsNoCase(variables.field.name,arguments.attribute)>
			<cfif structKeyExists(variables.attribute,arguments.attribute)>
				<cfset myReturn = variables.attribute[arguments.attribute] />
			</cfif>
		</cfif>

		<cfreturn myReturn>
		
	</cffunction>
	
	<cffunction name="load" access="public" output="false">
		<cfargument name="id" required="false" />
		
		<cfscript>
		var myReturn = getRecordset(where = "id = #arguments.id#");
		setAttributes(myReturn);
		</cfscript>
		
		<cfreturn myReturn />
	</cffunction>
	
	<cffunction name="save" access="public" output="false">
		<cfscript>
		var myReturn = structNew();
		
		myReturn.success = false;
		myReturn.message = "";
		
		validateData();
		
		if(variables.attributes[variables.pKeyField] == variables.pKeyNew){
			myReturn = insertData();
		} else {
			myReturn = updateData();
		}
		</cfscript> 
		<cfreturn myReturn>
	</cffunction>
	
	<cffunction name="saveStruct" access="public" output="false">
		<cfargument name="form" required="true" type="struct">
		
		<cfscript>
		var iField = "";
		var myReturn = structNew();
		
		myReturn.success = false;
		myReturn.message = "";
		</cfscript>
		<cfloop list="#variables.field.name#" index="iField">
			<cfif structKeyExists(arguments.form,iField)>
				<cfset variables.attributes[iField] = arguments.form[iField]>
			</cfif>
		</cfloop>
		<cfset myReturn = save()>
		
		<cfreturn myReturn>
	</cffunction>
	
	<cffunction name="set" access="public" output="false">
		<cfargument name="attribute" required="true">
		<cfargument name="value" required="true">
		
		<cfset variables.attribute[argument.attribute] = arguments.value>
	</cffunction>
	
	<!--- Private Methods --->
	<cffunction name="setAttributes" access="private" output="false">
		<cfargument name="record" required="true">
		
		<cfscript>
		var i = 0;
		var field = "";
		if(arguments.record.recordCount == 0){
			setDefaults();
		} else {
			for(i=1;i LTE listLen(variables.field.name);i++){
				field = listGetAt(variables.field.name,i);
				variables.attribute[field] = arguments.record[field];
			}
		}
		</cfscript>
	</cffunction>
	
	<cffunction name="setDefaults" access="private" output="false">
		<cfset var iAttr = 0>
		
		<cfif NOT structKeyExists(variables,"attribute")>
			<cfset variables.attribute = structNew()>
		</cfif>
		<cfloop list="#variables.field.name#" index="iAttr">
			<cfscript>
			variables.attribute[iAttr] = setDefault(iAttr);
			</cfscript>
		</cfloop>
		
	</cffunction>
	
	<cffunction name="setDefault" access="private" output="false">
		<cfargument name="field" required="true">
		
		<cfscript>
		var myReturn = "";
		var myDefault = "";
		var myPosition = listFindNoCase(variables.field.name,arguments.field);
		if(myPosition){
			myDefault = listGetAt(variables.field.defaults,myPosition);
			switch(myDefault){
				case "''": {
					myReturn = "";
					break;
				}
				case "@@uuid@@": {
					myReturn = createUUID();
					break;
				}
				default: {
					myReturn = myDefault;
				}
			}
		}
		</cfscript>
		
		<cfreturn myReturn>
	</cffunction>

	<!--- Data Methods --->
	<cffunction name="deleteData" access="public" output="false">
		<!--- If primary key empty then do not execute. --->
	</cffunction>
	
	<cffunction name="getRecordset" access="public" output="false">
		<cfargument name="fields" default="#variables.field.name#" />
		<cfargument name="where" default="" />
		<cfargument name="order" default="" />
		
		<cfscript>
		var rsReturn = "";
		</cfscript>
		
		<cfquery datasource="#variables.dsn#" name="rsReturn">
		SELECT 
			#arguments.fields#
		FROM
			#variables.table#<cfif arguments.where NEQ "">
		WHERE 
			1=1 
			AND
			#arguments.where#</cfif><cfif arguments.order NEQ "">
		ORDER BY
			#arguments.order#</cfif>
		</cfquery>
		
		<cfreturn rsReturn/>
	</cffunction>
	
	<cffunction name="insertData" access="private" output="false">
		<cfargument name="fields" default="#variables.field.name#">
		
		<cfscript>
		var seperator = "";
		var iField = "";
		var myReturn = structNew();
		myReturn.success = false;
		myReturn.message = "";
		</cfscript>
		
		<cfquery datasource="#variables.dsn#" name="qryInsert">
		INSERT INTO product
		(<cfloop list="#arguments.fields#" index="iField"><cfif iField NEQ variables.pKeyField>
			#seperator##iField#<cfset seperator = ", "></cfif></cfloop>
		)
		VALUES
		(<cfset seperator = ""><cfloop list="#arguments.fields#" index="iField"><cfif iField NEQ variables.pKeyField>
			#seperator#<cfqueryparam value="#variables.attributes[iField]#"><cfset seperator = ", "></cfif></cfloop>
		)
		</cfquery>
		<cfset myReturn.success = true>
		<cfset myReturn.message = "Your record was stored.">
		
		<cfreturn myReturn>
	</cffunction>
	
	<cffunction name="updateData" access="private" output="false">
		<cfargument name="fields" default="#variables.field.name#">
		
		<cfscript>
		var seperator = "";
		var iField = "";
		var myReturn = structNew();
		myReturn.success = false;
		myReturn.message = "";
		</cfscript>

		<cfquery datasource="#variables.dsn#" name="qryUpdate">
		UPDATE product
		SET<cfloop list="#arguments.fields#" index="iField"><cfif iField NEQ variables.pKeyField>
			#seperator##iField# = <cfqueryparam value="#variables.attributes[iField]#"><cfset seperator = ", "></cfif></cfloop>
		WHERE
			#variables.pKeyField# = <cfqueryparam value="#attributes[variables.pKeyField]#">
		</cfquery>

		<cfset myReturn.success = true>
		<cfset myReturn.message = "Your record was stored.">

		<cfreturn myReturn>
	</cffunction>
	
	<cffunction name="validateData" access="public" output="false">
	
	</cffunction>

</cfcomponent>
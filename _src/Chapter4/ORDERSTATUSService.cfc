<cfcomponent output="false" hint="CFBuilder-Generated:ORDERSTATUS">

	
	<!----
	ORDERSTATUS SERVICES

	---->
	<!---- Add ORDERSTATUS ---->

	<cffunction name="createORDERSTATUS" returntype="ORDERSTATUS" access="remote">
		<cfargument name="item" type="ORDERSTATUS" required="true" />
		<!---- Auto-generated method
		  Insert a new record in ORDERSTATUS ---->
		<cfset entitysave(item) />

		<!---- return created item ---->
		<cfreturn item/>
	</cffunction>

	<!---- Remove ORDERSTATUS ---->
	<cffunction name="deleteORDERSTATUS" returntype="void" access="remote">
		<cfargument name="ORDERSTATUSID" type="any" required="true" />
		
		<!---- Auto-generated method
		         Delete a record in the database ---->
		<cfset var primaryKeysMap = { ORDERSTATUSID = ORDERSTATUSID }>
		<cfset var item=entityload("ORDERSTATUS",primaryKeysMap,true)>
		<cfif isnull(item) eq false>
			<cfset entitydelete(item) />
		</cfif>
		<cfreturn />
	</cffunction>

	<!---- Get All ORDERSTATUS ---->
	<cffunction name="getAllORDERSTATUS" returntype="ORDERSTATUS[]" access="remote">
		<!---- Auto-generated method
		        Retrieve set of records and return them as a query or array ---->
		<!---- return items ---->
		<cfreturn entityload("ORDERSTATUS") />
	</cffunction>

	<!---- Get All Paged ORDERSTATUS ---->
	<cffunction name="getORDERSTATUS_paged" returntype="ORDERSTATUS[]" access="remote">
		<cfargument name="startIndex" type="numeric" required="true" />
		<cfargument name="numItems" type="numeric" required="true" />
		<!---- Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow ---->
		<!---- return paged items ---->
		<cfreturn entityload("ORDERSTATUS",{},"",{offset=startIndex,maxresults=numItems})/>
	</cffunction>

	<!---- Get ORDERSTATUS ---->
	<cffunction name="getORDERSTATUS" returntype="ORDERSTATUS" access="remote">
		 <cfargument name="ORDERSTATUSID" type="any" required="true" /> 
		<!---- Auto-generated method
		         Retrieve a single record and return it ---->
		<!---- return item ---->
		<cfset var primaryKeysMap = { ORDERSTATUSID = ORDERSTATUSID }>
		<cfreturn entityload("ORDERSTATUS",primaryKeysMap,true)>
	</cffunction>

	<!---- Save ORDERSTATUS ---->
		<cffunction name="updateORDERSTATUS" returntype="ORDERSTATUS" access="remote">
		<cfargument name="item" type="ORDERSTATUS" required="true" />
		<!---- Auto-generated method
		         Update an existing record in the database ---->
		<!---- update ORDERSTATUS ---->
		<cfset entitysave(item) />
		<cfreturn item/>
	</cffunction>

	<!---- Count ORDERSTATUS ---->
	<cffunction name="count" returntype="numeric" access="remote">
	
		<cfreturn ormexecutequery("select count(*) from ORDERSTATUS",true)>
	</cffunction>

</cfcomponent> 

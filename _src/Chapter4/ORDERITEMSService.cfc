<cfcomponent output="false" hint="CFBuilder-Generated:ORDERITEMS">

	
	<!----
	ORDERITEMS SERVICES

	---->
	<!---- Add ORDERITEMS ---->

	<cffunction name="createORDERITEMS" returntype="ORDERITEMS" access="remote">
		<cfargument name="item" type="ORDERITEMS" required="true" />
		<!---- Auto-generated method
		  Insert a new record in ORDERITEMS ---->
		<cfset entitysave(item) />

		<!---- return created item ---->
		<cfreturn item/>
	</cffunction>

	<!---- Remove ORDERITEMS ---->
	<cffunction name="deleteORDERITEMS" returntype="void" access="remote">
		<cfargument name="ORDERITEMID" type="any" required="true" />
		
		<!---- Auto-generated method
		         Delete a record in the database ---->
		<cfset var primaryKeysMap = { ORDERITEMID = ORDERITEMID }>
		<cfset var item=entityload("ORDERITEMS",primaryKeysMap,true)>
		<cfif isnull(item) eq false>
			<cfset entitydelete(item) />
		</cfif>
		<cfreturn />
	</cffunction>

	<!---- Get All ORDERITEMS ---->
	<cffunction name="getAllORDERITEMS" returntype="ORDERITEMS[]" access="remote">
		<!---- Auto-generated method
		        Retrieve set of records and return them as a query or array ---->
		<!---- return items ---->
		<cfreturn entityload("ORDERITEMS") />
	</cffunction>

	<!---- Get All Paged ORDERITEMS ---->
	<cffunction name="getORDERITEMS_paged" returntype="ORDERITEMS[]" access="remote">
		<cfargument name="startIndex" type="numeric" required="true" />
		<cfargument name="numItems" type="numeric" required="true" />
		<!---- Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow ---->
		<!---- return paged items ---->
		<cfreturn entityload("ORDERITEMS",{},"",{offset=startIndex,maxresults=numItems})/>
	</cffunction>

	<!---- Get ORDERITEMS ---->
	<cffunction name="getORDERITEMS" returntype="ORDERITEMS" access="remote">
		 <cfargument name="ORDERITEMID" type="any" required="true" /> 
		<!---- Auto-generated method
		         Retrieve a single record and return it ---->
		<!---- return item ---->
		<cfset var primaryKeysMap = { ORDERITEMID = ORDERITEMID }>
		<cfreturn entityload("ORDERITEMS",primaryKeysMap,true)>
	</cffunction>

	<!---- Save ORDERITEMS ---->
		<cffunction name="updateORDERITEMS" returntype="ORDERITEMS" access="remote">
		<cfargument name="item" type="ORDERITEMS" required="true" />
		<!---- Auto-generated method
		         Update an existing record in the database ---->
		<!---- update ORDERITEMS ---->
		<cfset entitysave(item) />
		<cfreturn item/>
	</cffunction>

	<!---- Count ORDERITEMS ---->
	<cffunction name="count" returntype="numeric" access="remote">
	
		<cfreturn ormexecutequery("select count(*) from ORDERITEMS",true)>
	</cffunction>

</cfcomponent> 

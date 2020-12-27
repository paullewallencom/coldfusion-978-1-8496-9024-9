<cfcomponent output="false" hint="CFBuilder-Generated:ORDERS">

	
	<!----
	ORDERS SERVICES

	---->
	<!---- Add ORDERS ---->

	<cffunction name="createORDERS" returntype="ORDERS" access="remote">
		<cfargument name="item" type="ORDERS" required="true" />
		<!---- Auto-generated method
		  Insert a new record in ORDERS ---->
		<cfset entitysave(item) />

		<!---- return created item ---->
		<cfreturn item/>
	</cffunction>

	<!---- Remove ORDERS ---->
	<cffunction name="deleteORDERS" returntype="void" access="remote">
		<cfargument name="ORDERID" type="any" required="true" />
		
		<!---- Auto-generated method
		         Delete a record in the database ---->
		<cfset var primaryKeysMap = { ORDERID = ORDERID }>
		<cfset var item=entityload("ORDERS",primaryKeysMap,true)>
		<cfif isnull(item) eq false>
			<cfset entitydelete(item) />
		</cfif>
		<cfreturn />
	</cffunction>

	<!---- Get All ORDERS ---->
	<cffunction name="getAllORDERS" returntype="ORDERS[]" access="remote">
		<!---- Auto-generated method
		        Retrieve set of records and return them as a query or array ---->
		<!---- return items ---->
		<cfreturn entityload("ORDERS") />
	</cffunction>

	<!---- Get All Paged ORDERS ---->
	<cffunction name="getORDERS_paged" returntype="ORDERS[]" access="remote">
		<cfargument name="startIndex" type="numeric" required="true" />
		<cfargument name="numItems" type="numeric" required="true" />
		<!---- Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow ---->
		<!---- return paged items ---->
		<cfreturn entityload("ORDERS",{},"",{offset=startIndex,maxresults=numItems})/>
	</cffunction>

	<!---- Get ORDERS ---->
	<cffunction name="getORDERS" returntype="ORDERS" access="remote">
		 <cfargument name="ORDERID" type="any" required="true" /> 
		<!---- Auto-generated method
		         Retrieve a single record and return it ---->
		<!---- return item ---->
		<cfset var primaryKeysMap = { ORDERID = ORDERID }>
		<cfreturn entityload("ORDERS",primaryKeysMap,true)>
	</cffunction>

	<!---- Save ORDERS ---->
		<cffunction name="updateORDERS" returntype="ORDERS" access="remote">
		<cfargument name="item" type="ORDERS" required="true" />
		<!---- Auto-generated method
		         Update an existing record in the database ---->
		<!---- update ORDERS ---->
		<cfset entitysave(item) />
		<cfreturn item/>
	</cffunction>

	<!---- Count ORDERS ---->
	<cffunction name="count" returntype="numeric" access="remote">
	
		<cfreturn ormexecutequery("select count(*) from ORDERS",true)>
	</cffunction>

</cfcomponent> 

<cfcomponent output="false" hint="CFBuilder-Generated:ORDERITEM">

	
	<!----
	ORDERITEM SERVICES

	---->
	<!---- Add ORDERITEM ---->

	<cffunction name="createORDERITEM" returntype="ORDERITEM" access="remote">
		<cfargument name="item" type="ORDERITEM" required="true" />
		<!---- Auto-generated method
		  Insert a new record in ORDERITEM ---->
		<cfset entitysave(item) />

		<!---- return created item ---->
		<cfreturn item/>
	</cffunction>

	<!---- Remove ORDERITEM ---->
	<cffunction name="deleteORDERITEM" returntype="void" access="remote">
		<cfargument name="ORDERITEMID" type="any" required="true" />
		
		<!---- Auto-generated method
		         Delete a record in the database ---->
		<cfset var primaryKeysMap = { ORDERITEMID = ORDERITEMID }>
		<cfset var item=entityload("ORDERITEM",primaryKeysMap,true)>
		<cfif isnull(item) eq false>
			<cfset entitydelete(item) />
		</cfif>
		<cfreturn />
	</cffunction>

	<!---- Get All ORDERITEM ---->
	<cffunction name="getAllORDERITEM" returntype="ORDERITEM[]" access="remote">
		<!---- Auto-generated method
		        Retrieve set of records and return them as a query or array ---->
		<!---- return items ---->
		<cfreturn entityload("ORDERITEM") />
	</cffunction>

	<!---- Get All Paged ORDERITEM ---->
	<cffunction name="getORDERITEM_paged" returntype="ORDERITEM[]" access="remote">
		<cfargument name="startIndex" type="numeric" required="true" />
		<cfargument name="numItems" type="numeric" required="true" />
		<!---- Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow ---->
		<!---- return paged items ---->
		<cfreturn entityload("ORDERITEM",{},"",{offset=startIndex,maxresults=numItems})/>
	</cffunction>

	<!---- Get ORDERITEM ---->
	<cffunction name="getORDERITEM" returntype="ORDERITEM" access="remote">
		 <cfargument name="ORDERITEMID" type="any" required="true" /> 
		<!---- Auto-generated method
		         Retrieve a single record and return it ---->
		<!---- return item ---->
		<cfset var primaryKeysMap = { ORDERITEMID = ORDERITEMID }>
		<cfreturn entityload("ORDERITEM",primaryKeysMap,true)>
	</cffunction>

	<!---- Save ORDERITEM ---->
		<cffunction name="updateORDERITEM" returntype="ORDERITEM" access="remote">
		<cfargument name="item" type="ORDERITEM" required="true" />
		<!---- Auto-generated method
		         Update an existing record in the database ---->
		<!---- update ORDERITEM ---->
		<cfset entitysave(item) />
		<cfreturn item/>
	</cffunction>

	<!---- Count ORDERITEM ---->
	<cffunction name="count" returntype="numeric" access="remote">
	
		<cfreturn ormexecutequery("select count(*) from ORDERITEM",true)>
	</cffunction>

</cfcomponent> 

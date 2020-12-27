<cfcomponent output="false" hint="CFBuilder-Generated:ORDER">

	
	<!----
	ORDER SERVICES

	---->
	<!---- Add ORDER ---->

	<cffunction name="createORDER" returntype="ORDER" access="remote">
		<cfargument name="item" type="ORDER" required="true" />
		<!---- Auto-generated method
		  Insert a new record in ORDER ---->
		<cfset entitysave(item) />

		<!---- return created item ---->
		<cfreturn item/>
	</cffunction>

	<!---- Remove ORDER ---->
	<cffunction name="deleteORDER" returntype="void" access="remote">
		<cfargument name="ORDERID" type="any" required="true" />
		
		<!---- Auto-generated method
		         Delete a record in the database ---->
		<cfset var primaryKeysMap = { ORDERID = ORDERID }>
		<cfset var item=entityload("ORDER",primaryKeysMap,true)>
		<cfif isnull(item) eq false>
			<cfset entitydelete(item) />
		</cfif>
		<cfreturn />
	</cffunction>

	<!---- Get All ORDER ---->
	<cffunction name="getAllORDER" returntype="ORDER[]" access="remote">
		<!---- Auto-generated method
		        Retrieve set of records and return them as a query or array ---->
		<!---- return items ---->
		<cfreturn entityload("ORDER") />
	</cffunction>

	<!---- Get All Paged ORDER ---->
	<cffunction name="getORDER_paged" returntype="ORDER[]" access="remote">
		<cfargument name="startIndex" type="numeric" required="true" />
		<cfargument name="numItems" type="numeric" required="true" />
		<!---- Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow ---->
		<!---- return paged items ---->
		<cfreturn entityload("ORDER",{},"",{offset=startIndex,maxresults=numItems})/>
	</cffunction>

	<!---- Get ORDER ---->
	<cffunction name="getORDER" returntype="ORDER" access="remote">
		 <cfargument name="ORDERID" type="any" required="true" /> 
		<!---- Auto-generated method
		         Retrieve a single record and return it ---->
		<!---- return item ---->
		<cfset var primaryKeysMap = { ORDERID = ORDERID }>
		<cfreturn entityload("ORDER",primaryKeysMap,true)>
	</cffunction>

	<!---- Save ORDER ---->
		<cffunction name="updateORDER" returntype="ORDER" access="remote">
		<cfargument name="item" type="ORDER" required="true" />
		<!---- Auto-generated method
		         Update an existing record in the database ---->
		<!---- update ORDER ---->
		<cfset entitysave(item) />
		<cfreturn item/>
	</cffunction>

	<!---- Count ORDER ---->
	<cffunction name="count" returntype="numeric" access="remote">
	
		<cfreturn ormexecutequery("select count(*) from ORDER",true)>
	</cffunction>

</cfcomponent> 

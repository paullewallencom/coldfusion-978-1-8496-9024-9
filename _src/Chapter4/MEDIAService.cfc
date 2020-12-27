<cfcomponent output="false" hint="CFBuilder-Generated:MEDIA">

	
	<!----
	MEDIA SERVICES

	---->
	<!---- Add MEDIA ---->

	<cffunction name="createMEDIA" returntype="MEDIA" access="remote">
		<cfargument name="item" type="MEDIA" required="true" />
		<!---- Auto-generated method
		  Insert a new record in MEDIA ---->
		<cfset entitysave(item) />

		<!---- return created item ---->
		<cfreturn item/>
	</cffunction>

	<!---- Remove MEDIA ---->
	<cffunction name="deleteMEDIA" returntype="void" access="remote">
		<cfargument name="MEDIAID" type="any" required="true" />
		
		<!---- Auto-generated method
		         Delete a record in the database ---->
		<cfset var primaryKeysMap = { MEDIAID = MEDIAID }>
		<cfset var item=entityload("MEDIA",primaryKeysMap,true)>
		<cfif isnull(item) eq false>
			<cfset entitydelete(item) />
		</cfif>
		<cfreturn />
	</cffunction>

	<!---- Get All MEDIA ---->
	<cffunction name="getAllMEDIA" returntype="MEDIA[]" access="remote">
		<!---- Auto-generated method
		        Retrieve set of records and return them as a query or array ---->
		<!---- return items ---->
		<cfreturn entityload("MEDIA") />
	</cffunction>

	<!---- Get All Paged MEDIA ---->
	<cffunction name="getMEDIA_paged" returntype="MEDIA[]" access="remote">
		<cfargument name="startIndex" type="numeric" required="true" />
		<cfargument name="numItems" type="numeric" required="true" />
		<!---- Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow ---->
		<!---- return paged items ---->
		<cfreturn entityload("MEDIA",{},"",{offset=startIndex,maxresults=numItems})/>
	</cffunction>

	<!---- Get MEDIA ---->
	<cffunction name="getMEDIA" returntype="MEDIA" access="remote">
		 <cfargument name="MEDIAID" type="any" required="true" /> 
		<!---- Auto-generated method
		         Retrieve a single record and return it ---->
		<!---- return item ---->
		<cfset var primaryKeysMap = { MEDIAID = MEDIAID }>
		<cfreturn entityload("MEDIA",primaryKeysMap,true)>
	</cffunction>

	<!---- Save MEDIA ---->
		<cffunction name="updateMEDIA" returntype="MEDIA" access="remote">
		<cfargument name="item" type="MEDIA" required="true" />
		<!---- Auto-generated method
		         Update an existing record in the database ---->
		<!---- update MEDIA ---->
		<cfset entitysave(item) />
		<cfreturn item/>
	</cffunction>

	<!---- Count MEDIA ---->
	<cffunction name="count" returntype="numeric" access="remote">
	
		<cfreturn ormexecutequery("select count(*) from MEDIA",true)>
	</cffunction>

</cfcomponent> 

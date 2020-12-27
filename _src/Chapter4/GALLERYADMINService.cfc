<cfcomponent output="false" hint="CFBuilder-Generated:GALLERYADMIN">

	
	<!----
	GALLERYADMIN SERVICES

	---->
	<!---- Add GALLERYADMIN ---->

	<cffunction name="createGALLERYADMIN" returntype="GALLERYADMIN" access="remote">
		<cfargument name="item" type="GALLERYADMIN" required="true" />
		<!---- Auto-generated method
		  Insert a new record in GALLERYADMIN ---->
		<cfset entitysave(item) />

		<!---- return created item ---->
		<cfreturn item/>
	</cffunction>

	<!---- Remove GALLERYADMIN ---->
	<cffunction name="deleteGALLERYADMIN" returntype="void" access="remote">
		<cfargument name="GALLERYADMINID" type="any" required="true" />
		
		<!---- Auto-generated method
		         Delete a record in the database ---->
		<cfset var primaryKeysMap = { GALLERYADMINID = GALLERYADMINID }>
		<cfset var item=entityload("GALLERYADMIN",primaryKeysMap,true)>
		<cfif isnull(item) eq false>
			<cfset entitydelete(item) />
		</cfif>
		<cfreturn />
	</cffunction>

	<!---- Get All GALLERYADMIN ---->
	<cffunction name="getAllGALLERYADMIN" returntype="GALLERYADMIN[]" access="remote">
		<!---- Auto-generated method
		        Retrieve set of records and return them as a query or array ---->
		<!---- return items ---->
		<cfreturn entityload("GALLERYADMIN") />
	</cffunction>

	<!---- Get All Paged GALLERYADMIN ---->
	<cffunction name="getGALLERYADMIN_paged" returntype="GALLERYADMIN[]" access="remote">
		<cfargument name="startIndex" type="numeric" required="true" />
		<cfargument name="numItems" type="numeric" required="true" />
		<!---- Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow ---->
		<!---- return paged items ---->
		<cfreturn entityload("GALLERYADMIN",{},"",{offset=startIndex,maxresults=numItems})/>
	</cffunction>

	<!---- Get GALLERYADMIN ---->
	<cffunction name="getGALLERYADMIN" returntype="GALLERYADMIN" access="remote">
		 <cfargument name="GALLERYADMINID" type="any" required="true" /> 
		<!---- Auto-generated method
		         Retrieve a single record and return it ---->
		<!---- return item ---->
		<cfset var primaryKeysMap = { GALLERYADMINID = GALLERYADMINID }>
		<cfreturn entityload("GALLERYADMIN",primaryKeysMap,true)>
	</cffunction>

	<!---- Save GALLERYADMIN ---->
		<cffunction name="updateGALLERYADMIN" returntype="GALLERYADMIN" access="remote">
		<cfargument name="item" type="GALLERYADMIN" required="true" />
		<!---- Auto-generated method
		         Update an existing record in the database ---->
		<!---- update GALLERYADMIN ---->
		<cfset entitysave(item) />
		<cfreturn item/>
	</cffunction>

	<!---- Count GALLERYADMIN ---->
	<cffunction name="count" returntype="numeric" access="remote">
	
		<cfreturn ormexecutequery("select count(*) from GALLERYADMIN",true)>
	</cffunction>

</cfcomponent> 

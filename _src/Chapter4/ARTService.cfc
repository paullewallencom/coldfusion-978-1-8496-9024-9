<cfcomponent output="false" hint="CFBuilder-Generated:ART">

	
	<!----
	ART SERVICES

	---->
	<!---- Add ART ---->

	<cffunction name="createART" returntype="ART" access="remote">
		<cfargument name="item" type="ART" required="true" />
		<!---- Auto-generated method
		  Insert a new record in ART ---->
		<cfset entitysave(item) />

		<!---- return created item ---->
		<cfreturn item/>
	</cffunction>

	<!---- Remove ART ---->
	<cffunction name="deleteART" returntype="void" access="remote">
		<cfargument name="ARTID" type="any" required="true" />
		
		<!---- Auto-generated method
		         Delete a record in the database ---->
		<cfset var primaryKeysMap = { ARTID = ARTID }>
		<cfset var item=entityload("ART",primaryKeysMap,true)>
		<cfif isnull(item) eq false>
			<cfset entitydelete(item) />
		</cfif>
		<cfreturn />
	</cffunction>

	<!---- Get All ART ---->
	<cffunction name="getAllART" returntype="ART[]" access="remote">
		<!---- Auto-generated method
		        Retrieve set of records and return them as a query or array ---->
		<!---- return items ---->
		<cfreturn entityload("ART") />
	</cffunction>

	<!---- Get All Paged ART ---->
	<cffunction name="getART_paged" returntype="ART[]" access="remote">
		<cfargument name="startIndex" type="numeric" required="true" />
		<cfargument name="numItems" type="numeric" required="true" />
		<!---- Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow ---->
		<!---- return paged items ---->
		<cfreturn entityload("ART",{},"",{offset=startIndex,maxresults=numItems})/>
	</cffunction>

	<!---- Get ART ---->
	<cffunction name="getART" returntype="ART" access="remote">
		 <cfargument name="ARTID" type="any" required="true" /> 
		<!---- Auto-generated method
		         Retrieve a single record and return it ---->
		<!---- return item ---->
		<cfset var primaryKeysMap = { ARTID = ARTID }>
		<cfreturn entityload("ART",primaryKeysMap,true)>
	</cffunction>

	<!---- Save ART ---->
		<cffunction name="updateART" returntype="ART" access="remote">
		<cfargument name="item" type="ART" required="true" />
		<!---- Auto-generated method
		         Update an existing record in the database ---->
		<!---- update ART ---->
		<cfset entitysave(item) />
		<cfreturn item/>
	</cffunction>

	<!---- Count ART ---->
	<cffunction name="count" returntype="numeric" access="remote">
	
		<cfreturn ormexecutequery("select count(*) from ART",true)>
	</cffunction>

</cfcomponent> 

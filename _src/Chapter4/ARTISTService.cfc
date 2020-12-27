<cfcomponent output="false" hint="CFBuilder-Generated:ARTIST">

	
	<!----
	ARTIST SERVICES

	---->
	<!---- Add ARTIST ---->

	<cffunction name="createARTIST" returntype="ARTIST" access="remote">
		<cfargument name="item" type="ARTIST" required="true" />
		<!---- Auto-generated method
		  Insert a new record in ARTIST ---->
		<cfset entitysave(item) />

		<!---- return created item ---->
		<cfreturn item/>
	</cffunction>

	<!---- Remove ARTIST ---->
	<cffunction name="deleteARTIST" returntype="void" access="remote">
		<cfargument name="ARTISTID" type="any" required="true" />
		
		<!---- Auto-generated method
		         Delete a record in the database ---->
		<cfset var primaryKeysMap = { ARTISTID = ARTISTID }>
		<cfset var item=entityload("ARTIST",primaryKeysMap,true)>
		<cfif isnull(item) eq false>
			<cfset entitydelete(item) />
		</cfif>
		<cfreturn />
	</cffunction>

	<!---- Get All ARTIST ---->
	<cffunction name="getAllARTIST" returntype="ARTIST[]" access="remote">
		<!---- Auto-generated method
		        Retrieve set of records and return them as a query or array ---->
		<!---- return items ---->
		<cfreturn entityload("ARTIST") />
	</cffunction>

	<!---- Get All Paged ARTIST ---->
	<cffunction name="getARTIST_paged" returntype="ARTIST[]" access="remote">
		<cfargument name="startIndex" type="numeric" required="true" />
		<cfargument name="numItems" type="numeric" required="true" />
		<!---- Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow ---->
		<!---- return paged items ---->
		<cfreturn entityload("ARTIST",{},"",{offset=startIndex,maxresults=numItems})/>
	</cffunction>

	<!---- Get ARTIST ---->
	<cffunction name="getARTIST" returntype="ARTIST" access="remote">
		 <cfargument name="ARTISTID" type="any" required="true" /> 
		<!---- Auto-generated method
		         Retrieve a single record and return it ---->
		<!---- return item ---->
		<cfset var primaryKeysMap = { ARTISTID = ARTISTID }>
		<cfreturn entityload("ARTIST",primaryKeysMap,true)>
	</cffunction>

	<!---- Save ARTIST ---->
		<cffunction name="updateARTIST" returntype="ARTIST" access="remote">
		<cfargument name="item" type="ARTIST" required="true" />
		<!---- Auto-generated method
		         Update an existing record in the database ---->
		<!---- update ARTIST ---->
		<cfset entitysave(item) />
		<cfreturn item/>
	</cffunction>

	<!---- Count ARTIST ---->
	<cffunction name="count" returntype="numeric" access="remote">
	
		<cfreturn ormexecutequery("select count(*) from ARTIST",true)>
	</cffunction>

</cfcomponent> 

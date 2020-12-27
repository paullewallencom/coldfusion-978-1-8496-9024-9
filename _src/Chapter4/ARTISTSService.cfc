<cfcomponent output="false" hint="CFBuilder-Generated:ARTISTS">

	
	<!----
	ARTISTS SERVICES

	---->
	<!---- Add ARTISTS ---->

	<cffunction name="createARTISTS" returntype="ARTISTS" access="remote">
		<cfargument name="item" type="ARTISTS" required="true" />
		<!---- Auto-generated method
		  Insert a new record in ARTISTS ---->
		<cfset entitysave(item) />

		<!---- return created item ---->
		<cfreturn item/>
	</cffunction>

	<!---- Remove ARTISTS ---->
	<cffunction name="deleteARTISTS" returntype="void" access="remote">
		<cfargument name="ARTISTID" type="any" required="true" />
		
		<!---- Auto-generated method
		         Delete a record in the database ---->
		<cfset var primaryKeysMap = { ARTISTID = ARTISTID }>
		<cfset var item=entityload("ARTISTS",primaryKeysMap,true)>
		<cfif isnull(item) eq false>
			<cfset entitydelete(item) />
		</cfif>
		<cfreturn />
	</cffunction>

	<!---- Get All ARTISTS ---->
	<cffunction name="getAllARTISTS" returntype="ARTISTS[]" access="remote">
		<!---- Auto-generated method
		        Retrieve set of records and return them as a query or array ---->
		<!---- return items ---->
		<cfreturn entityload("ARTISTS") />
	</cffunction>

	<!---- Get All Paged ARTISTS ---->
	<cffunction name="getARTISTS_paged" returntype="ARTISTS[]" access="remote">
		<cfargument name="startIndex" type="numeric" required="true" />
		<cfargument name="numItems" type="numeric" required="true" />
		<!---- Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow ---->
		<!---- return paged items ---->
		<cfreturn entityload("ARTISTS",{},"",{offset=startIndex,maxresults=numItems})/>
	</cffunction>

	<!---- Get ARTISTS ---->
	<cffunction name="getARTISTS" returntype="ARTISTS" access="remote">
		 <cfargument name="ARTISTID" type="any" required="true" /> 
		<!---- Auto-generated method
		         Retrieve a single record and return it ---->
		<!---- return item ---->
		<cfset var primaryKeysMap = { ARTISTID = ARTISTID }>
		<cfreturn entityload("ARTISTS",primaryKeysMap,true)>
	</cffunction>

	<!---- Save ARTISTS ---->
		<cffunction name="updateARTISTS" returntype="ARTISTS" access="remote">
		<cfargument name="item" type="ARTISTS" required="true" />
		<!---- Auto-generated method
		         Update an existing record in the database ---->
		<!---- update ARTISTS ---->
		<cfset entitysave(item) />
		<cfreturn item/>
	</cffunction>

	<!---- Count ARTISTS ---->
	<cffunction name="count" returntype="numeric" access="remote">
	
		<cfreturn ormexecutequery("select count(*) from ARTISTS",true)>
	</cffunction>

</cfcomponent> 

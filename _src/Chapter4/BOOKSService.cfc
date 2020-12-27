<cfcomponent output="false" hint="CFBuilder-Generated">

	
	<!----
	BOOKS SERVICES
	
	---->
	<!---- Add BOOKS ---->

	<cffunction name="createItem" returntype="BOOKS" access="remote">
		<cfargument name="item" type="BOOKS" required="true" />
		<!---- Auto-generated method 
		  Insert a new record in BOOKS ---->
		<cfset entitysave(item) />
		
		<!---- return created item ---->
		<cfreturn item/>
	</cffunction>
	
	<!---- Remove BOOKS ---->
	<cffunction name="deleteItem" returntype="void" access="remote">
		<cfargument name="BOOKID" type="any" required="true" />
		
		<!---- Auto-generated method
		         Delete a record in the database ---->
		<cfset primaryKeysMap = { BOOKID = BOOKID }>
		<cfset var item=entityload("BOOKS",primaryKeysMap,true)>
		<cfif isnull(item) eq false>		 
			<cfset entitydelete(item) />
		</cfif> 				 
		<cfreturn />
	</cffunction>
	
	<!---- Get All BOOKS ---->
	<cffunction name="getAllItem" returntype="BOOKS[]" access="remote">
		<!---- Auto-generated method
		        Retrieve set of records and return them as a query or array ---->
		<!---- return items ---->	
		<cfreturn entityload("BOOKS") />	
	</cffunction>
	
	<!---- Get All Paged BOOKS ---->
	<cffunction name="getAllItem_paged" returntype="BOOKS[]" access="remote">
		<cfargument name="start" type="numeric" required="true" />
		<cfargument name="count" type="numeric" required="true" />
		<!---- Auto-generated method
		         Return a page of numRows number of records as an array or query from the database for this startRow ---->
		<!---- return paged items ---->
		<cfreturn entityload("BOOKS","","",{offset=start,max=count})/>
	</cffunction>
	
	<!---- Get BOOKS ---->
	<cffunction name="getItem" returntype="BOOKS" access="remote">
		 <cfargument name="BOOKID" type="any" required="true" /> 
		<!---- Auto-generated method
		         Retrieve a single record and return it ---->
		<!---- return item ---->
		<cfset primaryKeysMap = { BOOKID = BOOKID }>
		<cfreturn entityload("BOOKS",primaryKeysMap,true)>
	</cffunction>
	
	<!---- Save BOOKS ---->
		<cffunction name="updateItem" returntype="BOOKS" access="remote">
		<cfargument name="item" type="BOOKS" required="true" />
		<!---- Auto-generated method
		         Update an existing record in the database ---->
		<!---- update BOOKS ---->
		<cfset entitysave(item) /> 
		<cfreturn item/>
	</cffunction>
	
	<!---- Count BOOKS ---->
	<cffunction name="countItem" returntype="numeric" access="remote">
	
		<cfreturn ormexecutequery("select count(*) from BOOKS",true)>
	</cffunction>

</cfcomponent> 

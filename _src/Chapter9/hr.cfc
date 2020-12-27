<cfcomponent output="false">

   <cfset this.dsn="cfdocexamples">

   <cffunction name="getDepts" access="remote" returnType="array">
      <cfset var rsData="">
      <cfset var myReturn=ArrayNew(2)>
      <cfset var i=0>

      <cfquery name="rsData" datasource="#this.dsn#">
      SELECT dept_id, dept_name
      FROM app.departmt
      ORDER BY dept_name
      </cfquery>

      <cfloop query="rsData">
         <cfset myReturn[rsData.currentRow][1]=rsData.dept_id>
         <cfset myReturn[rsData.currentRow][2]=rsData.dept_name>
      </cfloop>

      <cfreturn myReturn>
   </cffunction>

   <cffunction name="getEmployees" access="remote" returnType="array">
      <cfargument name="dept_id" type="numeric" required="true">

      <cfset var rsData="">
      <cfset var myReturn=ArrayNew(2)>
      <cfset var i=0>

      <cfquery name="rsData" datasource="#this.dsn#">
      SELECT emp_id, lastname, firstname
      FROM app.employee
      WHERE dept_id = #arguments.dept_id#
      ORDER BY lastname, firstname
      </cfquery>
   
      <cfloop query="rsData">
         <cfset myReturn[rsData.currentRow][1]=rsData.emp_id>
         <cfset myReturn[rsData.currentRow][2]=rsData.firstname & ' ' & rsData.lastname>
      </cfloop>

      <cfreturn myReturn>
   </cffunction>

</cfcomponent>

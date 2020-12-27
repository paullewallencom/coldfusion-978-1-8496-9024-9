<cfset objCFC = createObject("component","checkUser")>
<cfoutput>
  The current user is: (#getAuthUser()#).<br />
  Based on the role test the user checks for being in the role test 
    returns: (#isUserInRole('test')#)<br />
  Based on the role test the user checks for being in the role test 
    and test2 returns: (#isUserInRole('test,test2')#)<br />
  <cftry>
    Based on the CFC hasTestPermission() method: 
      (#objCFC.hasTestPermission()#)<br />
    Based on the CFC hasOneOfRoles() method: 
      (#objCFC.hasOneOfRoles()#)<br />
    <cfcatch>
      <cfdump var="#cfcatch.message#" expand="false" 
        label="CFC Test">)<br>
    </cfcatch>
  </cftry>
</cfoutput>
<a href="login_form.cfm">Login Form</a>&nbsp;
<a href="logout.cfm">Logout</a>

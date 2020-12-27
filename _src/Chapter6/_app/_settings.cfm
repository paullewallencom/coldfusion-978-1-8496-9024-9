<!---  Local scopes to calling page not supported. --->
<cfscript>
// check to see if current user has administrative permissions.
session._user.isAuthorized("admin","#application._api.site.path#index.cfm");
</cfscript>
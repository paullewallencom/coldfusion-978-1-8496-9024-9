
<cfscript>
oRoleMgr = createObject("component","#application._api.site.classPath#classes.roleMgr").init(application._api.site.dsn);
rsRoles = oRoleMgr.getRecords();
</cfscript>
<h3>User List</h3>
<cfform>
	<cfgrid name="roles" query="rsRoles" 
		format="html" striperows="true">

		<cfgridcolumn name="role_ID" display="false">
		<cfgridcolumn name="role_main" 
			header="Role" width="100"
			href="index.cfm?action=roleEdit" hrefkey="role_ID" />
		<cfgridcolumn name="description" header="Description" width="300"/>

	</cfgrid>
</cfform>

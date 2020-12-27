
<cfscript>
oUserMgr = createObject("component","#application._api.site.classPath#classes.userMgr").init(application._api.site.dsn);
rsUsers = oUserMgr.getRecords();
</cfscript>
<h3>User List</h3>
<cfform>
	<cfgrid name="users" query="rsUsers" 
		format="html" striperows="true">

		<cfgridcolumn name="user_ID" display="false">
		<cfgridcolumn name="user_main" 
			header="User" width="100"
			href="index.cfm?action=userEdit" hrefkey="user_ID" />
		<cfgridcolumn name="email" header="eMail" width="300"/>

	</cfgrid>
</cfform>


<cfscript>
oGroupMgr = createObject("component","#application._api.site.classPath#classes.groupMgr").init(application._api.site.dsn);
rsGroups = oGroupMgr.getRecords();
</cfscript>
<h3>User List</h3>
<cfform>
	<cfgrid name="groups" query="rsGroups" 
		format="html" striperows="true">

		<cfgridcolumn name="group_ID" display="false">
		<cfgridcolumn name="group_main" 
			header="Group" width="100"
			href="index.cfm?action=groupEdit" hrefkey="group_ID" />
		<cfgridcolumn name="description" header="Description" width="300"/>

	</cfgrid>
</cfform>

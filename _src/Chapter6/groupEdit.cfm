<cfparam name="request.attributes.cfgridkey" default="0">

<cftry>
<cfscript>
oGroupMgr = createObject("component","#application._api.site.classPath#classes.groupMgr").init(application._api.site.dsn);
oRoleMgr = createObject("component","#application._api.site.classPath#classes.roleMgr").init(application._api.site.dsn);
rsRoles = oRoleMgr.getRecords(order:"role_main");
groupRoleList = oGroupMgr.get_Roles(request.attributes.cfgridkey);

reload = false;
if(structKeyExists(request.attributes,"group_main") AND request.attributes.group_main NEQ ""){
	oGroupMgr.setRecordStruct(request.attributes);
	request.attributes.cfgridkey = oGroupMgr.save();
	if(structKeyExists(request.attributes,"roles")){
		oGroupMgr.set_roles(
			id:request.attributes.cfgridkey,
			roles:request.attributes.roles
		);
	}
	reload = true;
} else {
	oGroupMgr.loadRecord(id:request.attributes.cfgridKey);
}
</cfscript>
<cfif reload>
	<cfoutput><script>
	ColdFusion.navigate('#request.attributes.action#.cfm?action=#request.attributes.action#&CFGRIDKEY=#request.attributes.CFGRIDKEY#', 'loMain');
	</script></cfoutput>
</cfif>

<cfoutput><cfif request.attributes._msg NEQ "">
<hr/>#request.attributes._msg#</cfif>
<cfif oGroupMgr.get_pkey() EQ 0><h3>Enter New Group</h3>
<cfelse><h3>Edit Record for (#oGroupMgr.get('group_Main')#)</h3></cfif>
<cfform method="post" action="#request.attributes.action#.cfm" target="_blank">
	<input name="_formAction" type="hidden" 
		value="#request.attributes.action#">
	<cfinput name="group_ID" type="hidden" 
		value="#oGroupMgr.get('group_ID')#">
	<cfinput name="_cf_nodebug" type="hidden" 
		value="false">
	Group:<br/>
	<cfinput id="group_main" 
		name="group_main" 
		required="true" 
		message="Group name required."
		value="#oGroupMgr.get('group_Main')#" 
		style="width:180px;">
	<br />
	Description:<br/>
	<cftextarea id="description"
		name="description" 
		style="width:320px;"
		>#oGroupMgr.get('description')#</cftextarea>
	<br />
	
	Roles:<cfloop query="rsRoles"><br />
	<cfinput name="roles" id="roles_#rsRoles.currentRow#" 
		type="checkbox" value="#rsRoles.role_id#" 
		checked="#listFind(groupRoleList,rsRoles.role_id)#">
		<label for="roles_#rsRoles.currentRow#">#rsRoles.role_main#</label>
	</cfloop>
	
	<br />
	<cfinput type="submit" name="_submit" value="Store Group">
</cfform>
</cfoutput>
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>


<cfparam name="request.attributes.cfgridkey" default="0">

<cftry>
<cfscript>
oRoleMgr = createObject("component","#application._api.site.classPath#classes.roleMgr").init(application._api.site.dsn);

reload = false;
if(structKeyExists(request.attributes,"role_main") AND request.attributes.role_main NEQ ""){
	oRoleMgr.setRecordStruct(request.attributes);
	request.attributes.cfgridkey = oRoleMgr.save();
	reload = true;
} else {
	oRoleMgr.loadRecord(id:request.attributes.cfgridKey);
}
</cfscript>
<cfif reload>
	<cfoutput><script>
	ColdFusion.navigate('#request.attributes.action#.cfm?action=#request.attributes.action#&CFGRIDKEY=#request.attributes.CFGRIDKEY#', 'loMain');
	</script></cfoutput>
</cfif>

<cfoutput><cfif request.attributes._msg NEQ "">
<hr/>#request.attributes._msg#</cfif>
<cfif oRoleMgr.get_pkey() EQ 0><h3>Enter New Role</h3>
<cfelse><h3>Edit Record for (#oRoleMgr.get('role_Main')#)</h3></cfif>
<cfform method="post" action="#request.attributes.action#.cfm" target="_blank">
	<input name="_formAction" type="hidden" 
		value="#request.attributes.action#">
	<cfinput name="role_ID" type="hidden" 
		value="#oRoleMgr.get('role_ID')#">
	<cfinput name="_cf_nodebug" type="hidden" 
		value="false">
	Role:<br/>
	<cfinput name="role_main" 
		required="true" 
		message="Role name required."
		value="#oRoleMgr.get('role_Main')#" 
		style="width:180px;">
	<br />
	Description:<br/>
	<cftextarea id="description"
		name="description" 
		style="width:320px;"
		>#oRoleMgr.get('description')#</cftextarea>
	<br />
	<cfinput type="submit" name="_submit" value="Store Role">
</cfform>
</cfoutput>
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>


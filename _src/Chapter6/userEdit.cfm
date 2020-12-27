<cfimport prefix="controls" taglib="../customtags">

<cfparam name="request.attributes.cfgridkey" default="0">

<cftry>
<cfscript>
oUserMgr = createObject("component","#application._api.site.classPath#classes.userMgr").init(application._api.site.dsn);
oGroupMgr = createObject("component","#application._api.site.classPath#classes.groupMgr").init(application._api.site.dsn);
rsGroups = oGroupMgr.getRecords(order:"group_main");
userGroupList = oUserMgr.get_Groups(request.attributes.cfgridkey);

reload = false;
if(structKeyExists(request.attributes,"user_main") AND request.attributes.user_main NEQ ""){
	oUserMgr.setRecordStruct(request.attributes);
	request.attributes.cfgridkey = oUserMgr.save();
	if(structKeyExists(request.attributes,"groups")){
		oUserMgr.set_groups(
			id:request.attributes.cfgridkey,
			groups:request.attributes.groups
		);
	}
	reload = true;
} else {
	oUserMgr.loadRecord(id:request.attributes.cfgridKey);
}
</cfscript>
<cfif reload>
	<cfoutput><script>
	ColdFusion.navigate('#request.attributes.action#.cfm?action=#request.attributes.action#&CFGRIDKEY=#request.attributes.CFGRIDKEY#', 'loMain');
	</script></cfoutput>
</cfif>
<cfoutput><cfif request.attributes._msg NEQ "">
<hr/>#request.attributes._msg#</cfif>
<cfif oUserMgr.get_pkey() EQ 0><h3>Enter New User</h3>
<cfelse><h3>Edit Record for (#oUserMgr.get('user_Main')#)</h3></cfif>
<cfform method="post" action="#request.attributes.action#.cfm" target="" format="html">
	<input name="_formAction" type="hidden" 
		value="#request.attributes.action#">
	<cfinput name="user_ID" type="hidden" 
		value="#oUserMgr.get('user_ID')#">
	<cfinput name="_cf_nodebug" type="hidden" 
		value="false">
	User:<br/>
	<cfinput name="user_main" 
		required="true" 
		message="User name required."
		value="#oUserMgr.get('user_Main')#" 
		style="width:180px;">
	<br />
	eMail:<br/>
	<cfinput name="email" 
		required="true" 
		message="Email reqired."
		value="#oUserMgr.get('email')#" 
		style="width:320px;">
	<br />
	Password:<br/>
	<cfinput name="password" 
		required="true"
		message="Password required."
		value="#oUserMgr.get('password')#" 
		style="width:180px;">
	<br />
	Password Question:<br/>
	<cfinput name="passwordQuestion" required="true"
		value="#oUserMgr.get('passwordQuestion')#" 
		style="width:320px;">
	<br />
	Password Answer:<br/>
	<cfinput name="passwordAnswer" required="true"
		value="#oUserMgr.get('passwordAnswer')#" 
		style="width:320px;">
	<br />
	Groups:<cfloop query="rsGroups"><br />
	<cfinput name="groups" id="groups_#rsGroups.currentRow#"
		type="checkbox" value="#rsGroups.group_id#" 
		checked="#listFind(userGroupList,rsGroups.group_id)#">
		<label for="groups_#rsGroups.currentRow#">#rsGroups.group_main#</label>
	</cfloop>

	<br />
	<cfinput type="submit" name="_submit" value="Store User">
	
</cfform>

</cfoutput>
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>



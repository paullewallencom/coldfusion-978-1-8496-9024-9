<cfparam name="request.attributes.action" default="main">
<cfif listLen(replace(request.attributes.action,"\","/","ALL"),"/") NEQ 1>
	
</cfif>
<cflayout name="loPage" type="border" style="hight:100%;width:100%;">
	<cflayoutarea name="loHeader" position="top">
		<h1 style="margin:0px;text-align:center;">Building Site Administration</h1>
	</cflayoutarea>
	<cflayoutarea name="loSidebar" position="left" 
		style="padding:4px;width:160px;">
		<a href="index.cfm">Administration</a>
		
		<cfoutput>
		<h3>Users</h3>
		<ul>
			<li><a href="#request._api.app.path#index.cfm?action=userList">List</a></li>
			<li><a href="#request._api.app.path#index.cfm?action=userEdit">New</a></li>
		</ul>
		<h3>Groups</h3>
		<ul>
			<li><a href="#request._api.app.path#index.cfm?action=groupList">List</a></li>
			<li><a href="#request._api.app.path#index.cfm?action=groupEdit">New</a></li>
		</ul>
		<h3>Roles</h3>
		<ul>
			<li><a href="#request._api.app.path#index.cfm?action=roleList">List</a></li>
			<li><a href="#request._api.app.path#index.cfm?action=roleEdit">New</a></li>
		</ul>
		<hr>
		<h3>Site</h3>
		<ul>
			<li><a href="#application._api.site.path#">Home</a></li>
			<li><a href="index.cfm">Admin</a></li>
		</ul>
		</cfoutput>
	</cflayoutarea>
	<cflayoutarea name="loMain" position="center" style="padding:4px;">
		<cfinclude template="#request.attributes.action#.cfm">
	</cflayoutarea>
	<cflayoutarea name="loFooter" position="bottom" style="text-align:center;">
		<em>This is the site administration page.</em>
	</cflayoutarea>
</cflayout>
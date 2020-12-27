<cflayout name="loPage" type="border" style="hight:100%;width:100%;">
  <cflayoutarea name="loHeader" position="top">
    <h1 style="margin:0px;text-align:center;">
      Building Site 
    Administration</h1>
  </cflayoutarea>
  <cflayoutarea name="loSidebar" position="left" 
                style="padding:4px;width:160px;">
    <cfoutput>
      <cfif NOT session._user.isUser()>
        <a href="#request._api.app.path#index.cfm?action=login">
          Login
    </a>
      <cfelse>
        <a href="#request._api.app.path#index.cfm?action=logout">
          Logout
    </a>
      </cfif>
      <h3>Site</h3>
      <ul>
        <li>Home</li>
        <li><a href="#application._api.site.path#/admin">Admin
          </a></li>
      </ul>
    </cfoutput>
  </cflayoutarea>
  <cflayoutarea name="loMain" position="center" style="padding:4px;">
    <cfinclude template="#request._api.app.path#
      #request.attributes.action#.cfm">
  </cflayoutarea>
  <cflayoutarea name="loFooter" position="bottom" 
    style="text-align:center;">
    <em>This is the site home page.</em>
  </cflayoutarea>
</cflayout>

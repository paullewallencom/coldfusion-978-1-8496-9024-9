<cfscript>
this.name = "ApplicationIDName";
this.applicationTimeout = createTimeSpan(0,2,0,0);
this.clientManagement = true;
this.clientStorage = "cookie";
this.loginStorage = "session";
this.sessionManagement = true;
this.sessionTimeout = createTimeSpan(0,0,5,0);
this.setClientCookies = true;
this.setDomainCookies = false;
this.scriptProtect = false;
</cfscript>
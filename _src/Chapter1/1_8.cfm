<!--- Example: 1_8.cfm --->
<!--- Processing --->
<cfscript>
requestedDomain = cgi.server_name;
isSecure = cgi.server_port_secure;
</cfscript>
<!--- Content --->
<cfoutput>
The requested domain was #requestedDomain#.<br />
Was the current request secure (0 = No/1 = Yes) ? #isSecure# <br />
</cfoutput>


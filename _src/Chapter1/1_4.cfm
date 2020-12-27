<!--- Example: 1_4.cfm --->
<!--- Processing --->
<cfscript>
myAge = 27;

halfAge = myAge/2;
</cfscript>

<!--- Content --->
<cfoutput>
myAge is (#myAge#)<br />
halfAge is (#halfAge#)<br />
halfAge rounded is (#round(halfAge)#)<br />
4.2 rounded is (#round(4.2)#)<br />
4.2 ceiling is (#ceiling(4.2)#)<br />
</cfoutput>

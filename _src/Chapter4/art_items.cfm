<cfscript>
art = entityLoad("art",{ISSOLD=false},"ARTNAME");
</cfscript>
<cfinclude template="navigation.cfm"/>
<cfoutput>
<ul><cfloop array="#art#" index="i">
	<li><a href="item.cfm?item=#i.getARTID()#">Preview</a> #i.getARTNAME()# @ #dollarFormat(i.getPRICE())#</li></cfloop>
</ul>
</cfoutput>
<!--- Example: 1_15.cfm --->
<!--- Processing --->
<cfparam name="url.speed" default="10">
<cfparam name="url.acceleration" default="0">

<cfscript>
myCar = structNew();	
myCar.color = "blue";
myCar.speed = url.speed + url.acceleration;
</cfscript>

<!--- Content --->
<cfoutput>
<a href="?acceleration=-1&speed=#myCar.speed#">Slower</a>
&nbsp;
<a href="?speed=#myCar.speed#">Cruise</a>
&nbsp;
<a href="?acceleration=1&speed=#myCar.speed#">Faster</a><br />

<cfdump var="#myCar#" label="My Car">
</cfoutput>


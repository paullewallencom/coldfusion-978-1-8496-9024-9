<!--- Example: 1_14.cfm --->
<!--- Processing --->
<cfparam name="url.counter" default="10">
<cfparam name="url.calculate" default="0">

<cfset url.counter +=  url.calculate>

<!--- Content --->
<cfoutput>
I have #url.counter# cars.<br />

<a href="?calculate=1&counter=#url.counter#">Add One.</a><br />
<a href="?calculate=-1&counter=#url.counter#">Subtract One.</a><br />
</cfoutput>


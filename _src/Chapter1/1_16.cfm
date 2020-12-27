<!--- Example: 1_16.cfm --->
<!--- Processing --->
<cfparam name="url.speed" default="10">
<cfparam name="url.acceleration" default="0">

<cfscript>
questions = "What is the speed limit?,What is a car?,How much is gas?";	
</cfscript>

<!--- Content --->
<cfoutput>
The second question is:<br />
&nbsp;&nbsp;&nbsp; #listGetAt(questions,2)#
</cfoutput>


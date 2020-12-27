<!--- Example: 1_3.cfm --->
<!--- Processing --->
<cfscript>
myQuestion = "This is my question.";
myAge = 27;

myQuestion = #myQuestion# & " Is this a string?";
myAge += 1;
</cfscript>

<!--- Content --->
<cfoutput>
myQuestion is (#myQuestion#)<br />
myAge is (#myAge#)<br />
</cfoutput>

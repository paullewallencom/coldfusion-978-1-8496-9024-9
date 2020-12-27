<!--- Example: 1_5.cfm --->
<!--- Processing --->
<cfscript>
myQuestion = "This is my question.";

myQuestion = myQuestion & " Is THIS a string?";
location = find("this",myQuestion);
</cfscript>

<!--- Content --->
<cfoutput>
myQuestion is (#myQuestion#)<br />
Location of "this" is (#location#) characters from the start of the string.<br />
</cfoutput>

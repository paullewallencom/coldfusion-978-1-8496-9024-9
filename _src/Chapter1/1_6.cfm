<!--- Example: 1_6.cfm --->
<!--- Processing --->
<cfscript>
myQuestion = "This is my question.";

myQuestion = myQuestion & " Is THIS a string?";
location = findNoCase("this",myQuestion);
location2 = findNoCase("this",myQuestion,location+1);
</cfscript>

<!--- Content --->
<cfoutput>
myQuestion is (#myQuestion#)<br />
Location of "this" is (#location#) characters from the start of the string.<br />
The second "this" is located at position (#location2#).<br />
</cfoutput>


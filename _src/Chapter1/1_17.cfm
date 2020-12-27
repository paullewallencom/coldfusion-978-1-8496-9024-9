<!--- Example: 1_17.cfm --->
<!--- Processing --->
<cfparam name="url.question" default="What is the speed limit?">

<cfscript>
questions = "What is the speed limit?,What is a car?,How much is gas?";
answers = "55,Depends who you ask!,more than before";	
myQuestion = listContains(questions,url.question);
</cfscript>

<!--- Content --->
<cfoutput>
<strong>#listGetAt(questions,myQuestion)#</strong><br />
Answer:&nbsp; #listGetAt(answers,myQuestion)#<br /><br />
</cfoutput>

All Questions
<hr />
<cfloop list="#questions#" index="iQuestion">
	<cfoutput>
		<strong>Q</strong>: <a href="?question=#iQuestion#">#iQuestion#</a><br />
	</cfoutput>
</cfloop>
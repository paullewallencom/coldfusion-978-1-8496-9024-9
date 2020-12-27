<!--- Example: 1_18.cfm --->
<!--- Processing --->
<cfparam name="url.question" default="1">

<cfscript>
question = arrayNew(1);
question[1] = "What is the speed limit?";
question[2] = "What is a car?";
question[3] = "How much is gas?";
answer = arrayNew(1);
answer[1] = "55";	
answer[2] = "Depends who you ask!";	
answer[3] = "more than before";	
</cfscript>

<!--- Content --->
<cfoutput>
<strong>#question[url.question]#</strong><br />
Answer:&nbsp; #answer[url.question]#<br /><br />
</cfoutput>

All Questions
<hr />
<cfloop from="1" to="#arrayLen(question)#" index="iQuestion">
	<cfoutput>
		<strong>Q</strong>: <a href="?question=#iQuestion#">#question[iQuestion]#</a><br />
	</cfoutput>
</cfloop>
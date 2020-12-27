<!--- Example: 1_22.cfm --->
<!--- Processing --->
<cfparam name="url.faq" default="">

<cfscript>
faq = arrayNew(1);
faq[1] = structNew();
faq[1].question = "What is the speed limit?";
faq[1].answer = "55";	
faq[1].id = 'a';
faq[2] = structNew();
faq[2].question = "What is a car?";
faq[2].answer = "Depends who you ask!";	
faq[2].id = 'b';
faq[3] = structNew();
faq[3].question = "How much is gas?";
faq[3].answer = "more than before";	
faq[3].id = 'c';
</cfscript>
<cfswitch expression="#url.faq#">
	<cfcase value="b">
		<cfset question = faq[2].question>
		<cfset answer = faq[2].answer>
	</cfcase>
	<cfcase value="c">
		<cfset question = faq[3].question>
		<cfset answer = faq[3].answer>
	</cfcase>
	<cfdefaultcase>
		<cfset question = faq[1].question>
		<cfset answer = faq[1].answer>
	</cfdefaultcase>
</cfswitch>

<!--- Content --->
<cfoutput>
<strong>#question#</strong><br />
Answer:&nbsp; #answer#<br /><br />
</cfoutput>

All Questions
<hr />
<cfloop from="1" to="#arrayLen(faq)#" index="iFAQ">
	<cfoutput>
		<strong>Q</strong>: <a href="?faq=#faq[iFAQ].id#">#faq[iFAQ].question#</a><br />
	</cfoutput>
</cfloop>
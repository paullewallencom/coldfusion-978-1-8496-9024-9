<!--- Example: 1_19.cfm --->
<!--- Processing --->
<cfparam name="url.faq" default="1">

<cfscript>
faq = arrayNew(1);
faq[1] = structNew();
faq[1].question = "What is the speed limit?";
faq[1].answer = "55";	
faq[2] = structNew();
faq[2].question = "What is a car?";
faq[2].answer = "Depends who you ask!";	
faq[3] = structNew();
faq[3].question = "How much is gas?";
faq[3].answer = "more than before";	
</cfscript>

<!--- Content --->
<cfoutput>
<strong>#faq[url.faq].question#</strong><br />
Answer:&nbsp; #faq[url.faq].answer#<br /><br />
</cfoutput>

All Questions
<hr />
<cfloop from="1" to="#arrayLen(faq)#" index="iFAQ">
	<cfoutput>
		<strong>Q</strong>: <a href="?faq=#iFAQ#">#faq[iFAQ].question#</a><br />
	</cfoutput>
</cfloop>
<cfdump var="#faq#">
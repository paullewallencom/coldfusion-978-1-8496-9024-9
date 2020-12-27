<!--- Example: 1_2.cfm --->
<!--- Proccessing --->
<cfset myQuestion = "What is a variable?">
<cfset myAnswer = "Variables are named storage containers inside programming languages. Just think of variables as any type of named container holding any type of stored content. You simply name the container and store the content. Later you retrieve the content by using the same name.">

<!--- Content --->
<cfoutput>
<div>
	<h3>Question: #myQuestion#</h3>
	<p>
		<strong>Answer:</strong>
	</p>
	<p>
		#myAnswer#
	</p>
	<p>#timeFormat(now())#</p>
</div>
</cfoutput>
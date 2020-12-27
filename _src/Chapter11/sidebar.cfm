<!--- sidebar base tag --->
<cfswitch expression="#thisTag.executionMode#">
	
	<cfcase value="start">
		<!--- No code here at this time.  --->
	</cfcase>
	
	<cfcase value="end">
		<cfoutput>
<div id="sideBar">
#thisTag.generatedContent#
</div>
		</cfoutput>
		<cfset thisTag.generatedContent = "">
	</cfcase>
	
</cfswitch>
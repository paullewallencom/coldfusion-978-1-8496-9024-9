<!--- navbar base tag --->
<cfswitch expression="#thisTag.executionMode#">
	
	<cfcase value="start">
		<cfparam name="attributes.layout" default="default">
		<cfparam name="attributes.title" default="">
		<cfparam name="attributes.author" default="">
		<cfparam name="attributes.description" default="">
		<cfparam name="attributes.keywords" default="">
		<cfparam name="attributes.generator" default="ColdFusion Custom Skin Tags">
	</cfcase>
	
	<cfcase value="end">
		<cfinclude template="layout_#attributes.layout#.cfm">
		<cfset thisTag.generatedContent = "">
	</cfcase>
	
</cfswitch>
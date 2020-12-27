<!--- sidebar_item tag --->
<cfswitch expression="#thisTag.executionMode#">

  <cfcase value="start">
    <cfset AncestorTags = getBaseTagList()>
    <cfif NOT listFindNoCase(AncestorTags,"cf_sidebar_section")>
      <cfthrow 
        type="customTag.skin"
        detail="You must nest this tag (sidebar_item) inside a sidebar_section tag."
		message="Improperly nested tag.">
    </cfif>
	<cfparam name="attributes.link" default="">
  </cfcase>

  <cfcase value="end">
	<cfoutput><cfif attributes.link NEQ "">
    <li><a href="#attributes.link#">#thisTag.generatedContent#</a></li>
	<cfelse>
    <li>#thisTag.generatedContent#</li>
	</cfif>
	</cfoutput>
	<cfset thisTag.generatedContent = "">
  </cfcase>
	
</cfswitch>
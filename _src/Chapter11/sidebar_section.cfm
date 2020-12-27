<!--- sidebar_section tag --->
<cfswitch expression="#thisTag.executionMode#">

  <cfcase value="start">
    <cfset AncestorTags = getBaseTagList()>
    <cfif NOT listFindNoCase(AncestorTags,"cf_sidebar")>
      <cfthrow 
        type="customTag.skin"
        detail="You must nest this tag (sidebar_section) inside a sidebar tag."
		message="Improperly nested tag.">
    </cfif>
	<cfset baseTagData = getBaseTagData("cf_sidebar")>
	<cfparam name="attributes.title" default="">
  </cfcase>

  <cfcase value="end">
	<cfoutput>
  <div class="relatedLinks">
    <h3>#attributes.title#</h3>
    <ul>
 #thisTag.generatedContent#
    </ul>
  </div>
	</cfoutput>
	<cfset thisTag.generatedContent = "">
  </cfcase>
	
</cfswitch>
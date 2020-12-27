<cfset data = attributes.data>
<cfparam name="data.available" default="true">
<cfoutput>
	<li<cfif NOT data.available> style="color:red;"</cfif>>
		#data.display# is item #data.__meta__.item#</li>
</cfoutput>

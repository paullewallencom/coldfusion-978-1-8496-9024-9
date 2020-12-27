<cfset data = entityLoad("art")>
<cfoutput>
<cfloop from="1" to="#arrayLen(data)#" index="iRow">
Art :	#data[iRow].getArtName()#<br/>
</cfloop>
</cfoutput>
<cfdump var="#data#">
<cfscript>
data = entityLoad("art");
</cfscript>
<!---
<cfdump var="#data#">
--->
<cfoutput>
<cfloop from="1" to="#arrayLen(data)#" index="iRow">
Artist :	#data[iRow].getArtName()#<br/>
</cfloop>
</cfoutput>
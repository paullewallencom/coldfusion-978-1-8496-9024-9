<cftry>
	<cfscript>
	art = entityLoad("art");
	artist = entityLoad("artist");
	paint = entityLoad("media",1,true);
	sculpt = entityLoad("media",2,true);
	// art[1].setMedia(paint);
	</cfscript>
	<!---
	--->
	<cfdump var="#artist#" expand="false" >
	<cfdump var="#art[1]#">
	<cfdump var="#art[2]#">
	<cfdump var="#art[6]#">
	<cfdump var="#art[7]#">
	<cfdump var="#art[8]#">
	<cfoutput>
	<cfloop from="1" to="#arrayLen(art)#" index="iRow">
	Art :	#art[iRow].getArtName()#<br/>
	</cfloop>
	</cfoutput>
<cfcatch type="Any" >
	<cfdump var="#cfcatch#">
</cfcatch>
</cftry>

<cfscript>
art = entityLoad("art");
piece = entityLoadByPK("art",4);
</cfscript>
<cfoutput>
Art : <br>
(piece) = #piece.getArtName()#<br>
(art[4]) = #art[4].getArtName()#<br>
<hr>
<cfset piece.setArtName("PAULO_updated")>
(piece) = #piece.getArtName()#<br>
(art[4]) = #art[4].getArtName()#<br>
</cfoutput><cfdump var="#piece#">
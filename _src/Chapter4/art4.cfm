<cfscript>
art = entityLoad("art",3,true);
artist = art.getArtist();
media = art.getMedia();
</cfscript>
<cfdump var="#media#" top="2">
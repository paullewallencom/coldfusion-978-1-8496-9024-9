<cfscript>
art = entityLoadByPK("ART",URL.item);
</cfscript>
<cfinclude template="navigation.cfm"/>
<cfoutput>
<h1>Item Preview Page</h1>
<h2>#art.getArtName()#</h2>
<div>
	by #art.getArtist().getFirstName()# #art.getArtist().getLastName()#
</div>
<div>
	Media: #art.getMedia().getMediaType()#
</div>
<div>
	Price: #dollarFormat(art.getPrice())#
</div>
<div>
	<cfif art.getIsSold()>
		<strong>Already Sold</strong>
	<cfelse>
		<a href="cart.cfm?buy=#art.getArtID()#">Buy #art.getArtName()#</a>
	</cfif>
</cfoutput>
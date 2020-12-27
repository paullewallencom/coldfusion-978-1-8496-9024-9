<h2>Ticket Reservations</h2>
<cfif url.purchaser NEQ "" and url.forDay NEQ "">
	<cfoutput>
		We have a ticket reserved for #url.purchaser# for the date of #url.forDay#.
	</cfoutput>
<cfelse>
	Enter a name and date for a ticket reservation.
</cfif>
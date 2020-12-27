<cfform id="myForm" format="html">
	This is my edit box.<br />
	<cfinput type="text" name="myText">
</cfform>
<hr />
And this is the bound div container.<br />
<cfdiv bind="cfc:bindsource.getDivContent({myText})"></cfdiv>
<cfform id="myForm" format="html">
	This is my edit box.<br />
	<cfinput type="text" name="myText" class="test">
</cfform>
<hr />
And this is the bound div container.<br />
<cfdiv bind="{myText.class@keyup}.{myText}"></cfdiv>
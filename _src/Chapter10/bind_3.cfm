<cfform id="myForm" format="html">
	This is my edit box.<br />
	<cfinput type="text" name="myText">
</cfform>
<hr />
And this is the bound div container.<br />
<cfdiv bind="javascript:updateDiv({myText})"></cfdiv>
<script>
updateDiv = function(myEdit){
	return 'This is the result that came from the JavaScript function with the edit box sending "<strong>'+myEdit+'</strong>"';
}
</script>
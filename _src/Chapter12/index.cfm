<cfimport prefix="coop" taglib="/share/tags/coop" />
<coop:coop>
<cfoutput>
<a href="intro.cfm" target="_blank">Introduction</a>
<br />
<a href="separation.cfm" target="_blank">Separation</a>
<br />
<a href="list.cfm" target="_blank">List Elements</a>
<br />
<a href="form.cfm" target="_blank">Forms</a>
<br />
<a href="mode.cfm" target="_blank">Modes</a>
<br />
<a href="style.cfm" target="_blank">Style</a> (handling styles via layout page)
<br />
<a href="render.cfm" target="_blank">Custom Rendering</a>
<br />
<a href="jui.cfm" target="_blank">jQuery UI</a>
<br />
<coop:checkboxList id="next" data="editMode, showMode, shared co-processor, events { onPageStart + onFirstCall + onCallBack + beforeViewCall + onPageEnd }, data intuition/handling, built in functions" label="next chapter" />
<coop:text id="notes">
Make sure the list field does not require link fields<br />
Make sure all the form tags support proper (showModes, editModes, allowBreak)<br />
Make sure empty "non-edit" mode inserts non-breaking space<br />

</coop:text>
</cfoutput>
</coop:coop>
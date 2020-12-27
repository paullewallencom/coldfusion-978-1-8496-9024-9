<cfImport tagLib="/share/skins/tags/" prefix="cfish" /><cfscript>
sos.bufferContent.paramSimpleContent("pageTitle","SOSensible");
sos.bufferContent.paramSimpleContent("keywords","sosensible,sos,john farrar");
sos.bufferContent.paramSimpleContent("description","SOSensible");

siteSkin = _API.cfish.getSkin();
/*
sharePath = _API.site.get_sharePath();
templatePath = _API.site.get_templatePath();
*/
// sos.bufferContent.addHeadContent(type:'js',src:'/share/js/jquery/jquery-1.4.1.js',id:'jquery');
sos.bufferContent.addHeadContent(type:'css',src:'/share/js/jquery/ui/css/ui.all.css');

sos.bufferContent.addHeadContent(type:'js',content:'
	<script>
		jQuery(document).ready(function(){
			
		});
	</script>',after:'jquery');
</cfscript>
<cfish:layout skin="#siteSkin#" cfish="#_API.cfish#"
	css="#sos.bufferContent.getHeadCSSContent()#"
	js="#sos.bufferContent.getHeadJSContent()#"
	title="#sos.bufferContent.getSimpleContent("pageTitle")#"
	keywords="#sos.bufferContent.getSimpleContent('keywords')#"
	description="#sos.bufferContent.getSimpleContent('description')#">

<cfish:block name="body"><div class="padding"><cfoutput>#sos.content#</cfoutput></div></cfish:block>

</cfish:layout>
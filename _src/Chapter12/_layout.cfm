<cfImport tagLib="/share/skins/tags/" prefix="cfish" /><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<cfscript>
skin=false;

sos.bufferContent.paramSimpleContent("pageTitle","CF8DT Book");
sos.bufferContent.paramSimpleContent("keywords","coop,ColdFusion,custom tags");
sos.bufferContent.paramSimpleContent("description","This is the chpater talking about the power of creating and using external libraries.");

if(skin){
siteSkin = _API.cfish.getSkin();
/*
sharePath = _API.site.get_sharePath();
templatePath = _API.site.get_templatePath();
*/
sos.bufferContent.addHeadContent(type:'js',src:'/share/js/jquery/jquery-1.4.1.js',id:'jquery');
sos.bufferContent.addHeadContent(type:'css',src:'/share/js/jquery/ui/css/ui.all.css');

sos.bufferContent.addHeadContent(type:'js',content:'
	<script>
		jQuery(document).ready(function(){
			
		});
	</script>',after:'jquery');
}
</cfscript>
<cfif skin>
<cfish:layout skin="#siteSkin#" cfish="#_API.cfish#"
	css="#sos.bufferContent.getHeadCSSContent()#"
	js="#sos.bufferContent.getHeadJSContent()#"
	title="#sos.bufferContent.getSimpleContent("pageTitle")#"
	keywords="#sos.bufferContent.getSimpleContent('keywords')#"
	description="#sos.bufferContent.getSimpleContent('description')#">

<cfish:block name="body"><div class="padding"><cfoutput>#sos.content#</cfoutput></div></cfish:block>

</cfish:layout>

<cfelse>

<cfoutput><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>#sos.bufferContent.getSimpleContent("pageTitle")#</title>
<meta name="keywords" content="#sos.bufferContent.getSimpleContent('keywords')#" />
<meta name="description" content="#sos.bufferContent.getSimpleContent('description')#" />
#sos.bufferContent.getHeadCSSContent()#
#sos.bufferContent.getHeadJSContent()#
</head>

<body>
#sos.content#
</body>
</html></cfoutput>

</cfif>
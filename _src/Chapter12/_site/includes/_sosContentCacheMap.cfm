<cfscript>
sosContentCacheMap = [
	{
		name = "jQuery",
		type = "js",
		src = "/share/js/jquery/jquery-1.4.1.js"
	},
	{
		name = "jQueryUI",
		after = "jQuery",
		type = "js",
		src = "/share/js/jquery/ui/minified/jquery-ui.min.js"
	},
	{
		name = "jq_bgiframe",
		after = "jQuery",
		type = "js",
		src = "/share/js/jquery/external/bgiframe/jquery.bgiframe.min.js"
	},
	{
		name = "jq_cookie",
		after = "jQuery",
		type = "js",
		src = "/share/js/jquery/external/cookie/jquery.cookie.min.js"
	},
	{
		name = "EXTJS",
		after = "jQuery",
		type = "js",
		src = "/share/js/ext/ext-all.js"
	},
	{
		name = "jui_css",
		type = "css",
		src = "/share/js/jquery/ui/css/ui.all.css"
	}
];
</cfscript>
<cfoutput><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>#attributes.title#</title><cfif attributes.author NEQ "">
	<meta name="author"></cfif><cfif attributes.description NEQ "">
	<meta name="description"></cfif><cfif attributes.generator NEQ "">
	<meta name="generator"></cfif><cfif attributes.keywords NEQ "">
	<meta name="keywords"></cfif>
	<link rel="stylesheet" href="left.css" type="text/css" />
</head>
<body>

<cf_header />

<div id="content">#thisTag.generatedContent#</div>

<cf_sidebar>
	<cf_sidebar_section title="Custom Tags">
		<cf_sidebar_item link="##">Page</cf_sidebar_item>
		<cf_sidebar_item link="##">Sidebar</cf_sidebar_item>
		<cf_sidebar_item link="##">Header</cf_sidebar_item>
		<cf_sidebar_item link="##">Footer</cf_sidebar_item>
	</cf_sidebar_section>
	<cf_sidebar_section title="CFCs">
		<cf_sidebar_item link="##">Database</cf_sidebar_item>
		<cf_sidebar_item link="##">Business Logic</cf_sidebar_item>
		<cf_sidebar_item link="##">Inheritance</cf_sidebar_item>
	</cf_sidebar_section>
</cf_sidebar>

<cf_footer />

</body>
</html></cfoutput>
<cfsilent>
<!--- 
	-------------------------------------------------------------
	cf_SelectSwap Demo Template
	
	This page illustrates how to use the SelectSwap custom tag.
	
	http://www.lifelikeweeds.com/tech/
	-------------------------------------------------------------		
--->

<cfparam name="form.selectSwapInstanceOne" default="" />
<cfparam name="form.selectSwapInstanceTwo" default="" />
<cfparam name="form.selectSwapInstanceOne_display" default="" />
<cfparam name="form.selectSwapInstanceTwo_display" default="" />

<cfimport prefix="controls" taglib="../customtags" />

<cfset rowCount = 30 />
<cfset dataQuery = QueryNew("display,value") />

<cfloop from="1" to="#rowCount#" index="i">
	<cfset QueryAddRow(dataQuery) />
	<cfset QuerySetCell(dataQuery, "display", "Entry #i#") />
	<cfset QuerySetCell(dataQuery, "value", i) />
</cfloop>
</cfsilent><html>
<head>
	<style type="text/css">
		h3 { margin: 2em 0 0 0; }
	</style>
	<link href="selectSwap.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>cf_selectSwap Example</h1>

<form method="post" >
<h3>Swap List Horizontal</h3>
<controls:selectSwap id="selectSwapInstanceOne" querySource="#dataQuery#" listSelected="#form.selectSwapInstanceOne#" DisplayMode="horizontal" />

<h3>Swap List Vertical</h3>
<controls:selectSwap id="selectSwapInstanceTwo" querySource="#dataQuery#" listSelected="#form.selectSwapInstanceTwo#" DisplayMode="vertical" />

<p style="margin:2em 0;"><input type="submit" value="Submit"></p>

<cfif IsDefined("form.selectSwapInstanceOne") AND IsDefined("form.selectSwapInstanceTwo")>
	<h3>Form Fields</h3>
	<cfdump var="#form#" />
		
</cfif>

</form>

</body>
</html>
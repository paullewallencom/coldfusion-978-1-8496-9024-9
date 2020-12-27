<cfcomponent extends="org.cfcunit.framework.testCase" output="no" hint="This is the unit test for the sosXML class.">
	
	<cfscript>
	variables.testXML = "";
	</cfscript>
	
	<cffunction name="setUp" access="private" returntype="void">
	<cfscript>
	variables.oXML = createObject("component","sosxml");
	variables.testXML='<grandpa surname="ourSurName" age="67" vocation="carpenter">
	<parents>
		<mom />
		<dad>
		Here is some text for checking.
		</dad>
		<children>
			<son />
			<son />
			<daughter />
		</children>
	</parents>
</grandpa>';
	</cfscript>
	</cffunction>
	
	<!--- childAdd --->
	<cffunction name="test_childAdd" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		variables.oXML.childAdd(myXML,myXML.grandpa,"anudda");
		variables.oXML.childAdd(myXML,myXML.grandpa.parents.children,"daughter");
		</cfscript>
		
		<cfset assertEqualsNumber(2,arrayLen(myXML.grandpa.XmlChildren))>
		<cfset assertEqualsString("anudda",myXML.grandpa.XmlChildren[2].XmlName)>
		<cfset assertEqualsNumber(4,arrayLen(myXML.grandpa.parents.children.XmlChildren))>
		
	</cffunction>
	
	<!--- childrenCount --->
	<cffunction name="test_childrenCount" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		
		assertEqualsNumber(1,variables.oXML.childrenCount(myXML.grandpa));
		assertEqualsNumber(0,variables.oXML.childrenCount(myXML.grandpa.parents.mom));
		assertEqualsNumber(3,variables.oXML.childrenCount(myXML.grandpa.parents.children));
		</cfscript>
		
	</cffunction>
	
	<!--- childrenDelete --->
	<cffunction name="test_childrenDelete" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		variables.oXML.childrenDelete(myXML.grandpa.parents.children,"son");
		
		assertEqualsNumber(1,arrayLen(myXML.grandpa.parents.children.XmlChildren));
		
		myXML = xmlParse(variables.testXML);
		assertEqualsNumber(3,arrayLen(myXML.grandpa.parents.children.XmlChildren));
		
		variables.oXML.childrenDelete(myXML.grandpa.parents.children,"son,daughter");
		assertEqualsNumber(0,arrayLen(myXML.grandpa.parents.children.XmlChildren));
		</cfscript>
		
	</cffunction>
	
	<!--- childrenExist --->
	<cffunction name="test_childrenExist" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		</cfscript>
		
		<cfset assertTrue(variables.oXML.childrenExist(myXML.grandpa,"parents"))>
		<cfset assertFalse(variables.oXML.childrenExist(myXML.grandpa,"vocation2"))>
		<cfset assertTrue(variables.oXML.childrenExist(myXML.grandpa.parents.children,"daughter,son"))>
		<cfset assertFalse(variables.oXML.childrenExist(myXML.grandpa.parents.children,"daughter,son,other"))>
		
	</cffunction>
	
	<!--- childrenGet --->
	<cffunction name="test_childrenGet" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		var myChildren = myXML.grandpa.parents.children.XmlChildren;
		var myTestChildren = variables.oXML.childrenGet(myXML.grandpa.parents.children);
		var childrenMatched = true;
		</cfscript>
		
		<cfset assertTrue(isStruct(myTestChildren))>
		
	</cffunction>

	<!--- elementSetText --->
	<cffunction name="test_elementSetText" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		variables.oXML.elementSetText(myXML.grandpa.parents.mom,"I make home work. (Our house and for the children's school!)");
		</cfscript>
		
		<cfset assertEqualsString(trim(myXML.grandpa.xmlText),"")>
		<cfset assertEqualsString("I make home work. (Our house and for the children's school!)",trim(myXML.grandpa.parents.mom.xmlText))>
		<cfset assertEqualsString("Here is some text for checking.",trim(myXML.grandpa.parents.dad.xmlText))>

	</cffunction>

	<!--- elementGetText --->
	<cffunction name="test_elementGetText" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		</cfscript>
		
		<cfset assertEqualsString("",trim(variables.oXML.elementGetText(myXML.grandpa.parents.mom)))>
		<cfset assertEqualsString("Here is some text for checking.",trim(variables.oXML.elementGetText(myXML.grandpa.parents.dad)))>

	</cffunction>

	<!--- elementHasText --->
	<cffunction name="test_elementHasText" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		</cfscript>
		
		<cfset assertFalse(variables.oXML.elementHasText(myXML.grandpa.parents.mom))>
		<cfset assertTrue(variables.oXML.elementHasText(myXML.grandpa.parents.dad))>

	</cffunction>
	
	<!--- attributesExist --->
	<cffunction name="test_attributesExist" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		</cfscript>
		
		<cfset assertTrue(variables.oXML.attributesExist(myXML.grandpa,"vocation"))>
		<cfset assertFalse(variables.oXML.attributesExist(myXML.grandpa,"vocation2"))>
		
	</cffunction>
	
	<!--- attributesDelete --->
	<cffunction name="test_attributesDelete" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		var xml_Root = variables.oXML.attributesDelete(myXML.grandpa,"vocation");
		</cfscript>
		
		<cfset assertFalse(structKeyExists(myXML.grandpa.XmlAttributes,"vocation"))>
		
	</cffunction>
	
	<!--- elementGetName --->
	<cffunction name="test_elementGetName" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		</cfscript>
		
		<cfset assertEqualsString("parents",variables.oXML.elementGetName(myXML.grandpa.parents))>
		<cfset assertEqualsString("parents",variables.oXML.elementGetName(myXML.grandpa.XmlChildren[1]))>
		
	</cffunction>
	
	<!--- attributeSet --->
	<cffunction name="test_attributeSet" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		variables.oXML.attributeSet(myXML.grandpa,"vocation","framer");
		</cfscript>
		
		<cfset assertEqualsString("ourSurName",myXML.grandpa.xmlAttributes.surname)>
		<cfset assertEqualsString("framer",myXML.grandpa.xmlAttributes.vocation)>
		
	</cffunction>
	
	<!--- attributeParam --->
	<cffunction name="test_attributeParam" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		variables.oXML.attributeParam(myXML.grandpa,"vocation","framer");
		variables.oXML.attributeParam(myXML.grandpa,"vocation2","framer");
		</cfscript>
		
		<cfset assertEqualsString("carpenter",myXML.grandpa.xmlAttributes.vocation)>
		<cfset assertEqualsString("framer",myXML.grandpa.xmlAttributes.vocation2)>
		
	</cffunction>
	
	<!--- attributeGet --->
	<cffunction name="test_attributeGet" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		</cfscript>
		
		<cfset assertEqualsString(myXML.grandpa.XmlAttributes.surname,variables.oXML.attributeGet(myXML.grandpa,"surname"))>
		
	</cffunction>
	
	<!--- attributesList --->
	<cffunction name="test_attributesList" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		</cfscript>
		
		<cfset assertEqualsString("age,surname,vocation",variables.oXML.attributesList(myXML.grandpa))>
		
	</cffunction>
	
	<!--- attributesGetStruct --->
	<cffunction name="test_attributesGetStruct" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		var attrStruct = duplicate(myXML.grandpa.XmlAttributes);
		</cfscript>
		
		<cfset assertEqualsStruct(attrStruct,variables.oXML.attributesGetStruct(myXML.grandpa))>
		
	</cffunction>
	
	<!--- atributesCount --->
	<cffunction name="test_attributesCount" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		var xml_Root = variables.oXML.elementGetRoot(myXML);
		</cfscript>
		
		<cfset assertEqualsNumber(3,variables.oXML.attributesCount(xml_Root))>
		<cfset assertEqualsNumber(0,variables.oXML.attributesCount(myXML.grandpa.parents.dad))>
		
	</cffunction>

	<!--- getRoot --->
	<cffunction name="test_getRoot" returntype="void" access="public" output="no">
	
		<cfscript>
		var myXML = xmlParse(variables.testXML);
		var xml_Root = variables.oXML.elementGetRoot(myXML);
		</cfscript>
		
		<cfset assertEqualsString("grandpa",xml_Root.xmlName)>
		
	</cffunction>
	
</cfcomponent>
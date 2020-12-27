<cfcomponent displayname="xmlCFC">
	
	<!--- These are the attribute methods. --->
	<!--- * Returns the count of the passed in XML Element. --->
	<cffunction name="attributesCount" hint="Returns the count of the passed in XML Element." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfreturn structCount( xmlElement.XmlAttributes )>
	</cffunction>
	
	<!--- * Deletes an attribute from the passed in XML Element only if it exist. --->
	<cffunction name="attributesDelete" hint="Deletes an attribute from the passed in XML Element only if it exist." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfargument name="attributeNames" required="yes">
		<cfscript>
		var iAttr = "";
		</cfscript>
		<cfloop index="iAttr" list="#arguments.attributeNames#">
			<cfif structKeyExists(xmlElement.XmlAttributes,iAttr)>
				<cfset structDelete(xmlElement.XmlAttributes,iAttr)>
			</cfif>
		</cfloop>
	</cffunction>
	
	<!--- * Checks to see if the attributes exists in passed in XML Element. --->
	<cffunction name="attributesExist" hint="Checks to see if the attributes exists in passed in XML Element." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfargument name="attributeNames" required="yes">
		<cfscript>
		var myResult = true;
		var iAttr = "";
		</cfscript>
		<cfloop index="iAttr" list="#arguments.attributeNames#">
			<cfif NOT structKeyExists(xmlElement.XmlAttributes,iAttr)>
				<cfset myResult = false>
			</cfif>
		</cfloop>
		<cfreturn myResult>
	</cffunction>
	
	<!--- * Adds or Edits an attribute of passed in XML Element. --->
	<cffunction name="attributeSet" hint="Adds or Edits an attribute of passed in XML Element." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfargument name="attributeName" required="yes">
		<cfargument name="attributeValue" required="yes">
		<cftry>
		<cfif NOT structKeyExists(arguments.xmlELement,"XmlAttributes")>
			<cfset arguments.xmlElement.XmlAttributes = structNew()>
		</cfif>
		<cfset arguments.xmlElement.XmlAttributes[arguments.attributeName] = arguments.attributeValue>
			<cfcatch>
				<cfdump var="#cfcatch#">
				<cfdump var="#arguments.xmlElement#">
				<cfabort>
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!--- * Returns the value of an attribute of passed in XML Element. --->
	<cffunction name="attributeGet" hint="Returns the value of an attribute of passed in XML Element." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfargument name="attributeName" required="yes">
		<cfif structKeyExists(xmlElement.XmlAttributes,attributeName)>
			<cfreturn xmlElement.XmlAttributes[attributeName]>
		<cfelse>
			<cfreturn "">
		</cfif>
	</cffunction>
	
	<!--- * Adds an attribute to the passed in XML Element only if attribute doesn't exist. --->
	<cffunction name="attributeParam" hint="Adds an attribute to the passed in XML Element only if attribute doesn't exist." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfargument name="attributeName" required="yes">
		<cfargument name="attributeValue" required="yes">
		<cfif NOT structKeyExists(xmlElement.XmlAttributes,attributeName)>
			<cfset xmlElement.XmlAttributes[attributeName] = attributeValue>
		</cfif>
	</cffunction>
	
	<!--- * Returns the attributes structure of the XML Element. --->
	<cffunction name="attributesGetStruct" hint="Returns the attributes structure of the XML Element." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfreturn xmlElement.XmlAttributes>
	</cffunction>
	
	<!--- * Returns the list of attributes in an XML Element. --->
	<cffunction name="attributesList" hint="Returns the list of attributes in an XML Element." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfreturn structKeyList(xmlElement.XmlAttributes)>
	</cffunction>
	
	
	<!--- These are the child(ren) methods. --->
	<!--- * Adds a child element to the passed in XML Element. --->
	<cffunction name="childAdd" hint="Adds a child element to the passed in XML Element." output="no">
		<cfargument name="xmlStructure" required="yes">
		<cfargument name="xmlElement" required="yes">
		<cfargument name="newElementName" required="yes">
		<cfargument name="newElementNamespace" required="no" default="">
		<cfif arguments.newElementNamespace EQ ''>
			<cfset xmlElement.XmlChildren[arrayLen(xmlElement.XmlChildren)+1] = XMLElemNew(arguments.xmlStructure,arguments.newElementName)>
		<cfelse>
			<cfset xmlElement.XmlChildren[arrayLen(xmlElement.XmlChildren)+1] = XMLElemNew(arguments.xmlStructure,arguments.newElementNamespace,arguments.newElementName)>
		</cfif>
	</cffunction>
	
	<cffunction name="childListByAttribute" hint="Gets a specific named child or returns an empty array" output="no">
		<cfargument name="xmlDoc" required="yes">
		<cfargument name="path" required="yes">
		<cfargument name="attribute" required="yes">
		<cfscript>
		var myXSLT = '<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" indent="no"/>
	<xsl:template match="/">
		<xsl:for-each select="#arguments.path#">
			<xsl:if test="position() > 1">,</xsl:if>
			<xsl:value-of select="@#arguments.attribute#"/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>';
		var myList = xmlTransform(arguments.xmlDoc,myXSLT);
		</cfscript>
		<cfreturn myList>
	</cffunction>

	<!--- * Returns the count children elements for the passed in XML Element. --->
	<cffunction name="childrenCount" hint="Returns the count children elements for the passed in XML Element." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfreturn arrayLen( xmlElement.XmlChildren )>
	</cffunction>
	
	<!--- * Deletes a children elements from the passed in XML Element if it exist. --->
	<cffunction name="childrenDelete" hint="Deletes a child element from the passed in XML Element if it exist." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfargument name="childrenNames" required="yes">
		<cfscript>
		var iChild = "";
		var iChildNum = "";
		</cfscript>
		<cfloop index="iChild" list="#arguments.childrenNames#">
			<cfloop index="iChildNum" from="#arrayLen(xmlElement.XmlChildren)#" to="1" step="-1">
				<cfif xmlElement.XmlChildren[iChildNum].XmlName EQ iChild>
					<cfset arrayDeleteAt(xmlElement.XmlChildren,iChildNum)>
				</cfif>
			</cfloop>
		</cfloop>
	</cffunction>
	
	<!--- * Returns the count children elements for the passed in XML Element. --->
	<cffunction name="childrenExist" hint="Returns the count children elements for the passed in XML Element." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfargument name="children" required="no" default="">
		
		<cfscript>
		var hasChildren = iif( childrenCount(xmlElement) , true, false);
		var foundChild = false;
		var iChild = "";
		var iChildNum = "";
		</cfscript>
		<cfloop index="iChild" list="#arguments.children#">
			<cfset foundChild = false>
			<cfloop index="iChildNum" from="#arrayLen(xmlElement.XmlChildren)#" to="1" step="-1">
				<cfif xmlElement.XmlChildren[iChildNum].XmlName EQ iChild>
					<cfset foundChild = true>
				</cfif>
			</cfloop>
			<cfset hasChildren = hasChildren AND foundChild>
		</cfloop>
		<cfreturn hasChildren>
	
	</cffunction>
	
	<!--- * Returns the count children elements for the passed in XML Element. --->
	<cffunction name="childrenGet" hint="Returns the count children elements for the passed in XML Element." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfreturn xmlElement.XmlChildren>
	</cffunction>
	
	<!--- Element Management Methods --->	
	<!--- * Returns the name of the passed XML element. --->
	<cffunction name="elementGetName" access="public" returntype="string" hint="Returns the name of the passed XML element." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfreturn xmlElement.xmlName>
	</cffunction>

	<!--- * Returns a the root element of an XML Structure. --->
	<cffunction name="elementGetRoot" access="public" returntype="string" hint="Returns a the root element of an XML Structure." output="no">
		<cfargument name="xmlStructure" required="yes">
		<cfif isXMLRoot( arguments.xmlStructure[structKeyList( arguments.xmlStructure )] )>
			 <cfreturn arguments.xmlStructure[structKeyList( arguments.xmlStructure )]>
		</cfif>
	</cffunction>
	
	<!--- Returns the passed element text. --->
	<cffunction name="elementGetText" access="public" returntype="string" hint="Returns true if the passed element has XML text." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfreturn arguments.xmlElement.xmlText>
	</cffunction>
	
	<!--- Returns true if the passed element has XML text. --->
	<cffunction name="elementHasText" access="public" returntype="boolean" hint="Returns true if the passed element has XML text." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfif len(xmlElement.xmlText)>
			 <cfreturn true>
		<cfelse>
			 <cfreturn false>	
		</cfif>
	</cffunction>
	
	<!--- Sets the passed element text. --->
	<cffunction name="elementSetText" access="public" hint="Sets the passed element text." output="no">
		<cfargument name="xmlElement" required="yes">
		<cfargument name="xmlText" required="yes" type="string">
		<cfset xmlElement.xmlText = arguments.xmlText>
	</cffunction>
	
	<!--- File Handling Functions --->
	<cffunction name="xmlLoad" access="public" hint="Loads a file (use full directory path and file name) and parses it as XML structure." output="no">
		<cfargument name="file" required="true">
		<cfset var txtXML = "<root></root>">
		<cfset var returnXML = "">
		<cfif fileExists(arguments.file)>
			<cffile action="read" file="#arguments.file#" variable="txtXML">
		</cfif>
		<cfxml variable="returnXML"><cfoutput>#txtXML#</cfoutput></cfxml>
		<cfreturn returnXML>
	</cffunction>
	
	<cffunction name="xmlSave" access="public" hint="Saves a file (use full directory path and file name) and parses it as XML text file." output="no">
		<cfargument name="xml" required="true">
		<cfargument name="file" required="true">

		<cffile action="write" file="#arguments.file#"  output="#toString(arguments.xml)#">
	</cffunction>

</cfcomponent>
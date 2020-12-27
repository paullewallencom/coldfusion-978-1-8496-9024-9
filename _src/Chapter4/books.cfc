<xcfcomponent persistent="true" table="BOOKS" schema="APP" >
	<!---- properties ---->
	<cfproperty name="BOOKID" column="BOOKID" ormtype="int" fieldtype="id"  /> 
	<cfproperty name="AUTHORID" column="AUTHORID" ormtype="int"  /> 
	<cfproperty name="TITLE" column="TITLE" ormtype="string"  /> 
	<cfproperty name="BOOKDESCRIPTION" column="BOOKDESCRIPTION" ormtype="clob"  /> 
	<cfproperty name="BOOKIMAGE" column="BOOKIMAGE" ormtype="string"  /> 
	<cfproperty name="THUMBNAILIMAGE" column="THUMBNAILIMAGE" ormtype="string"  /> 
	<cfproperty name="ISSPOTLIGHT" column="ISSPOTLIGHT" ormtype="string"  /> 
	<cfproperty name="GENRE" column="GENRE" ormtype="string"  /> 
</xcfcomponent>

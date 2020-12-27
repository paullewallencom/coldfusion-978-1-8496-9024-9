<cfcomponent>
<cfset this.applicationManagement = true>
<cfset this.sessionManagement = true>
<cfset this.name = "myORMApplication_5">
<cfset this.ormenabled = "true">
<cfset this.datasource = "cfartgallery">
<!---- ORM Setting not suggeted for production use---->
<cfset this.ormsettings = {autorebuild="true"}>
</cfcomponent>

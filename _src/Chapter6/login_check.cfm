<cfparam name="form.user" default="">
<cfparam name="form.password" default="">
<cflogin>
	<cfif form.password EQ "demo">
		<cfset roles = "">
		<cfswitch expression="#form.user#">
			<cfcase value = "first">
				<cfset roles = "test">
			</cfcase>
			<cfcase value="admin">
				<cfset roles = "test,test2,test3">
			</cfcase>
		</cfswitch>
		<cfloginuser 
			name="#form.user#"
			password="#form.password#"
			roles="#roles#">
		<a href="checkUser.cfm">Back to checkUser.cfm page...</a>
		<!--- don't use with CFLogin 
		<cflocation url="checkUser.cfm" addtoken="false"> --->
		<script>location.href="checkUser.cfm";</script>
	<cfelse>
		Sorry but your user name and password are not correct.<br />
		<cfinclude template="login_form.cfm">
	</cfif>
</cflogin>
<cfparam name="form.user" default="">
<cfparam name="form.password" default="">
<cfoutput>
  <form action="login_check.cfm" method="post"> User:<br />
    <input name="user" type="text" value="#form.user#"><br />
      Password:<br />
    <input name="password" type="password" value="#form.password#">
    <br /><br />
    <input type="submit" value="Login">
  </form>
</cfoutput>

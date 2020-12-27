<cfcomponent extends="_Application">
	<cfscript>
	_init();
	</cfscript>
	
	<cffunction name="_defaults">
		<cfscript>
		// place your default custom settings here
		super._defaults();
		
		this.mapping['share'] = "C:\inetpub\common\share";
		
		REQUEST._temp.privateKey = "private_key";
		REQUEST._temp.appNameMinor = "ae";
		
		REQUEST._temp.skin = "sosensible";
		</cfscript>
	</cffunction>
	
	<cffunction name="_init">
		<cfscript>
		_defaults();
		super._init();
		/* --- modify if not standard ---
		if(REQUEST._api.hasSession){
			// session settings
			THIS.sessionManagement = true;
			THIS.sessionTimeout = _setTimeSpan(REQUEST._site.session.length);
			// client settings
			THIS.clientManagement = true;
			THIS.clientStorage = "cookie";
			// cookie settings
			THIS.setClientCookies = true;
			THIS.setDomainCookies = true;
		} else {
			// This application definition is for short sessions.
			// session settings
			THIS.sessionManagement = false;
			// client settings
			THIS.clientManagement = false;
			// cookie settings
			THIS.setClientCookies = false;
			THIS.setDomainCookies = false;
		}
		*/
		</cfscript>
	</cffunction>
	
</cfcomponent>
This is our index file. From here we have no special information on this page. We just dump the results of our 
application and session scopes to the page so the users can see what is happening. The best way to understand
it would be to open two different browsers. Remember this doesn't mean two windows of the same browser. It
means two different browsers.<br />
<br />
<cfdump var="#application#" label="Application Scope">
<br />
Review the variables and as you refresh the page for more understanding. Note that the application is set for two 
days and the session is set for ten seconds. Try opening the second browser and then not touching that window for over
ten seconds. Keep refreshing the other window and you will see after 10 seconds the other session will disappear as in the count
of sessions will decrease by one. This is becasue at the end of the session the onSessionEnd() method was run.<br />
<br />
<cfdump var="#session#" label="Session Scope">
<br />
Here is a link to the <a href="_test.cfm" target="_blank">_test.cfm</a> page. The page will not display because the 
Application.cfc onRequestStart() method blocks pages that start with an underscore. You will either get a popup window
or a new browser tab. After it loads and you see "nothing" close it because you know it works.
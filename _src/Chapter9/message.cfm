<html>
<head>
<script type="text/javascript">
//Function to to show result of a message box.
var showInputResult = function(btn,message){
	if(btn != "cancel" && message != ""){
		alert("You entered: "+message);
	} else {
		alert("Either no entry or you selected cancel.");
	}
}
//Function to show results of other message boxes.
var showBtnResult = function(btn){
	alert("You clicked button: "+btn);
}
//The button onClick handler displays the message boxes.
function showMB(msgbox) {
	ColdFusion.MessageBox.show(msgbox);
}
</script>
</head>
<body>
<cfform>
<p>Click a button display each message box type.</p>
<cfinput name="Prompt" type="button" value="Prompt"
	onclick="showMB('msgPrompt')">
<cfinput name="Prompt" type="button" value="Options"
	onclick="showMB('msgConfirm')">
<cfinput name="Prompt" type="button" value="Alert"
	onclick="showMB('msgAlert')">
</cfform>
<!--- message boxes --->
<cfmessagebox name="msgPrompt" type="prompt"
	message="Write a short description about yourself"
	labelOK="This is OK" labelCANCEL="Cancel this"
	callbackhandler="showInputResult" multiline="true"/>
<cfmessagebox name="msgConfirm" type="confirm"
	message="Is it OK to save the planet?"
	labelNO="Dont Save" labelYES="Sure"
	callbackhandler="showBtnResult"/>
<cfmessagebox name="msgAlert" type="alert"
	message="This is the ALERT message box!"
	callbackhandler="showBtnResult" />
</body>
</html>
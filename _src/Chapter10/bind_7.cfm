<cfajaxproxy bind="javascript:doCalc({calcType@click})">
<cfajaxproxy cfc="serverMath" jsclassname="remoteMath">
<cfform id="myForm" format="html">
	Enter Two Numbers.<br />
	<cfinput type="text" name="number1" id="number1"><br />
	<cfinput type="text" name="number2" id="number2"><br />
	<label for="calcAdd">
		<cfinput type="radio" value="add"
			name="calcType" id="calcAdd">
	Add</label><br />
	<label for="calcSubtract">
		<cfinput type="radio" value="subtract"
			name="calcType" id="calcSubtract">
	Subtract</label><br />
	<label for="calcMultiply">
		<cfinput type="radio" value="multiply"
			name="calcType" id="calcMultiply">
	Multiply</label><br />
	<label for="calcDivide">
		<cfinput type="radio" value="divide"
			name="calcType" id="calcDivide">
	Divide</label><br />
</cfform>

<script>
jsMath = new remoteMath();

doCalc = function(thisCalc){
	var number1 = parseFloat(document.getElementById('number1').value);
	var number2 = parseFloat(document.getElementById('number2').value);
	jsMath.setCallbackHandler(showResult);
	jsMath.setErrorHandler(showError);
	
	switch(thisCalc){
		case 'add':
			showResult(number1 + number2);
			break;
		case 'subtract':
			showResult(number1 - number2);
			break;
		case 'multiply':
			showResult(jsMath.doMultiply(number1,number2));
			break;
		case 'divide':
			showResult(jsMath.doDivide(number1,number2));
			break;
	}
}
showResult = function(result){
	alert(result);
}
showError = function(statusCode,statusMsg){
	alert("status: "+statusCode+"\n"+statusMsg);
}
</script>
<cfajaxproxy bind="javascript:doCalc({calcType@click})">
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
</cfform>

<script>
doCalc = function(thisCalc){
	var myResult = 0;
	var number1 = parseFloat(document.getElementById('number1').value);
	var number2 = parseFloat(document.getElementById('number2').value);
	
	switch(thisCalc){
		case 'add':
			myResult = number1 + number2;
			break;
		case 'subtract':
			myResult = number1 - number2;
			break;
	}
	alert(myResult);
}
</script>
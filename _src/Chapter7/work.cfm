<cfscript>
// single line comments like this
a = 5; // these can come at the end of lines also
/* This is the start of comments.
These comments can but do not have to span multiple lines.
This is the end of the comment segment. */

/*
a=7;
myLastName = "fred";
myList = "one,two,three,four,five";
for(i=1; i<=listLen(myList); i++){
	if(i==2) continue;
	if(i==4) break;
	writeOutput(i&"-"&listGetAt(myList,i)&"<br>");
}

myGrid = structNew();

structList = "";
for(item in CGI){
	structList = listAppend(structList,item);
	writeOutput("#item# #CGI[item]#<br>");
}
writeOutput(structList);


count = 0;
do {
	writeOutput(count);
	count++;
} while(count < 7);
writeOutput("<br>");
count = 0;
while(count < 7) {
	writeOutput(count);
	count++;
}
*/
</cfscript>




<cfscript>
try
{
  result = 7/0;
}
catch(any strCatch)
{
  writeDump(strCatch);
}

/*
myStruct = {
	name = 'Chevelot',
	maker = 'Chasey',
	tire = [
		'GoodTread',
		'GoodTread',
		'GoodTread',
		'GoodTread'
	],
	spare = 'MichaTread'
};

myArray = arrayNew(1);
myStruct = structNew();
myQuery = queryNew('field1,field2');

myArray = [];

myAoS = [
	{
		age=23,
		user='Tarra'
	},
	{
		age=42,
		user='Bob'
	},
	{
		age=37,
		user='Mary'
	}
];

a=7;
myName = mySonsFathersName = "Ted " & myLastName;
nameAgain = "Ted #myLastName#";

myName = "Brian O'Neal";
myName = 'Brian O''Neal';
altName = "O'Neal";
myName = "Brian #altName#";
myName = 'Brian' & " O'Neal";
*/
</cfscript>
<!---
<cfoutput>
#myName#<br/>
#mySonsFathersName#
</cfoutput>
--->

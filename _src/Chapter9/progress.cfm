<html>
<head>
<script>
startPBar = function(){
	ColdFusion.ProgressBar.start('exampleBar');
}
stopPBar = function(){
	ColdFusion.ProgressBar.stop('exampleBar');
}
progressComplete = function(){
	alert("Process complete.");
}
</script>
</head>
<body>
	<cfprogressbar name="exampleBar" interval="1000"
		bind="cfc:book_code.cf9dt.work.chapter9.progress.getStatus()"
		onComplete="progressComplete" />
	<br>
	<a href="javascript:startPBar();">Start Status Processing</a><br>
	<a href="javascript:stopPBar();">Stop Status Processing</a><br>
</body>
</html>
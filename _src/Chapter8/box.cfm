<html>
<head>
   <title>CFDiv Example</title>
</head>
<body>
<cflayout
      type="border"
      name="myLayout">
   <cflayoutarea name="region1" 
       position="top" align="center">
       <strong>Header Section</strong>
   </cflayoutarea>
   <cflayoutarea name="region3" 
       position="center">
   <cflayout name="myVBox" type="vbox">
      <cflayoutarea style="width:33%;""background-color:##FFDDDD;">
         <p>Box Region 1</p>
      </cflayoutarea>
      <cflayoutarea style="width:34%;""background-color:##DDFFDD;">
         <p>Box Region 2</p>
      </cflayoutarea>
      <cflayoutarea style="width:33%;""background-color:##DDDDFF;">
         <p>Box Region 3</p>
      </cflayoutarea>
   </cflayout>
   </cflayoutarea>
   <cflayoutarea name="region5" 
       position="bottom">
       Footer Section
   </cflayoutarea>
</cflayout>
</body>
</html>

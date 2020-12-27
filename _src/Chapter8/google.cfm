<div style="float:left;padding-left:7px;">
<cfmap name="map1"
centerlatitude="42.043423"
centerlongitude="-86.51531"
doubleclickzoom="true"
overview="false"
scrollwheelzoom="true"
showscale="true"
tip="My Map"
zoomlevel="5">
<cfmapitem name="loc_0"
markericon="marker_1.png" 
markerwindowcontent="This is content shown when marker is clicked."
latitude="42.54700"
longitude="-85.9438"
tip="Where Started"/>

</cfmap>
</div>
<div style="float:left;padding-left:7px;"> 
  <h2 id="locTitle">Add Places</h2>
  <form id="frmMarker">
  Label:<br/>
  <input type="text" name="label" id="label"/><br/>
  Address:<br/>
  <input type="text" name="address" id="address"/><br/>
  Message:<br/>
  <textArea id="message"></textArea><br/>
  <input type="submit" id="btnMarker" value="Add Marker" 
    onclick="addMarker();return false;"/>
  </form>
  <br/>
</div>
<script>
mmcfug_added = false;
markWindow = function(marker, latitude, logitude, address){
	var markerNum = marker.split("_")[1];
	var nMarker=
	{
		name:"loc_1",
		address:"Lansing, MI, USA",
		markericon:"marker_1.png",
		markerwindowcontent:"Mid-Michigan Flex/CFUGs",
		showmarkerwindow:true,
		tip:"MM CFUG"
	};
	if (!mmcfug_added) {
		ColdFusion.Map.addMarker('map1', nMarker);
		mmcfug_added = true;
		return "Location '2' is where we go for Adobe preview tours.";
	} else {
		return "This is where our local Adobe UG meets."
	}
}
</script>


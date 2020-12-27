<div style="float:left;">
<cfmap name="map1"
centerlatitude="42.043423"
centerlongitude="-86.51531"
doubleclickzoom="true"
overview="false"
scrollwheelzoom="true"
showscale="true"
tip="My Map"
markerbind="javascript:markWindow({cfmapname}, {cfmaplatitude}, {cfmaplongitude}, {cfmapaddress})"
zoomlevel="5">
<cfmapitem name="loc_0" 
showmarkerwindow="true" 
markericon="marker_0.png" 
latitude="42.014487"
longitude="-86.5194654"
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
<a href="javascript:ColdFusion.Map.setZoomLevel('map1', ++zoomLevelValue);">Zoom In</a><br/>
<a href="javascript:ColdFusion.Map.setZoomLevel('map1', --zoomLevelValue);">Zoom Out</a><br/>
<br/>
<form id="ctr">
New Address Center:<br/>
<input type="text" name="ctrAddress" id="ctrAddress"/><br/>
<input type="submit" id="btnCenter" value="Center Map" 
	onclick="mapCenter();return false;"/>
</form>
</div>

<script>
zoomLevelValue = 5;
mmcfug_added = false;
addMarker = function(){
	var newMarker = {
		address : document.getElementById('address').value,
		markerwindowcontent : document.getElementById('message').value,
		tip : document.getElementById('label').value,
		markercolor : "#DD0000",
		title : "New Marker"
	};
	ColdFusion.Map.addMarker('map1',newMarker);
	return false;
};
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

mapCenter = function(){
	var address = document.getElementById('ctrAddress').value;
	console.debug('have add req.');
	ColdFusion.Map.getLatitudeLongitude(address, setCenter);
	console.debug('sent add req.');
}
setCenter = function(latLng){
	var oMap = ColdFusion.Map.getMapObject('map1');
	console.debug(latLng);
	oMap.setCenter(new GLatLng(latLng.df,latLng.Ua), zoomLevelValue);
	return false;
}
</script>
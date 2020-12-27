<cfscript>
sos.bufferContent.addHeadContent(type:'css',src:'overlay-basic.css');
sos.bufferContent.addHeadContent(type:'css',src:'overlay-gallery.css');
sos.bufferContent.addHeadContent(type:'css',src:'scrollable-horizontal.css');
sos.bufferContent.addHeadContent(type:'css',src:'scrollable-buttons.css');
sos.bufferContent.addHeadContent(type:'js',src:'/share/js/jquery/tools/jquery-1.4.1.min.js',id:'jquery');
sos.bufferContent.addHeadContent(type:'js',src:'/share/js/jquery/tools/jquery.tools.min.js');

	/*
	<script src="http://cdn.jquerytools.org/1.1.2/full/jquery.tools.min.js"></script>
	*/
	sos.bufferContent.addHeadContent(type:'js',content:'
	<script>
		jQuery(document).ready(function(){
			// select the thumbnails and make them trigger our overlay 
			$("##thumbs a").overlay({      
				// each trigger uses the same overlay with the id "gallery"     
				target: "##gallery",      
				// optional exposing effect     
				expose: "##f1f1f1"
			
			// let the gallery plugin do its magic! 
			});
			$(".scrollable").scrollable({
				size:4
			});
		});
	</script>',after:'jquery');

</cfscript>

<!-- list of thumbnails -->
<div id="thumbs">
	<a href="images/Barn.JPG" title="This is a local barn.">
		<img src="images/th_Barn.JPG" /></a>
	<a href="images/Cactus.JPG" title="Cactus grows many places.">
		<img src="images/th_Cactus.JPG" /></a>
	<a href="images/Clouds.JPG" title="Clouds capture the imagination.">
		<img src="images/th_Clouds.JPG" /></a>
	<a href="images/shells.JPG" title="Ever collected shells?">
		<img src="images/th_shells.JPG" /></a>
	<a href="images/Sunset.JPG" title="Beautiful end to a day.">
		<img src="images/th_Sunset.JPG" /></a>
	<!-- and so on ... -->
</div>

<a class="prevPage browse left"></a>
<div class="scrollable"><div class="items">
	<img src="images/th_Cactus.JPG" />
	<img src="images/th_Barn.JPG" />
	<img src="images/th_Clouds.JPG" />
	<img src="images/th_shells.JPG" />
	<img src="images/th_Sunset.JPG" />
	
	<img src="images/Barn.JPG" />
	<img src="images/Cactus.JPG" />
	<img src="images/Sunset.JPG" />
	<img src="images/Clouds.JPG" />
	<img src="images/shells.JPG" />		
	
	<img src="http://farm4.static.flickr.com/3629/3323896446_3b87a8bf75_t.jpg" />
	<img src="http://farm4.static.flickr.com/3023/3323897466_e61624f6de_t.jpg" />
	<img src="http://farm4.static.flickr.com/3650/3323058611_d35c894fab_t.jpg" />
	<img src="http://farm4.static.flickr.com/3635/3323893254_3183671257_t.jpg" />
	<img src="http://farm4.static.flickr.com/3624/3323893148_8318838fbd_t.jpg" />

	<!-- and so on ... -->
</div></div>
<a class="nextPage browse right"></a>


<!-- overlay element -->
<div class="simple_overlay" id="gallery">
	<!-- "previous image" action -->
	<a class="prev">prev</a>
	<!-- "next image" action -->
	<a class="next">next</a>
	<!-- image information -->
	<div class="info"></div>
	<!-- load indicator (animated gif) -->
	<img class="progress" 
		src="http://static.flowplayer.org/tools/img/overlay/loading.gif" />
</div>

<cfoutput>
<div style="clear:both;"></div>
<hr>
#expandPath("../")#
<br>
#getHTTPDir()#
<br>
#getRelative(getCurrentTemplatePath())#
<br>
#getRelative(getBaseTemplatePath())#
<br>
<cfdump var="#server#">
</cfoutput>
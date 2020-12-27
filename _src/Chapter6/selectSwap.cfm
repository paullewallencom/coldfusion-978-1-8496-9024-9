<cfprocessingdirective suppresswhitespace="yes">
<cfsilent>
	<!--- 
		-------------------------------------------------------------
		cf_SelectSwap 
		v0.0.2	05/23/2007
		
		ColdFusion custom tag generates two select boxes, one with a set
		of available options and a second for selected options.
		
		When JavaScript is disabled, degrades to a single select box.
		
		CSS is stored in an external file. Set your own rules to customize for your site.
		This fileand its styles are not included with the custom tag. Include the style rules
		whereever you keep your site CSS.
		
		Attributes:
		* Id: Unique id for instance of the tag in a page. Each instance needs a new id.
		* QuerySource: Query of data to generate the available options. 
		* ValueField: Name of the value field in the source query.
		* DisplayField: Name of the display field in the source query.
		* SourceHeader: Text displays above source list.
		* SelectedHeader: Text displays above the selected list.
		* ListSelected: Comma-delim list of value field values to pre-select.
		
		Results:
		* form.#id# : List of selected options, values.
		* form.#id#_display : List of selected options, display text.

		http://www.lifelikeweeds.com/tech/
		
		Copyright 2007 Dave Konopka 
		
		Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at 
		
		http://www.apache.org/licenses/LICENSE-2.0 
		
		Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.		

	 	------------------------------------------------------------- 
	 --->
	<cfparam name="attributes.ValueField" default="value" />
	<cfparam name="attributes.DisplayField" default="display" />
	<cfparam name="attributes.SourceHeader" default="Source" />
	<cfparam name="attributes.SelectedHeader" default="Selected" />
	<cfparam name="attributes.ListSelected" default="" />
	<cfparam name="attributes.DisplayMode" default="horizontal" />
	<cfparam name="request.SelectSwapIdList" default="" />
	
	<!--- **********************************************************************
			Ensure required attributes have been provided  --->
	<cfif not IsDefined("attributes.QuerySource") or not IsQuery(attributes.QuerySource)>
		<cfthrow message="Custom tag selectSwap requires attribute QuerySource" />
	    <cfexit method = "exitTag" />
	</cfif>
	<cfif not ListContainsNoCase("horizontal,vertical",attributes.DisplayMode)>
		<cfthrow message="Custom tag selectSwap attribute DisplayMode accepts 'vertical' or 'horizontal' string values." />
	    <cfexit method = "exitTag" />
	</cfif>	
	<cfif not IsDefined("attributes.id")>
		<cfthrow message="Custom tag selectSwap requires 'id' attribute." />
	    <cfexit method = "exitTag" />
	<cfelseif ListContainsNoCase(request.SelectSwapIdList,attributes.id)>
		<cfthrow message="Another instance of custom tag selectSwap is already using the same 'id' attribute value within the same template." />
	    <cfexit method = "exitTag" />	
	<cfelse>
		<cfset request.SelectSwapIdList = ListAppend(request.SelectSwapIdList, attributes.id) />
	</cfif>
		
	<!--- **********************************************************************		
		Store attributes to local variables --->
	<cfset tagInstanceName = attributes.id />
	<cfset querySource = attributes.QuerySource />
	<cfset listSelected = attributes.listSelected />
	<cfset valueField = attributes.ValueField />
	<cfset displayField = attributes.DisplayField />
	<cfset sourceHeader = attributes.SourceHeader />
	<cfset selectedHeader = attributes.SelectedHeader />
	<cfset displayMode = attributes.DisplayMode />
	
	<!--- Ensure query is alpha sorted --->
	<cfquery name="querySource" dbtype="query">
		SELECT *, UPPER(#displayField#) as sort_field
		FROM querySource
		ORDER BY sort_field ASC
	</cfquery>
	
	<cfset sourceOptions = "" />
	<cfset selectedOptions = "" />
	<cfset noScriptOptions = "" />
	<cfset sourceCounter = 0 />
	<cfset selectedCounter = 0 />
	
	<!--- Build up options for select controls --->
	<cfloop query="querySource">
		<cfset sourceCounter = sourceCounter + 1 />
		<cfset optionTag = "<option value=""#querySource[valueField][sourceCounter]#"">#querySource[displayField][sourceCounter]#</option>" />
		<cfif ListFindNoCase(listSelected,querySource[valueField][sourceCounter]) EQ 0>
			<cfset sourceOptions = sourceOptions & optionTag />
			<cfset noScriptOptions = noScriptOptions & optionTag />
		<cfelse>
			<cfset selectedOptions = selectedOptions & optionTag />		
			<cfset noScriptOptions = noScriptOptions & "<option value=""#querySource[valueField][sourceCounter]#"" selected=""selected"">#querySource[displayField][sourceCounter]#</option>" />
		</cfif>
	</cfloop>	

	
</cfsilent>
<!--- Only output javascript block once per page, it supports multiple tags on one page --->
<cfif not isDefined("request.SelectSwapExecuted") OR not request.SelectSwapExecuted>
<cfsavecontent variable="selectSwapHeader">
	<script type="text/javascript">

		function populateSelectedValuesList(instanceName) {
			var selectedList = document.getElementById(instanceName + '_selectedList');
			var selectedValues = document.getElementById(instanceName);
			var selectedDisplays = document.getElementById(instanceName + '_display');

			selectedValues.value = "";
			selectedDisplays.value = "";
			
			for (var i=0; i<selectedList.options.length; i++) {
				if (selectedValues.value.length > 0) { selectedValues.value = selectedValues.value + ','; }
				if (selectedDisplays.value.length > 0) { selectedDisplays.value = selectedDisplays.value + ','; }

				selectedValues.value = selectedValues.value + selectedList.options[i].value;
				selectedDisplays.value = selectedDisplays.value + selectedList.options[i].text;				
			}		
		}
				
		function addSelected(instanceName) {
			var sourceList = document.getElementById(instanceName + '_sourceList');
			var selectedList = document.getElementById(instanceName + '_selectedList');

			for (var i=0; i<sourceList.options.length; i++) {
				if (sourceList.options[i].selected) {
					optionToMove = sourceList.options[sourceList.selectedIndex];
					optionToMove.selected = false;
					var newOption=document.createElement('option');
					newOption.text=optionToMove.text;
					newOption.value=optionToMove.value;
					addOptionToSelect(selectedList,newOption);
					sourceList.remove(i);
					i = i -1;
				}
			}
			if (selectedList.options.length > 1) {
				sortSelect(selectedList);
			}
			populateSelectedValuesList(instanceName);
		}

		function addAll(instanceName) {
			var sourceList = document.getElementById(instanceName + '_sourceList');
			var selectedList = document.getElementById(instanceName + '_selectedList');

			for (var i=0; i<sourceList.options.length; i++) {
				optionToMove = sourceList.options[i];
				optionToMove.selected = false;
				var newOption=document.createElement('option');
				newOption.text=optionToMove.text;
				newOption.value=optionToMove.value;
				addOptionToSelect(selectedList,newOption);
				sourceList.remove(i);
				i = i -1;
			}
			if (selectedList.options.length > 1) {
				sortSelect(selectedList);
			}
			populateSelectedValuesList(instanceName);
		}

		
		function removeSelected(instanceName) {
			var sourceList = document.getElementById(instanceName + '_sourceList');
			var selectedList = document.getElementById(instanceName + '_selectedList');

			for (var i=0; i<selectedList.options.length; i++) {
				if (selectedList.options[i].selected) {
					optionToMove = selectedList.options[selectedList.selectedIndex];
					optionToMove.selected = false;
					var newOption=document.createElement('option');
					newOption.text=optionToMove.text;
					newOption.value=optionToMove.value;
					addOptionToSelect(sourceList,newOption);
					selectedList.remove(i);
					i = i -1;
				}
			}
			if (sourceList.options.length > 1) {
				sortSelect(sourceList);
			}
			populateSelectedValuesList(instanceName);		
		}

		function removeAll(instanceName) {
			var sourceList = document.getElementById(instanceName + '_sourceList');
			var selectedList = document.getElementById(instanceName + '_selectedList');

			for (var i=0; i<selectedList.options.length; i++) {
				optionToMove = selectedList.options[i];
				optionToMove.selected = false;
				var newOption=document.createElement('option');
				newOption.text=optionToMove.text;
				newOption.value=optionToMove.value;
				addOptionToSelect(sourceList,newOption);
				selectedList.remove(i);
				i = i -1;
			}
			if (sourceList.options.length > 1) {
				sortSelect(sourceList);
			}
			populateSelectedValuesList(instanceName);		
		}
		
		function addOptionToSelect(selectBox,newOption) {
			try {
				selectBox.add(newOption,null);
			} catch (e) {
				//Special work around for ie
				selectBox.add(newOption);
			}		
		}


		// Following sort functions: sortFuncAsc, sortFuncDesc, sortSelect originally created by Dan Nye
		// http://www.codecouch.com/dan/
		
        // sort function - ascending (case-insensitive)
        function sortFuncAsc(record1, record2) {
            var value1 = record1.optText.toLowerCase();
            var value2 = record2.optText.toLowerCase();
            if (value1 > value2) return(1);
            if (value1 < value2) return(-1);
            return(0);
        }

        // sort function - descending (case-insensitive)
        function sortFuncDesc(record1, record2) {
            var value1 = record1.optText.toLowerCase();
            var value2 = record2.optText.toLowerCase();
            if (value1 > value2) return(-1);
            if (value1 < value2) return(1);
            return(0);
        }

        function sortSelect(selectToSort, ascendingOrder) {
            if (arguments.length == 1) ascendingOrder = true;    // default to ascending sort

            // copy options into an array
            var myOptions = [];
            for (var loop=0; loop<selectToSort.options.length; loop++) {
                myOptions[loop] = { optText:selectToSort.options[loop].text, optValue:selectToSort.options[loop].value };
            }

            // sort array
            if (ascendingOrder) {
                myOptions.sort(sortFuncAsc);
            } else {
                myOptions.sort(sortFuncDesc);
            }

            // copy sorted options from array back to select box
            selectToSort.options.length = 0;
            for (var loop=0; loop<myOptions.length; loop++) {
                var optObj = document.createElement('option');
                optObj.text = myOptions[loop].optText;
                optObj.value = myOptions[loop].optValue;
                selectToSort.options[selectToSort.options.length] = optObj;
            }
        }

	</script>
</cfsavecontent>	
<cfhtmlhead text="#selectSwapHeader#" />
</cfif>
<cfoutput>
<div class="SelectSwap #tagInstanceName# SelectSwap_#displayMode#" id="#tagInstanceName#_box" style="border-collapse:collapse;">
	<!--- All Display --->
	<div class="Selector Available">
		<p><label for="#tagInstanceName#_sourceList">#sourceHeader#</label></p>
		<select id="#tagInstanceName#_sourceList" multiple="yes">#sourceOptions#</select>
	</div>
	<div class="Controls">
<cfif CompareNoCase(displayMode,"vertical") EQ 0 >
		<input type="button" value="&##8659;" onClick="javascript:addAll('#tagInstanceName#');">
		<input type="button" value="&##8595;" onClick="javascript:addSelected('#tagInstanceName#');">
		<input type="button" value="&##8593;" onClick="javascript:removeSelected('#tagInstanceName#');">
		<input type="button" value="&##8657;" onClick="javascript:removeAll('#tagInstanceName#');">
<cfelse>
			<div><input type="button" value="&##8658;" onClick="javascript:addAll('#tagInstanceName#');"></div>
			<div><input type="button" value="&##8594;" onClick="javascript:addSelected('#tagInstanceName#');"></div>
			<div><input type="button" value="&##8592;" onClick="javascript:removeSelected('#tagInstanceName#');"></div>
			<div><input type="button" value="&##8656;" onClick="javascript:removeAll('#tagInstanceName#');"></div>
</cfif>
	</div>
	<!--- Selected Display --->	
	<div class="Selector Selected">
		<p><label for="#tagInstanceName#_selectedList">#selectedHeader#</label></p>
		<select id="#tagInstanceName#_selectedList" multiple="yes">#selectedOptions#</select>
	</div>
</div>
<input type="hidden" name="#tagInstanceName#" id="#tagInstanceName#" value="" />
<input type="hidden" name="#tagInstanceName#_display" id="#tagInstanceName#_display" value="" />
<!--- Initialization JS, executes after the form controls load --->
<script type="text/javascript">
	document.getElementById('<cfoutput>#tagInstanceName#</cfoutput>_box').style.display='block';
	populateSelectedValuesList('<cfoutput>#tagInstanceName#</cfoutput>'); 
</script>
<!--- JavaScript disabled display --->
<noscript>
<select multiple="true" id="#tagInstanceName#" name="#tagInstanceName#" class="selectSwap">#noScriptOptions#</select>
</noscript>
<p style="clear:both;"></p>
</cfoutput>
<cfset request.SelectSwapExecuted = true />
</cfprocessingdirective>
<cfexit method="exitTag" />
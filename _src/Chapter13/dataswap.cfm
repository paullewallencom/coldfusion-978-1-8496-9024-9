<cfimport prefix="coop" taglib="/share/tags/coop"/>
<cfscript>
  _init.persona.data = "cook,carpenter,mechanic,salesman,accountant";
</cfscript>
<coop:coop>
  <coop:css>
    #eventForm .coopFieldLabel {
      color:blue;
      text-align:right;
      padding-right:5px;
      float:left;
      width:140px;
    }
  </coop:css>

  <coop:form id="eventForm">
    <coop:textBox id="firstName" label="Name (First, Last)" 
                  allowBreak="false" />
    <coop:textBox id="lastName" />
    <coop:selectList id="persona" label="Persona" />
    <coop:submit value="Submit" showModes="add,edit" />
  </coop:form>
</coop:coop>

Feature: AERQ Target API 
 		
Background:
 * url 'http://122.165.121.195:8080'
 * def baseurl = baseURL
 * def newid = "null"
 * def random_number =
"""
function(s) {
var text = "";
var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
for (var i=0;i<s;i++)
text += pattern.charAt(Math.random() * pattern.length());
return text;
}
"""
		* def randomstring = random_number(10)
		* print randomstring

  Scenario Outline: <SCENARIO>
  * def create = <POST_DATA>
  * create.name= create.name+randomstring
  * print create
  Given url baseURL+<URL>
  And request create
  When method <METHOD>
  Then status <STATUS_CODE>
  And match <KEY> contains <VALUE> 	
 	Given url baseURL+<URL>+"/"+response.id
 	  * def update =  <POST_DATA>
  * update.name= update.name+randomstring+ " Updated"
  * update.description = "Automation Updated"
  * print update
	And request update
  When method PUT
  Then status 202
 	Given url baseURL+<URL>+"/"+response.id+"/delete"
 	And request ""
  When method PUT
  Then status 200
  Then match response.successMessage contains "Deleted successfully"
  
  Examples: 
  |read('data/testdata_Target_Put.csv')|
  
  
  Scenario Outline: <SCENARIO>
  Given url baseURL+<URL>
  When method <METHOD>
  Then status <STATUS_CODE>
 	And match <KEY> contains deep <VALUE> 	
 #Then match karate.toString(response) contains "<EXPECTED_RESULT>"

  Examples: 
  |read('data/testdata_Target_Get.csv')|
  
Feature: AERQ Flow Control API 
 		
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
  Given url baseURL+<URL>
  And request <POST_DATA>
  When method <METHOD>
  Then status <STATUS_CODE>
  And match <KEY> contains <VALUE> 	
 	Given url baseURL+<URL>+"/58"
 	  * def update =  <POST_DATA>
	And request update
  When method PUT
  Then status 202
 	Given url baseURL+"/api/v1/adsourceinstance/51/delete"
 	And request ""
  When method PUT
  Then status 200
  Then match response.successMessage contains "Deleted successfully"
  
  Examples: 
  |read('data/testdata_Flowcontrol_Put.csv')|
  
  
  Scenario Outline: <SCENARIO>
  Given url baseURL+<URL>
  When method <METHOD>
  Then status <STATUS_CODE>
 	And match <KEY> contains deep <VALUE> 	

  Examples: 
  |read('data/testdata_Flowcontrol_Get.csv')|
  
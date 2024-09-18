Feature: AERQ Ad Restrictions API 
 		
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
  
  Examples: 
  |read('data/testdata_AdRestrictions_Put.csv')|
  
  Scenario Outline: <SCENARIO>
  Given url baseURL+<URL>
  When method <METHOD>
  Then status <STATUS_CODE>
 	And match <KEY> contains deep <VALUE> 	
 
  Examples: 
  |read('data/testdata_AdRestrictions_Get.csv')|
  
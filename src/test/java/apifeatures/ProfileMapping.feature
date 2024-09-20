Feature: AERQ Profile Mapping API 
 		
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
  
   * def create = <POST_DATA_PROFILE>
  * create.name= create.name+randomstring
  * print create
  Given url baseURL+'/api/v1/profile'
  And request create
  When method <METHOD>
  Then status 201
  * def create = <POST_DATA>
  * def profID = response.id
   * create.profileId = profID
  * print create
  Given url baseURL+<URL>
  And request create
  When method <METHOD>
  Then status <STATUS_CODE>
  And match <KEY> contains <VALUE> 	
 	Given url baseURL+<URL>
 	  * def update =  <POST_DATA_UPDATE>
  #* update.profileId = profID
  #* print update
	And request update
  When method POST
  Then status 200
 	Given url baseURL+<URL>+"/139/delete"
 	And request ""
  When method PUT
  
  Examples: 
  |read('data/testdata_ProfileMapping_Put.csv')|
  
  
  Scenario Outline: <SCENARIO>
  Given url baseURL+<URL>
  When method <METHOD>
  Then status <STATUS_CODE>
 	And match <KEY> contains deep <VALUE> 	

  Examples: 
  |read('data/testdata_ProfileMapping_Get.csv')|
  
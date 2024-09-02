Feature: AERQ Advertiser

 		
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

  Scenario: Create Advertiser and Edit Advertiser
  * def user =
      """
     {
    "name": "Automation Adv 1234 ",
    "description":"desc",
    "email":"test@gc.om",
    "phoneNumber":"9897656215"
}
      """
      * user.name= user.name+randomstring
      * print user
  Given path '/api/v1/advertiser'
  And request user
  When method post
  Then status 201
	* def jsonFromCsv = 
"""
{
  "name": "Automation Adv 1234 ",
  "phoneNumber": "3242343242",
  "email": "test@gmail.com",
  "description": ""
}"""
* jsonFromCsv.name= jsonFromCsv.name+randomstring+ " Updated"
  Given path '/api/v1/advertiser/'+ response.id
  And request jsonFromCsv
  When method PUT
  Given path '/api/v1/advertiser/'+ response.id +'/delete'
  And request ""
  When method PUT
  Then status 200
	      		
 Scenario Outline: <SCENARIO>
  Given url baseURL+<URL>
  When method <METHOD>
  Then status <STATUS_CODE>
  * def projectSchema = <VALUE>
 	And match response.<KEY> contains <VALUE> 	
# Then match karate.toString(response) contains <EXPECTED_RESULT>

  Examples: 
  |read('data/testdata_Adv_Get.csv')|
  

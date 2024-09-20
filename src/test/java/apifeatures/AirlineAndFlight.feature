Feature: AERQ Airline & Flight API 
 		
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
  |read('data/testdata_AirlineAndFlight_Put.csv')|
  


  Scenario Outline: <Modules> "- " <SCENARIO>
  Given url baseURL+<URL>
  And request <POST_DATA>
  When method <METHOD>
  Then status <STATUS_CODE>
  And match <KEY> contains deep <VALUE> 	
 	
  Examples: 
  |read('data/testdata_AirlineAndFlightImport_Post.csv')|
   
  Scenario Outline: <Modules> "- " <SCENARIO>
		Given url baseURL+<URL>
		* multipart file file = { read: 'sampleflightImport.csv' }
		Then method <METHOD>
		Then status <STATUS_CODE>
		
		Examples: 							
		|read('data/testdata_AirlineAndFlightImportCSV_Post.csv')|
		
  #Scenario Outline: <Modules> "- " <SCENARIO>
  #Given url baseURL+<URL>
  #And request <POST_DATA>
  #And multipart file file = { read: 'sampleflightImport.csv', filename: 'sampleflightImport.csv', contentType: 'text/csv' }
  #When method <METHOD>
  #Then status <STATUS_CODE>
  #And match <KEY> contains <VALUE> 	
 	
 # Examples: 
 # |read('data/testdata_AirlineAndFlightImportCSV_Post.csv')|
  
  Scenario Outline: <SCENARIO>
  Given url baseURL+<URL>
  When method <METHOD>
  Then status <STATUS_CODE>
 	And match <KEY> contains deep <VALUE> 	

  Examples: 
  |read('data/testdata_AirlineAndFlight_Get.csv')|
  
Feature: AERQ - Common Meta data features . 

    * def baseurl = baseURL

Background:
 * url 'http://122.165.121.195:8080'
 
 Scenario Outline: <MODULES> - <SCENARIO>
  Given url 'http://122.165.121.195:8080'+<URL>
  When method <METHOD>
  Then status <STATUS_CODE>
  And match karate.toString(response) contains <VALIDATION>
 
  Examples: 
  |read('/data/testdata_Common.csv')|
  
  
Feature: patterns for using cucumber scenario-outline and examples with karate


Scenario:
  * def data1 =
      """
      {"id": 3428332,
  "username": "abc",
  "firstName": "xyz",
  "lastName": "aaa",
  "email": "abc@gmail.com",
  "password": "askhvkasf#00383",
  "phone": "9472362917",
  "userStatus": 0}
      """
  Given url 'https://petstore.swagger.io/v2/user'
  And header api_key = '1111'
  And configure ssl = true
  And json data = data1
  And print data
  And request data
  When method post

  Then status 200 




 
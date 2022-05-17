Feature: Create Student with unique id api retuns 200 response

Background:
* url apiURL
* def id = Math.floor(Math.random() * 1000) //This will genrate unique id every time 
* def requestPayload =
""" 
    {
        "firstName": "Mike",
        "lastName": "Wong",
        "nationality": "Singapore",
        "studentClass": "3 A"
      }
"""
 * set requestPayload.id = id
 * print requestPayload  

Scenario: Get Artist 
And path '/studentmgmt/addStudent'
And request requestPayload
When method POST
Then status 200
And match response contains 'New student enrolled with student id : '+ id
* print response


Scenario: Create student which already existing id // 23 is existing in database  api returns 500 (This is bug it should return 400) 
  * def requestPayload =
""" 
    {
        "firstName": "Deepali ",
        "id": 23,
        "lastName": "Chaudhari",
        "nationality": "India",
        "studentClass": "A"
      }
  
"""
  Given url 'http://localhost:9080'
  And path '/studentmgmt/addStudent'
  And request requestPayload
  When method POST
  Then status 500 
  And match response contains 'Exception occurred while adding new student: Student already exists with student id: 23'
  * print response

Scenario: To check id filed is mandory to crate user return 400     
  * def requestPayload =
""" 
    {
        "firstName": "Deepali ",
        "lastName": "Chaudhari",
        "nationality": "India",
        "studentClass": "A"
      }
  
"""
  Given path '/studentmgmt/addStudent'
  And request requestPayload
  When method POST
  Then status 400
  And match response.errors[:1].defaultMessage contains "Student Id can not be Null"
  * print response  


Scenario:To check firstname/lastname/Class filed is mandory to crate user return 400 
  * def requestPayload =
""" 
      {
        "id": 23,
      }
  
"""
  Given path '/studentmgmt/addStudent'
  And request requestPayload
  When method POST
  Then status 500
  And match response contains 'Exception occurred while adding new student: Required fields are missing: [First Name, Class]'
  * print response 
  
  
Scenario: Create student without nationality user created with respond 200      
  * def requestPayload =
""" 
    {
        "firstName": "Deepali ",
        "lastName": "Chaudhari",
        "studentClass": "A"

     }
  
"""
  * set requestPayload.id = id
  Given path '/studentmgmt/addStudent'
  And request requestPayload
  When method POST
  Then status 200
  And match response contains 'New student enrolled with student id : '+ id
  * print response  

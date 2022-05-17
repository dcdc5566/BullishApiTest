Feature: Get Student by id and class 
Steps to follow 
1.Get student by id 
2.Get student by classname
3.Validate the data type of response values 

Background:
* url apiURL
Given path '/studentmgmt/fetchStudents'


Scenario Outline: Get student id with 23 and respone code is 200 
And param id = <id>
When method GET
Then status 200
* print response
* match response ==
"""
[
{
    "id": <id>,
    "firstName": <firstName>,
    "lastName": <lastName>,
    "studentClass": <studentClass>,
    "nationality": <nationality>
}
]
"""

Examples:
|id| firstName      | lastName      |  studentClass | nationality     |
|23|  DeepaliUpdate |   Chaudhari   |    3C         |    India        |
|782|  Mike         |   Wong        |    3 A        |    Singapore    |

Scenario: Get student class 3C  and respone code is 200 
    And param studentClass = "3C"
    When method GET
    Then status 200
    * print response
    * match response ==
    """
    [
    {
        "id": 23,
        "firstName": "DeepaliUpdate",
        "lastName": "Chaudhari",
        "studentClass": "3C",
        "nationality": "India"
    }
    ]
    """



Scenario: Get student all the recorsd and match datatype  and respone code is 200 
    When method GET
    Then status 200
    * print response
    And match response[0].firstName  == "#string"
    And match response[0].lastName  == "#string"
    And match response[0].nationality  == "#string"
    And match response[0].studentClass  == "#string"
    And match response[0].id  == "#number"
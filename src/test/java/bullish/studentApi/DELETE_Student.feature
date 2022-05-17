Feature: Delete Student from the record 
Steps to follow 
1.First create testdate with 223445 student
2.Delete newly created user
3.Get delete user from database and make sure its not returning value

Background:
    * url apiURL
    
Scenario: Delete student from the Database 
    * def requestPayload =
    """ 
        {
            "firstName": "Mike",
            "lastName": "Wong",
            "nationality": "Singapore",
            "studentClass": "3 A",
            "id" :223445
          }
    """
     * print requestPayload  
     * path '/studentmgmt/addStudent'
     * request requestPayload
     * method POST
     * status 200

     * print response

     * def requestPayload =
    """ 
    	  
    {
      "id": 223445
    }
  
     """
 * print requestPayload  
Given path '/studentmgmt/deleteStudent'
And request requestPayload
When method DELETE
Then status 200
* print response

Given path '/studentmgmt/fetchStudents'
And param id = 223445
When method GET
Then status 200
* print response
And match response == []


Scenario: Delete student which does not exist database 
    * def requestPayload =
    """ 
    	  
    {
      "id": 223445111111
    }
  
     """
    Given path '/studentmgmt/deleteStudent'
    And request requestPayload
    When method DELETE
    Then status 500
    * print response
    And match response contains 'Exception occurred while deleting student data: No student data found with student id: 223445111111'


Scenario: Delete student without id 
    * def requestPayload =
    """   
    {

    }
     """
    Given path '/studentmgmt/deleteStudent'
    And request requestPayload
    When method DELETE
    Then status 400
    * print response
    And match response.errors[:1].defaultMessage contains "Student Id can not be Null"


Scenario: Delete student where id datatype is not long
    * def requestPayload =
    """ 
    	  
    {
    "id": "abc"
    }
  
     """
    Given path '/studentmgmt/deleteStudent'
    And request requestPayload
    When method DELETE
    Then status 400
    * print response
    And match response.error contains "Bad Request"
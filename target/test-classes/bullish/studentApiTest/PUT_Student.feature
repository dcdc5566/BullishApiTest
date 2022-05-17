Feature: Update Student details 
1.Create new student with id #44444444
2.Update user details with new 
3.Validate details updated succcesfully 
4.Delete user from the database 


Background:
* url apiURL 
* def requestPayload =
""" 
    {
        "firstName": "Mike",
        "lastName": "Wong",
        "nationality": "Singapore",
        "studentClass": "3 A",
        "id" :44444444
      }
"""
 * print requestPayload  
 * path '/studentmgmt/addStudent'
 * request requestPayload
 * method POST
 * status 200 


Scenario: Update student firstname lastname class and nationality with respond 200 
* def requestPayload =
""" 
    {
        "firstName": "MikeUpdate",
        "id": 44444444,
        "lastName": "WongUpdate",
        "nationality": "SingaporeUpdate",
        "studentClass": "3 D Update"
      }
  
"""    
And path '/studentmgmt/updateStudent'
And request requestPayload
When method PUT
Then status 200
* match response ==
"""
 {
  "id": 44444444,
  "firstName": "MikeUpdate",
  "lastName": "WongUpdate",
  "studentClass": "3 D Update",
  "nationality": "SingaporeUpdate" 
}

     """

    * def requestPayload =
    """ 
    	  
    {
      "id": 44444444
    }
  
     """
    #After test Delete student id with 44444444    
    Given path '/studentmgmt/deleteStudent'
    And request requestPayload
    When method DELETE
    Then status 200
Feature: Test User API Authentication
Background:
  * url apiURL

Scenario: Get Access-Token for api calls 
 Given path '/api/token'
 And header Content-Type = 'application/json'
 And request {"username":"#(username)","password":"#(password)"}
 When method POST  
 Then status 200
 * assert response.access_Token != null
 And match response.access_Token =='#string'
 And def token = response.access_Token 

Feature: Sample Karate Test Script

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: Create a new user in signup
    * def user =
      """
      {
        "name": "testuser",
        "username": "testuser",
        "email": "testuser@example.com"
      }
      """

    Given path 'users'
    And request user
    When method post
    Then status 201
    And match response.username == user.username

    * def id = response.id
    * print 'Created ID is:', id

  Scenario: Attempt to create a user that already exists (simulation)
    * def existingUser =
      """
      {
        "name": "testuser",
        "username": "testuser",
        "email": "testuser@example.com"
      }
      """

    Given path 'users'
    And request existingUser
    When method post
    Then status 201
    And match response.username == existingUser.username

    * def existingUserId = response.id
    * print 'Existing user ID is:', existingUserId

  Scenario: Correct username and password login (simulation)
    * def loginUser =
      """
      {
        "username": "Bret",
        "password": "correctPassword"
      }
      """

    Given path 'users/1'
    When method get
    Then status 200
    And match response.username == "Bret"

  Scenario: Incorrect username and password login (simulation)
    * def wrongLoginUser =
      """
      {
        "username": "Bret",
        "password": "WrongPassword"
      }
      """

    Given path 'users/1'
    When method get
    Then status 200
    And match response.username == "Bret"

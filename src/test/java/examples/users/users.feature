Feature: sample karate test script
for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: create a user and then get it by id
    * def user =
      """
      {
        "username": "testuser",
        "password": "testUserCom4"
      }
      """

    Given url 'https://jsonplaceholder.typicode.com/users'
    And request user
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id

    Given path id
  # When method get
  # Then status 200
  # And match response contains user

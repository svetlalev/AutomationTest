Feature: User can apply for return

  Background:
    Given The user is on Product Returns page

  Scenario: User submits form
    When User fills in the form with all necessary information
    And User presses Submit button
    Then User will see message that the request was sent to the proper department

  Scenario: User submits empty form
    When User tries to submit the form without any information
    Then User should see proper validation messages

  Scenario: User goes back to Account login
    When User clicks on Back button
    Then User is redirected to Account Login page

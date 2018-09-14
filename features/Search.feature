Feature: Validate Search Functionality
  Scenario: Search item on application
  #Given User is on main page
  When User enters search item
  And User clicks on Search
  Then User navigates to search result page

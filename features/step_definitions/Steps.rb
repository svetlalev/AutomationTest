=begin
Given("User is on main page") do
  $driver
end
=end
When(/^User enters search item$/) do
  $driver.find_element(:name,"search").send_keys("iPhone")
end

When("User clicks on Search") do
  $driver.find_element(:xpath,"//button[@class='btn btn-default btn-lg']")
end

Then("User navigates to search result page") do
  actual_url = $driver.current_url
  assert_equal("https://www.facebook.com/", actual_url, "The URL is incorrect")
end

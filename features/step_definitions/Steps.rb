=begin
Given("User is on main page") do
  $driver
end
=end
When(/^User enters search item$/) do
  fill_in('search', :with => 'iPhone')
end

When("User clicks on Search") do
  find(:xpath, "/HTML/BODY/HEADER/DIV/DIV/DIV[2]/DIV/SPAN/BUTTON").click
end

Then("User navigates to search result page") do
  expect(page).to have_content('Search - iPhone')
  expect(page).to have_content('Products meeting the search criteria')
end

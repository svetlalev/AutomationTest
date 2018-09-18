Given(/^The user is on Product Returns page$/) do
  click_link('Returns')
  expect(page).to have_content('Product Returns')
  expect(page).to have_content('Please complete the form below to request an RMA number.')
end

When(/^User fills in the form with all necessary information$/) do
  fill_in('First Name', :with => 'Testing')
  fill_in('Last Name', :with => 'Lname')
  fill_in('email', :with => 'test@test.com')
  fill_in('Telephone', :with => '012345678')
  fill_in('Order ID', :with => '12321')
  find(:xpath, "//button[@class='btn btn-default']").click
  find(:xpath, "/html/body/div[3]/div/div[1]/table/tbody/tr[3]/td[2]").click
  fill_in('Product Name', :with => 'iPhone 6')
  fill_in('Product Code', :with => '123')
  fill_in('Quantity', :with => '2')
  choose('Order Error')
  choose('Yes')
  fill_in('Faulty or other details', :with => 'This is test for Returns form')
end

And(/^User presses Submit button$/) do
  click_on('Submit')
end

Then(/^User will see message that the request was sent to the proper department$/) do
  expect(page).to have_content('Product Returns')
  expect(page).to have_content('Thank you for submitting your return request. Your request has been sent to the relevant department for processing.')
  expect(page).to have_content('You will be notified via e-mail as to the status of your request.')
  expect(page).to have_css('a.btn.btn-primary')
end

When(/^User tries to submit the form without any information$/) do
  click_on('Submit')
end

Then(/^User should see proper validation messages$/) do
  expect(page).to have_content('First Name must be between 1 and 32 characters!')
  expect(page).to have_content('Last Name must be between 1 and 32 characters!')
  expect(page).to have_content('E-Mail Address does not appear to be valid!')
  expect(page).to have_content('Telephone must be between 3 and 32 characters!')
  expect(page).to have_content('Order ID required!')
  expect(page).to have_content('Product Name must be greater than 3 and less than 255 characters!')
  expect(page).to have_content('Product Model must be greater than 3 and less than 64 characters!')
  expect(page).to have_content('You must select a return product reason!')
end

When(/^User clicks on Back button$/) do
  click_link('Back')
end

Then(/^User is redirected to Account Login page$/) do
  expect(page).to have_content('Account Login')
  expect(page).to have_css('input#input-email')
  expect(page).to have_css('input#input-password')
end


=begin
When(/^User clicks on Back button%/) do
  click_link('Back')
end

Then(/^User is redirected to Account Login page%/) do
  expect(page).to have_content('Account Login')
  expect(page).to have_css('input#input-email')
  expect(page).to have_css('input#input-password')
end
=end

require 'selenium-webdriver'
require 'capybara/cucumber'
require 'pry'
require 'rspec'
=begin
Before do

  $driver = Selenium::WebDriver.for :chrome
  $driver.get("http://shop.thetestingworld.com/")

end

After do

  $driver.quit

end
=end
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w(headless disable-gpu) }
  )

  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    desired_capabilities: capabilities
end

Before do
  visit('http://shop.thetestingworld.com/')
end

Capybara.app_host = "http://shop.thetestingworld.com/"
Capybara.javascript_driver = :chrome
Capybara.default_driver = :chrome

Capybara.default_selector = :css

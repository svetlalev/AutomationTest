require 'selenium-webdriver'

Before do

  $driver = Selenium::WebDriver.for :chrome
  $driver.get("http://shop.thetestingworld.com/")

end

After do

  $driver.quit

end

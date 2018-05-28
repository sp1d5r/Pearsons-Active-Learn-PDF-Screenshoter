
# PDF Maker from Sp1der for Pearsons Active Learn
# To ScreenShot all of the PDF pages.
# Dependancies etc
require 'watir'
require 'watir/extensions/element/screenshot'


# Enter your email
username = "USERNAME"   #<------- Username Goes Here 
# Enter your Password
password = "PASSWORD"   #<------ Password Goes Here

# Enter the src of the IFrame
iframesrc = "https://resources.pearsonactivelearn.com/r00/r0036/r003663/r00366335/current/index.html?domain=pearsonactivelearn.com"
#Open Browser and navigate to the login page

Browser = Watir::Browser.new :chrome
Browser.goto "https://idp.activeteachonline.com/sso/idp/www/module.php/core/loginuserpass.php?AuthState=_6ba95c9d5126d27953d17c352104185b6d49658c85%3Ahttps%3A%2F%2Fidp.activeteachonline.com%2Fsso%2Fidp%2Fwww%2Fsaml2%2Fidp%2FSSOService.php%3Fspentityid%3Dhttps%253A%252F%252Fwww.pearsonactivelearn.com%26cookieTime%3D1527506628%26RelayState%3D"

# Navigate to username and password fields, and inject info
puts "Logging in..."

Browser.text_field(:name => "username").set username
puts "Entering Username/email"
Browser.text_field(:name => "password").set password
puts "Entering Password"

#Click Login
puts "Attempting Login"
Browser.button(:class => ['button', 'login-button']).click
puts "Login Complete"
Browser.goto "https://www.pearsonactivelearn.com/app/library/series/view/666684#/studentbooks"


Browser.div(:class => ['panel-body', 'student-book-panel']).as[1].click    #This is Zero Indexed, if you have multiple books in your portal, change this to the book you want - 1
puts('Entering Book Portal')

sleep(5)
Browser.windows.last.use

puts "clearing current page number "
Browser.iframe(:src => "#{iframesrc}" ).div(:role => 'navigation').div(:class => 'rightbuttons').div(:class => ['quicknav','control']).input(:type => 'text').to_subtype.clear

puts "setting page number as 0"
Browser.iframe(:src => "#{iframesrc}").div(:role => 'navigation').div(:class => 'rightbuttons').div(:class => ['quicknav','control']).input(:type => 'text').send_keys "i"
puts "pressing enter "
Browser.iframe(:src => "#{iframesrc}").div(:role => 'navigation').div(:class => 'rightbuttons').div(:class => ['quicknav','control']).input(:type => 'text').send_keys(:enter)


sleep(4)
pageNumber = 0
while pageNumber != 300
    Browser.screenshot.save("#{pageNumber}.png")
    Browser.iframe(:src => "#{iframesrc}" ).div(:class => ['minimal-edge', 'rightEdge']).click
    puts "ScreenShot page: #{pageNumber}"
    puts "travelling to the next page to next page"
    sleep(12)
    pageNumber += 1
end

sleep

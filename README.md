# Pearsons-Active-Learn-PDF-Screenshoter

(This piece of software no longer works for the Pearsons Active Learn PDF website, instead you can reformat the code to work on newer versions of the software)

## Contents:
- [Setup](#setup)
- [Locating the IFrame src](#here-comes-the-hard-part-not-really)
- [Running the Program](#running-the-program)
- [Cropping the images](#cropping-the-images)
- [Page number being reverse](#uh-oh-the-page-numbers-are-reversed)
- [Credits](#credits)
- [Help](#help)

## Setup
This is a Screenshoter I made in ruby because I needed the books to be available offline, this uses watir, the screenshoting extension available from watir, ruby, and chrome web-drivers. To install ruby enter terminal and type in 
``` 
brew install ruby
``` 
This uses homebrew to install ruby, then you have to install the next few dependancies: 
```
gem install watir 
gem install 'watir/extensions/element/screenshot'
``` 
[now go to google chrome and install the appropriate web drivers](http://chromedriver.chromium.org/downloads)

## Here comes the hard part (not really)
Go to google chrome, and open up [this](https://idp.activeteachonline.com/sso/idp/www/module.php/core/loginuserpass.php?AuthState=_558b21158ff8cf5f59c38e59d88357204d6012af64%3Ahttps%3A%2F%2Fidp.activeteachonline.com%2Fsso%2Fidp%2Fwww%2Fsaml2%2Fidp%2FSSOService.php%3Fspentityid%3Dhttps%253A%252F%252Fwww.pearsonactivelearn.com%26cookieTime%3D1527527354%26RelayState%3D)
now login and travel to the book you want to create a PDF of. 
once the book opens up in the separate tab, right click on the book and inspect element. and then inspect element again until you see the <iframe> tag. once you see that it should say 
```
src = 'some long website'
``` 
copy the `'some long website'` and open up the `PDF maker.rb` program.
now fill out the details where it tells you too 
```ruby 
# Enter your email
username = "USERNAME"   #<------- Username Goes Here 
# Enter your Password
password = "PASSWORD"   #<------ Password Goes Here

# Enter the src of the IFrame
iframesrc = "https://resources.pearsonactivelearn.com/r00/r0036/r003663/r00366335/current/index.html?domain=pearsonactivelearn.com"
```

## Running the Program 
To make sure everything runs smoothly tick the following criteria 
- The program is in an empty folder that doesnt have any previously ran `.png` files
- The `Browser.div(:class => ['panel-body', 'student-book-panel']).as[1].click` on line 36 has the right number in the .as[x] bit, if its the first book in your portal then change it to 0 since its zero indexed. 
- Once the program has reached the end of the pages just terminate it, it shouldnt be able to screenshot anymore pages because it should automatically remove the button but just incase be sure to turn it off 
- if you have a slow internet connection then you should change the following 
```ruby 
sleep(4)  #<------ line 51
```
```ruby 
while pageNumber != 300
    Browser.screenshot.save("#{pageNumber}.png")
    Browser.iframe(:src => "#{iframesrc}" ).div(:class => ['minimal-edge', 'rightEdge']).click
    puts "ScreenShot page: #{pageNumber}"
    puts "travelling to the next page to next page"
    sleep(12)             #<----------- line 58
    pageNumber += 1
end
```
- change the sleep to a larger number, this means the program will take longer to run but it will make sure that the webpage is loaded before taking the screenshot. 
- when the program is runnning try not to press on the screen because it might end up resulting in the page number not changing in the begining. 

## Cropping the images 
To simplify the cropping process go to [BIRME](https://birme.net/?target_width=1183&target_height=902&focal_y=0&auto_focal=false&rename=Page-xxx&border_color=%2342f471) and crop them. To ensure this, first crop them horizontally, and then crop them vertically. 

## Uh Oh, The page numbers are reversed??
No worries (if you're on mac) just open automator (a pre installed app) and open the workflow created. If you want to rebuild it you can using [this](https://apple.stackexchange.com/questions/41967/can-i-efficiently-make-a-pdf-out-of-10-jpeg-images)

## Credits 
- [Watir](https://github.com/watir) 
- [ansoni](https://github.com/ansoni) : The Creater of watir-extensions-element-screenshot
- [Sp1d5r](https://github.com/sp1d5r) (me)

## Help?
If you get stuck or need help message me on my social media's to ensure a reply
- [Linkden - Elijah Ahmad](https://www.linkedin.com/in/elijah-ahmad-658a2b199/)
- [FaceBook - Elijah Ahmad](https://www.facebook.com/elijah.ahmad.71)
- [Instagram - @ElijahAhmad__](https://www.instagram.com/ElijahAhmad__)
- [Snapchat - @Elijah.Ahmad](https://www.snapchat.com/add/elijah.ahmad)


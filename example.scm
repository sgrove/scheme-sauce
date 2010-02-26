(load "selenium.scm")

(start-browser "*firefox3" "http://google.com/")

(open-url "/")
(type "q" "Sauce Labs")
(click "btnG")
(wait-for-page-to-load 3000)
(click "link=Sauce Labs - Selenium-based Downloads, Hosting and Support")
(wait-for-page-to-load 3000)
(click "link=Products")
(wait-for-page-to-load 3000)
(click "link=Sauce OnDemand")

(stop-browser)

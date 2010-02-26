(define http-header
     (lambda (method location host port)
       (string-append method " /selenium-server/driver/?" location " HTTP/1.1
User-Agent: curl/7.19.7 (i386-apple-darwin9.8.0) libcurl/7.19.7 OpenSSL/0.9.8l zlib/1.2.3
Host: " host ":" (number->string 4444) "
Accept: */*
\n")))

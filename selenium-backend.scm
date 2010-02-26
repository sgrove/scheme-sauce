
(define current-session-string "")

(define selenium-http-header
  (lambda (method location)
    (http-header method location "localhost" 4444)))



(define read-response
  (lambda (server)
    (let* ((header (read-response-header server))
           (message-length (string->number (string-trim (substring header (+ (string-contains? header "Content-Length:") 15) (string-length header)))))
           (body (read-response-body server message-length))
           (return-table (make-table)))
      (table-set! return-table 'header header)
      (table-set! return-table 'body body)
      return-table)))

(define read-response-header
  (lambda (server)
    (let ((value (read-line server)))
      (begin
        (if (null? (string->list value))
              ""
              (string-append value " " (read-response-header server)))))))

(define read-response-body
  (lambda (server content-length)
    (let ((buffer (make-string content-length)))
      (read-substring buffer 0 content-length server)
      buffer)))

(define arguments->selenese
  (lambda (arguments #!optional counter)
    (begin
      (if (not counter)
          (set! counter 1))
      (if (null? arguments)
          current-session-string
          (string-append "&" (number->string counter) "=" (car arguments)
                         (arguments->selenese (cdr arguments) (+ counter 1)))))))

(define command-source
  (lambda (cmd arguments)
    (begin
      (display (selenium-http-header "POST" (string-append "cmd=" cmd (arguments->selenese arguments))))
      (selenium-http-header "POST" (string-append "cmd=" cmd (arguments->selenese arguments))))))

(define connect-to-server
  (lambda (server port)
    (open-tcp-client (list server-address: server
                           port-number: port
                           eol-encoding: 'cr-lf))))

(define do-command
  (lambda (cmd arguments)
    (let ((server (connect-to-server "localhost" 4444)))
      (begin
        (display (command-source cmd arguments) server)
        (newline server)
        (force-output server)
        (let ((result (read-response server)))
          (if (not (equal? "OK" (substring (table-ref result 'body) 0 2)))
              (begin
                (display "Bad Response from selenium server!")
                (newline)
                (display (string-append "\t" (table-ref result 'body)))
                (newline)
                (stop-browser)
                (exit))
              (begin
                result)))))))

(define prune-body
  (lambda (body)
    (if (> (string-length body) 2)
        (substring body 3 (string-length body)))))
        

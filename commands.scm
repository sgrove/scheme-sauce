(define start-browser
  (lambda (browser start-url)
    (let ((result (do-command "getNewBrowserSession" (list browser start-url))))
      (set! current-session-string (string-append "&sessionId="
                                                  (prune-body (table-ref result 'body)))))))

(define open-url
  (lambda (url)
    (do-command "open" (list url))))

(define stop-browser
  (lambda ()
      (do-command "testComplete" '())))

(define click
  (lambda (locator)
    (do-command "click" (list locator))))

(define wait-for-page-to-load
  (lambda (timeout)
    (do-command "waitForPageToLoad" (list (number->string timeout)))))

(define double-click
  (lambda (locator)
    (do-command "doubleClick" (list locator))))

(define type
  (lambda (locator value)
    (do-command "type" (list locator value))))

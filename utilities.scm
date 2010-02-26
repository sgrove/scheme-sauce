(define boolean->string
  (lambda (bool)
    (if (string? bool) ; Is this a good idea?
        bool
        (if bool
            "true"
            "false"))))

; Found in the gambit manual. Nice.
(define (string-split sep) 
  (lambda (str) 
    (call-with-input-string str
                            (lambda (p) 
                              (read-all p (lambda (p) (read-line p sep)))))))

(define string-contains?
  (lambda (string token)
    (letrec ((subsearch
              (lambda (counter)
                (cond ((> (+ counter (string-length token))  (- (string-length string) 1)) #f)
                      ((equal? (substring string counter (+ counter (string-length token))) token) counter)
                      (else (subsearch (+ counter 1)))))))
  (subsearch 0))))

(define string-left-trim
  (lambda (string #!optional counter)
    (if (equal? 0 (string-length string))
        ""
        (begin
          (if (not counter)
              (set! counter 1))
          (if (equal? " " (substring string (- counter 1) counter))
              (string-left-trim string (+ counter 1))
              (substring string (- counter 1) (string-length string)))))))

(define string-right-trim
  (lambda (string #!optional counter)
    (if (equal? 0 (string-length string))
        ""
        (begin
          (if (not counter)
              (set! counter (string-length string)))
          (if (equal? " " (substring string (- counter 1) counter))
              (string-right-trim string (- counter 1))
              (substring string 0 counter))))))

(define string-trim
  (lambda (string)
    (string-left-trim (string-right-trim string))))

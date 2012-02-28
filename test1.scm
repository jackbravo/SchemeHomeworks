(load "p1.scm")

(define (rl) (load "test1.scm"))

(load "show.scm")
;;(load "run.scm")

(display "\n\nall files loaded\n\n")

(define (go)
    (begin
	(display "running...\n" oldPort)
	(show "\n\n***** my minimal test for make-table \n")
	    (test-make-table)
	(show "\n\n ===== done with make-table =====\n\n")
	(show "\n\n***** my minimal test for pascal \n")
	    (test-pascal)
	(show "\n\n ===== done with part pascal\n\n")
	(show "\n\n***** my minimal test for lon?\n")
	    (test-lon?)
	(show "\n\n ===== done with lon?=====\n\n")
	(show "\n\n***** my minimal test for dot-product")
	    (test-dot-product)
	(show "\n\n ===== done with dot-product \n\n")
	 (show "\n\n***** my minimal test for lexemes \n")
	    (test-lexemes)
	 (show "\n\n ===== done with lexemes =====\n\n")
	(display "testing completed...\n" oldPort)
	 (reset)
    )
)

(define (reset)
	(set-current-output-port! oldPort)
	(close-port port))

(display "\nreading part 1\n\n")

;;;;; part 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define l1 '(a b c d e))
(define l2 '(1 2 3 4 5))

(define (test-make-table)
    (show "testing make-table
    
>> (define l1 '(a b c d e))
>> (define l2 '(1 2 3 4 5))

>> (make-table l1 l2)    ;; should be ((a 1) (b 2) (c 3) (d 4) (e 5))
    " (make-table l1 l2)  "
   " ))

(display "\nreading part 2\n\n")
;;;;; part 2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (test-pascal)
    (show "testing pascal

>> (pascal 2)        ;; should be (1 1)
    " (pascal 2) "
>> (pascal 5)        ;; should be (1 4 6 4 1)
    " (pascal 5) "

    "))

(display "\nreading part 3\n\n")
;;;;; part 3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (test-lon?)
    (show "testing lon?

>> (lon? '(1 2 3 4 5))        ;; should be #t
    " (lon? '(1 2 3 4 5)) "
>> (lon? '(a b c d e))        ;; should be #f or ()
    " (lon? '(a b c d e)) "
    "))

(display "\nreading part 4\n\n")
;;;;; part 4 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (test-dot-product)
    (show "testing dot-product

>> (dot-product '(1 2 3) '(1 2 3))        ;; should be 14
        " (dot-product '(1 2 3) '(1 2 3)) "
   " ))

(display "\nreading part 5\n\n")
;;;;; part 5 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (test-lexemes)
    (show "testing lexemes
    
>> (make-lexeme 'fn)    ;; exact format of your lexemes is up to you
    " (make-lexeme 'fn) "
>> (lexeme? (make-lexeme 'fn))    ;; should be true
    " (lexeme? (make-lexeme 'fn)) "
>> (get-type (make-lexeme 'fn))    ;; should be fn
    " (get-type (make-lexeme 'fn)) "
>> (make-lexeme 25)    ;; exact format of your lexemes is up to you
    " (make-lexeme 25) "
>> (get-int-value (make-lexeme 25))    ;; should be 25
    " (get-int-value (make-lexeme 25)) "
>> (make-lexeme 'var \"id\")    ;; exact format of your lexemes is up to you
    " (make-lexeme 'var "id") "
>> (get-string-value (make-lexeme 'var \"id\"))    ;; should be abc
    " (get-string-value (make-lexeme 'var "id")) "
   " ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(display "\ntest4.scm loaded successfully!\n\n")

(define port)
(define oldPort (current-output-port))
(set! port (open-output-file "test-report"))
(set-current-output-port! port)
(go)


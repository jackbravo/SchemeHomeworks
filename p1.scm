;; Author: Joaquin Bravo
;; Version: 1.0
;; Date: Mar, 2004

(define make-table
  (lambda (l1 l2)
    (map list l1 l2)))
;   (cons (list (car l1) (car l2)) (make-table (cdr l1) (cdr l2))) ))
;   either the map or the cons function do the same job

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (pascal n)
  (letrec 
      ((p-count (lambda (ret)
		 (if (>= (length ret) n) ret
		     (p-count (p-next ret)))))
       (p-next (lambda (ret)
		 (append (list-head ret 1)
			 (p-mid ret)
			 (last-pair ret))))
       (p-mid (lambda (ret)
		(if (null? (cdr ret)) '()
		    (append
		     (list (+ (car ret) (cadr ret)))
		     (p-mid (cdr ret)))))))
    (p-count '(1))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (lon? l1)
  (cond ((null? l1) #f)
	((equal? (keep-matching-items l1 number?) l1) #t)
	(else #f)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define dot-product
  (lambda (l1 l2)
    (apply + (map * l1 l2))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define make-lexeme
  (lambda args
    (cond 
     ((null? args) '())
     ((= (length args) 1) (cond
			   ((number? (car args)) (list 'lexeme 'num (car args)))
			   ((symbol? (car args)) (list 'lexeme (car args)))
			   (else (display "Expected number or symbol\n"))))
     ((= (length args) 2) (if (and (symbol? (car args)) (string? (cadr args)))
			      (list 'lexeme (car args) (cadr args))
			      (display "Expected symbol and string\n"))))))

(define (lexeme? lex)
  (if (and (symbol? (car lex)) (equal? (car lex) 'lexeme)) #t #f))

(define (get-type lex)
  (if (lexeme? lex) (cadr lex) (display "Not a lexeme")))

(define (get-string-value lex)
  (if (and (lexeme? lex)
	   (or (equal? (cadr lex) 'string) (equal? (cadr lex) 'var))
	   (string? (caddr lex)))
      (caddr lex)
      (display "Not a string or var lexeme\n")))

(define (get-int-value lex)
  (if (and (lexeme? lex)
	   (equal? (cadr lex) 'num)
	   (number? (caddr lex)))
      (caddr lex)
      (display "Not a num lexeme")))

(display "\n\nassignment 1 loaded!\n\n")

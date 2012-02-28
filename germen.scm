(define factorial
  (lambda (n)
    (cond
     ((< n 0) #f)
     ((or (eq? n 0) (eq? n 1)) 1)
     (else (* n (factorial (- n 1)))))))
;Value: factorial

(define fibonacci
  (lambda (n)
    (cond
     ((eq? n 0) 0)
     ((eq? n 1) 1)
     (else (+ (fibonacci (- n 1)) (fibonacci (- n 2)))))))
;Value: fibonacci

(define append2
  (lambda (x y)
    (cond
     ((null? x) y)
     ((null? y) x)
     (else (cons (car x) (append2 (cdr x) y))))))
;Value: append2

(define list-fibo
  (lambda (n)
    (cond
     ((eq? n 0) '(0))
     (else (append (list-fibo (- n 1)) (list (fibonacci n)))))))
;Value: list-fibo

(define hasta
  (lambda (item lista)
    (cond
     ((eq? (car lista) item) (list item))
     (else (cons (car lista) (hasta item (cdr lista)))))))
;Value: hasta

(define resto
  (lambda (item lista)
    (cond
     ((eq? (car lista) item) (cdr lista))
     (else (resto item (cdr lista))))))
;Value: resto

(define insert-r
  (lambda (elem item lista)
    (cond
     ((null? lista) #f)
     (else (append (hasta item lista) (list elem) (resto item lista))))))
;Value: insert-r
 
(insert-r 'x 'c '(a b c d e))
;Value 36: (a b c x d e)






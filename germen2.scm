
(define reverse2
 (lambda (lista)
  (cond
   ((null? lista) #f)
   ((null? (cdr lista)) lista)
   (else (append (reverse2 (cdr lista)) (list (car lista)))))))
;Value: reverse2

(define palindrome
  (lambda (lista)
    (cond 
     ((null? lista) #f)
     ((null? (cdr lista)) lista)
     (else (append lista (cdr (reverse2 lista)))))))
;Value: palindrome

;Value: palindrome

(palindrome '(a b c d e))
;Value 18: (a b c d e d c b a)

(define length
  (lambda (lista)
    (length-iter lista 1)))

(define length-iter
  (lambda (lista counter)
    (cond






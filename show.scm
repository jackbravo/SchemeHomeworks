;;show.scm

;; show is a variatic function that displays all the elemnts in its
;; list of arguments
(define show  
    (lambda items 
	(if (not (null? items)) 
	    (begin (display (car items)) (apply show (cdr items))) 
        ))) 
;; displayln displays each element in its argument list on a 
;; separate line
(define displayln
  (lambda lst
    (begin
      (for-each display lst)
      (newline))))

;; use cr for the newline character
(define CR "\n")

;; use tab for the tab character
(define tab "\t")
(define indent "    ")

;; the input prompt
(define prompt ">>  ")

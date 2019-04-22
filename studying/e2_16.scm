(define (main)
    (define L (list 1 2 3 4))
    (println (apply make-multiplication (cddr L)))
)

(define (make-multiplication @) 
    (cons '* @)
)
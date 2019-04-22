(define (main)

    (println (cons 1 (cons (cons 2 3) (cons 4 nil))))
    ;(1 (2 . 3) 4)
    (println (cons (cons 1 2) (cons 3 4)))
    ;((1 . 2) 3 . 4)
    (println (cons (cons 1 2) (cons (cons 3 4) nil)))
    ;((1 . 2) (3 . 4))

    (define a 5)
    (define b 3)
    (define (base p) (cadr p))
    (define (exponent p) (caddr p))
    ;(println (exponentiation? (list '** a b)))
    (define L (list '** a b))
    (if (exponentiation? L)
        (println (make-exponentiation (base L) (exponent L)))
    )
    ;(println (cdr (list 'a 'b 'c)))
    ;;(println 'a)            ;Quotes a
    ;(println ''a)           ;Same as (quote 'a)
    ;(println (quote ''a))   ;Quote of the quote of the quote of a, same as (quote (quote (quote a))))
    ;(println '(quote ''a))  ;Quote of the quote of the quote of a. Same as below.
    ;(println (quote (quote (quote (quote a))))) ;The first quote quotes the rest of the statement rather than evaluating it.
)
(define (make-exponentiation a b)
    (cond 
        ((= b 1) a)
        (else (* a (make-exponentiation a (- b 1))))
    )
)
(define (exponentiation? p) (eq? (car p) '**))

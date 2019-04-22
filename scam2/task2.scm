(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (readArgs)
)

(define (readArgs)
    (define env this)
    (define (iter expr)
        (if (not (eof?))
            (begin (eval expr env) 
                (iter (readExpr))
            )
        )
    )
    (iter (readExpr))
)

(define (curry @)
    (if (is? (car @) 'CONS)
        (define x 
            (car @)
        )
        (define x @)
    )
    (define (continue) 
        (length (get 'parameters (car x)))
    )
    (if (< (length (cdr x)) (continue))
        (lambda (@) (curry (append x @)))
        (apply (car x) (cdr x))
    )
)
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

(define (let*->lambdas x)
    (if (eq? 'let* (car (car (cdr (cdr x)))))
        (list
        'define
        (car (cdr x))
        ;(car (cdr (cdr x))) Let expression
        ;(car (car (cdr (cdr x)))) ;let*
        (construct (cdr (car (cdr (cdr x)))))
        ;(cdr (car (cdr (cdr x)))) ; without let ;list of variables and values
        ;(car (cdr (cdr (car (cdr (cdr x)))))) ;list of functions
        )
        x
    )
)

(define (construct x)
    ;(println x)
    (if (< (length (car x)) 2)
                    (append (list
                    (append (list 
                    'lambda 
                    (variables (car x)))
                    (cdr x)))
                    (values (car x)))
            (append (list 
                    (list
                    'lambda 
                    (variables (car x))
                    (construct (append (list(cdr (car x))) (cdr x)))))
                    (values (car x)))))


(define (variables l)
    ;(println "Length : " (length l) "; Variables: "l)
    (if (< (length l) 2)
        (list (car (car l)))
        (variables (list(car l)))
    )
)

(define (values l)
    ;(println "Length : " (length l) "; Values: "l)
    (if (< (length l) 2)
        (list (car (cdr (car l))))
        (variables (list(cdr (car l))))
    )
)
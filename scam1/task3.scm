(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (define args (list (readInt) (readExpr)))
    (define root-n (root (getElement args 0)))
    (print "((root-n ")
    (print (getElement args 0))
    (print ") ")
    (print (getElement args 1))
    (print ") is ")
    (println (fmt "%.15f" (root-n (getElement args 1) 1.0 0.0)))
)


(define (root n)
    (define (nRoot x y old)
        (cond
            ((== y 1.0)
                (if (== n 1.0)
                    1.0
                    (nRoot x (/(+(* (- n 1.0) y) (/ x (expt y (- n 1.0))))n) y)
                )
            )
            ((> (abs(/(- y old) old)) 0.0000000000000001)
                (nRoot x (/(+(* (- n 1.0) y) (/ x (expt y (- n 1.0))))n) y)
            )
            (else
                y
            )
        )
    )
)
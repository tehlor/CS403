(define (main)
    (println (accumulate + 0 (list 1 2 3 4 5)))
    (println (accumulateTwo + 0 (list 1 2 3 4 5)))
)

(define (accumulate op base items)
    (cond
        ((null? items)
            base
        )
        (else 
            (op 
                (car items) 
                (accumulate op base (cdr items))
            )
        )
    )
)

(define (accumulateTwo op base items)
    (cond
        ((null? items)
            base
        )
        (else 
            (accumulate op base (cons 
                                    (op (car items) (cadr items)) 
                                    (cddr items)
                                )
            )
        )
    )
)
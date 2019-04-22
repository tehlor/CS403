(define (main)
    (println (countItems nil))
    (println (countItems 5))
    (println (countItems (list 1 2 3)))
    (println (countItems (list (cons 1 2) 3 4)))
)

(define (countItems n)
    (cond 
        ((null? n) 0)
        ((not (pair? n)) 1)
        (else
            (+ 
                (countItems (car n))
                (countItems (cdr n))
            )
        )
    )
)

(define (main)
    (println (accumulate (lambda (x y) (+ 1 y)) 0 (list 1 2 3 4 5 6)))
)

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op
            (car sequence)
            (accumulate op initial (cdr sequence))
        )
    )
)

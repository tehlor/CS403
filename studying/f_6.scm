(define (main)
    (define items (cons 1 (cons 2 (cons 3 items))))
    (println (car items)) ; should be 1
    (println (car (cdr items))) ; should be 2
    (println (car (cdr (cdr items)))) ; should be 3
    (println (car (cdr (cdr (cdr items))))) ; should be 1
    (println (car (cdr (cdr (cdr (cdr items)))))) ; should be 2
    (println (car (cdr (cdr (cdr (cdr (cdr items))))))) ; should be 3
    (println (car (cdr (cdr (cdr (cdr (cdr (cdr items)))))))) ; should be 1
)


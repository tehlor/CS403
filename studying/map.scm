(define (main)
    (define L (list 1 2 3 4 5))
    (define M (list 1 2 3 4 5))
    (println (map (lambda (x) (+ x 1)) L))
    (println (map (lambda (x y) (* x y)) L M))
)

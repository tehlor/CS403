(define (main)
    (println (car (cons 1 2)))
)

(define (car c) (c (lambda (a b) a)))

(define (cons a b) (lambda (w) (w a b)))
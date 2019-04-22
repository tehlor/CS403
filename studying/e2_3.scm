(define (main)
   ;Church numeral
   (define three (lambda (f) (lambda (x) (f (f (f x))))))
   ;incrementor
   (define (inc x) (list x '+ 1))
   ;Original base value
   (define base 0)
   ;Expression
   (define x ((three inc) base))
   (inspect x)
)

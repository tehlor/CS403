(define (main)
    (define items (list 1 2 3 4 5))
    (define a (equalToMap proc items))
    (define m (map double items))
    (println "Accumulate: " a)
    (println "Map: " m)
)

(define (equalToMap proc items)
    (accumulate (lambda (x y) 
                    (cons (proc x) y)
                ) 
                nil 
                items
    )
)

(define (double x)
    (* 2 x)
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
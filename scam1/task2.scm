(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (define args (list (readInt) (readReal) (readReal)))

    (define func (mandelbrot (getElement args 0)))
    (print "((mandelbrot " 
            (getElement args 0) 
            ") "
            (getElement args 1)
            " "
            (getElement args 2)
            ") is "
            )
    (println (func  (getElement args 1)
                    (getElement args 2)
                    0.0
                    0.0
                    0
            )
    )
)

(define (getS r s y)
    (+(* (* 2 r) s) y)
)

(define (getR r s x)
    (+(- (* r r) (* s s)) x)
)

(define (mandelbrot i)
    (define (iterate x y r s count)
        (cond
            ((> (+ (* r r ) (* s s)) 4)
                (if (>= count i)
                    0
                    count
                )
            )
            (else
                (define newR (getR r s x))
                (define newS (getS r s y))
                (if (> count i)
                    0
                    (iterate x y newR newS (+ count 1))
                )
            )
        )
    )
)
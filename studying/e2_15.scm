(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (define args (list (readInt) (readInt)))
    (println (make-exponentation (getElement args 0) (getElement args 1)))
)

;Problem states that all bases and exponents are non-zero!

(define (make-exponentation base exponent)
    (cond 
        ((== exponent 1)
            base
        )
        (else
            (* base (make-exponentation base (- exponent 1)))
        )
    )
)
(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (define function (eval (readExpr) this))
    (define argument (readInt))
    (cond 
        ((== argument 0)
            (iIsZero function 0)
        )
        (else
            (standard function argument)
        )
    )
)

(define (printResults argument S W)
    (println "(S <function anonymous(x)> " argument ") is " (fmt "%.15f" S))
    (println "(w <function anonymous(x)> " argument ") is " (fmt "%.15f" W))
)

(define (iIsZero function argument)
    (define result (function 0))
    (printResults argument result result)
)

(define (standard function argument)
    (define btm (sumBtm function (- argument 1)))
    (define middle (+ btm (function argument)))
    (define top (+ middle (function (+ argument 1))))
    (define W (computeW btm middle top))
    (printResults argument middle W)
)

(define (computeW btm middle top)
    ;(println btm " " middle " " top) 
    (define numerator 
        (-
            (*
                top
                btm
            )
            (*
                middle
                middle
            )
        )
    )
    (define denominator
        (+
            (-
                top
                (*
                    2
                    middle
                )
            )
            btm
        )
    )
    ;(println numerator " " denominator)
    (/
        numerator
        denominator
    )
)

(define (sumBtm f i)
    (cond
        ((== i 0)
            (f 0)
        )
        (else
            (+ (f i) (sumBtm f (- i 1)))
        )
    )
)
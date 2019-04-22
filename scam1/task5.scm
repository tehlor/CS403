(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (define function (eval (readExpr) this))
    (define a (getNumber))
    (define b (getNumber))
    (define c (getNumber))
    (define d (getNumber))
    (println 
        "(((((curry " function ") " a ") " b ") " c ") " d ") is "
        (function a b c d)
    )
)

(define (getNumber)
    (define a (readReal))
    (define remainder (- a (int a)))
    (if (> remainder 0)
        a
        (int a)
    )
)

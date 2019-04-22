(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (define a (readInt))
    (define b (readInt))
    (define half (halve a))
    (define div2 (div2? a half))
    (define doub (double a))
    (define eth (ethiop a b 0))
    (printResults a b half doub div2 eth)
)

(define (printResults a b half double div2 eth)
    (println "(halve " a ") is " half)
    (println "(double " a ") is " double)
    (println "(div2? " a ") is " div2)
    (println "(ethiop " a " " b ") is " eth)
)

(define (ethiop a b total)
    (cond 
        ((== b 1)
            ;Base case always add and return
            (+ total a)
        )
        ((< b 1)
            total
        )
        (else
            (define halfOfB (halve b))
            (define bIsEven (div2? b halfOfB))
            (cond 
                ((== bIsEven #f)
                    (ethiop (double a) halfOfB (+ total a))
                )
                (else
                    (ethiop (double a) halfOfB total)
                )
            )
        )
    )
)

(define (div2? a half)
    (define result
        (- a half half)
    )
    (if (== result 0)
        #t
        #f
    )
)

(define (double a)
    (+ a a)
)

(define (halve a)
    (define (halve-iterator current previous r number)
        (cond
            ((= current r) (+ number previous))
            ((> (double current) r)
                (halve-iterator 1 0 (- r current) (+ number previous))
            )
            (else (halve-iterator (double current) current r number))
        )
    )
    (halve-iterator 1 0 a 0)
)
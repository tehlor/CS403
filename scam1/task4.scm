(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (define args (list (readInt) (readInt) (readInt)))
    (println "((crazyTriangle " 
             (getElement args 0) " "
             (getElement args 1) ") "
             (getElement args 2)
             ")"
             )
    ((crazyTriangle (getElement args 0) (getElement args 1)) (getElement args 2))
)

(define (crazyTriangle a b)
    (define (function c)
        (cond 
            ((== c 1)
                (println a)
                0
            )
            ((== c 2)
                (println " " a)
                (println a " " b)
                0
            )
            (else
                (printLevels (- c 1))
                (println a)
                (printLevels (- c 2))
                (println a " " b)
                (printLevels (- c 3))
                (printTriangle a b c 1 3)
                0
            )
        )
    )
)

(define (findSum a b c p)
    (cond
        ((< c 5)
            (calculate a b c p)
        )
        ((< p 3)
            (calculate a b c p)
        )
        ((> p (- c 2))
            (calculate a b c p)
        )
        (else
            (+ (findSum a b (- c 1) p) (findSum a b (- c 1) (- p 1)))
        )
    )
)

(define (printLevels n)
    (cond
        ((> n 0)
            (print " ")
            (printLevels (- n 1))
        )
        (else
            0
        )
    )
)

(define (calculate a b c p)
    (+
        (* 
            (- c p) 
            a
        ) 
        (* (- (- c 1) (- c p))
            b
        )
    )
)

(define (printTriangle a b c position currentLevel)
    (cond
        ((> currentLevel c)
            0
        )
        ((== position 1)
            (print a " ")
            (printTriangle a b c (+ position 1) currentLevel)
        )
        ((== position currentLevel)
            (println b)
            (printLevels (- c currentLevel 1))
            (printTriangle a b c 1 (+ currentLevel 1))
        )
        (else
            (define n (findSum a b currentLevel position))
            (print n " ")
            (printTriangle a b c (+ position 1) currentLevel)
        )
    )
)


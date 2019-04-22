(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (define arg (readExpr))
    (define c (cyan arg))
    (define y (yellow arg))
    (define m (magenta arg))
    (println "(cyan " arg ") is " c)
    (println "(yellow " arg ") is " y)
    (println "(magenta " arg ") is " m)
    (define s (hexFirst c))
    (define ss (hexSecond (getRemainder s)))
    (define sss (hexFirst y))
    (define ssss (hexSecond (getRemainder sss)))
    (define sssss (hexFirst m))
    (define ssssss (hexSecond (getRemainder sssss)))
    (println "(cym " arg ") is #"
                    (computeCharacter s)
                    (computeCharacter ss)
                    (computeCharacter sss)
                    (computeCharacter ssss)
                    (computeCharacter sssss)
                    (computeCharacter ssssss)
    )
)

(define (computeCharacter n)
    (cond
        ((and (< n 1.0) (>= n 0.0))
            "0"        
        )
        ((and (< n 2.0) (>= n 1.0))
            "1"        
        )
        ((and (< n 3.0) (>= n 2.0))
            "2"        
        )
        ((and (< n 4.0) (>= n 3.0))
            "3"        
        )
        ((and (< n 5.0) (>= n 4.0))
            "4"        
        )
        ((and (< n 6.0) (>= n 5.0))
            "5"        
        )
        ((and (< n 7.0) (>= n 6.0))
            "6"        
        )
        ((and (< n 8.0) (>= n 7.0))
            "7"        
        )
        ((and (< n 9.0) (>= n 8.0))
            "8"        
        )
        ((and (< n 10.0) (>= n 9.0))
            "9"        
        )
        ((and (< n 11.0) (>= n 10.0))
            "A"        
        )
        ((and (< n 12.0) (>= n 11.0))
            "B"        
        )
        ((and (< n 13.0) (>= n 12.0))
            "C"        
        )
        ((and (< n 14.0) (>= n 13.0))
            "D"        
        )
        ((and (< n 15.0) (>= n 14.0))
            "E"        
        )
        (else "F")
    )
)

(define (getRemainder n)
    (define x (int(+ n 0)))
    (- n x)
)

(define (hexFirst n)
    (* n (/ 1.0 16.0))
)

(define (hexSecond n)
    (* n 16.0)
)

(define (cyan n)
    (if (> n -1)
        (if (< n 101)
            (int 
                (+ 
                    (* 
                        (sin 
                            (+ 
                                (/ n (divideByPi 200)) 
                                (/ 3.14159265358979323846 2)
                            )
                        ) 
                        255
                    ) 
                    0.00000001
                )
            )
        )
    )
)

(define (yellow n)
    (if (> n -1)
        (if (< n 101)
            (int (+ (+ (* (sin (/ n (divideByPi 100))) -255) 255) 0.00000001))
        )
    )
)

(define (magenta n)
    (if (> n -1)
        (if (< n 101)
            (int
                (+ 
                    (+ 
                        (* 
                            (sin 
                                (+ 
                                    (/ 
                                        n 
                                        (
                                            divideByPi
                                            (* 
                                                100 
                                                0.6666666666666666
                                            )
                                        )
                                    ) 
                                    (/ 3.14159265358979323846 2)
                                )
                            ) 
                            127.5
                        ) 
                        127.5
                    ) 
                    0.00000001
                )
            )
        )
    )
)

(define (divideByPi n)
    (/ n 3.14159265358979323846)
)
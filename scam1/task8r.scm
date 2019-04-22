(define (main)
  (setPort (open (getElement ScamArgs 1) 'read))
  (define arg1 (readInt))
  (define res (ecfr arg1))
  (println "(ecfr " arg1 ") is " (fmt "%.25f" res))
)

(define (ecfr n)
  (define (helper depth)
    (if (<= depth n)
      (/ 1 (+ 1 (/ 1 (+ (* 2 depth) (/ 1 (+ 1 (helper (+ depth 1))))))))
      0.0
    )
  )
  (+ 2 (helper 1.0))
)
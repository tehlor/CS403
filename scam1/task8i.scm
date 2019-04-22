(define (main)
  (setPort (open (getElement ScamArgs 1) 'read))
  (define arg1 (readInt))
  (define res (ecfi arg1))
  (println "(ecfi " arg1 ") is " (fmt "%.25f" res))
)

(define (firstDigitAt depth)
  (cond
    ((= depth 0) 1)
    (else
      (* 2 depth)
    )
  )
)

(define (ecfi x)
  (define (innerecfi curr total)
    (cond
      ((= curr 0) total)
      (else
        (innerecfi (- curr 1) (/ 1 (+ 1 (/ 1.0 (+ (firstDigitAt curr) (/ 1.0 (+ 1 total)))))))
      )
    )
  )
  (+ 2 (innerecfi x 0.0))
)
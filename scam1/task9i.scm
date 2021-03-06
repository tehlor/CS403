(define (main)
  (setPort (open (getElement ScamArgs 1) 'read))
  (define arg1 (readInt))
  (define res (ramanujani arg1))
  (println "(ramanujani " arg1 ") is " (fmt "%.25f" res))
  (println "$4$")
)

(define (ramanujani depth)
  (define (ramanujani-iter total curr)                
    (if (> curr 0)                         
      (ramanujani-iter (* curr (sqrt (+ (+ curr 5) total))) (- curr 1))
      total                                
    )
  )
  (ramanujani-iter 0 (+ depth 1)) 
)                    
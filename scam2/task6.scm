(define (main)
    (setNilDisplay 'nil)
    (setPort (open (getElement ScamArgs 1) 'read))
    (readArgs)
)

(define (readArgs)
    (define env this)
    (define (iter expr)
        (if (not (eof?))
            (begin (eval expr env) 
                (iter (readExpr))
            )
        )
    )
    (iter (readExpr))
)
;; let psetRest be all obtained subsets (ps (cdr set)) so we dont have to call it twice below 
;; append the list of all current subsets to the new subsets obtained by adding (car set) to all current subsets
;; cons car to all subsets of pset rest to obtain the new subsets
(define (F e T)
  (map
    (lambda (X)
      (cons e X)
      )
    T
    )
  )

(define (powerSet S)
  (cond
    ((null? S) '(()) )
    (else 
      (let ( (T (powerSet (cdr S))) (e (car S)) )
        (merge
          T
          (F e T)
          )
        )
      )
    )
  )

(define (merge a b)
  (define (help f s)
    (cond 
      ((null? f) s)
      ((null? s) f)
      (else
            (if (< (length (car f)) (length (car s)))
                (cons (car f) (help (cdr f) s))
                (cons (car s) (help f (cdr s)))
            )
        )
      )
    )
  (help a b)
)


(define (main)
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

(define (accumulate op initial sequence)
    ;(println sequence)
   (if (null? sequence)
       initial
       (if (null? (car sequence))
            initial
            (op (car sequence)
                (accumulate op initial (cdr sequence))))))

(define (accumulate-n op init seqs)
    ;(println seqs)
   (if (null? (car seqs))
       nil
       (cons (accumulate op init (map car seqs))
             (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
   (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
   (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
   (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
   (let ((cols (transpose m)))
     (map (lambda (row) (matrix-*-vector cols row)) n)))

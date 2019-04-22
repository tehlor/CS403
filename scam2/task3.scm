(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (setNilDisplay 'nil)
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

(define (newList)
    (list)
)

(define (Stack)
    (newList)
)

(define (Queue)
    (list (list) (list))
)

(define (peek L)
    (if (null? L)
        '()
        (car L)
    )
)

(define (remove L)
    (if (null? L)
        '()
        (cdr L)
    )
)

(define (insert L el mode)
    (if (null? L)
        (list el)
        (cond
            ((== mode 0) ;Stack
                (append (list el) L)
            )
            ((== mode 1) ;Queue
                (append (list el) L)
            )
        )
    )
)

(define (empty L size)
    (if (null? L)
        size
        (empty (remove L) (+ size 1))
    )
)

(define (ssize L)
    (empty L 0)
)

(define (qsize L)
    (empty (car L) 0)
)

(define (qpeek L)
    ;(println L)
    (if (null? (cdr L))
        (qpeek (transfer L))
        (if (null? (car (cdr L)))
            (qpeek (transfer L))
            (car (car (cdr L)))
        )
    )
)

(define (speek L)
    (peek L)
)

(define (pop L)
    (remove L)
)

(define (pop2 L)
    ;(println "Popping: " L)
    (if (null? (car L))
        (if (null? (car (cdr L)))
            (list (list) (list))
            (list (list) (cdr (car (cdr L))))
        )
        (list (car L) (cdr (car (cdr L))))
    )
)

(define (dequeue L)
    ;(println "Dequeuing: " L)
    (if (null? (car (cdr L)))
        (pop2 (transfer L))
        (pop2 L)
    )
)

(define (transfer L)
    ;(println "Transfer: " L)
    (if (null? (car L))
        (if (null? (car (cdr L)))
            (list (list) (list))
            (list (list) (car (cdr L)))
        )
        (transfer (list 
                    (cdr (car L)) 
                    (insert (car (cdr L)) 
                            (car (car L)) 
                            1)))
    )
)

(define (push L el)
    (insert L el 0)
)

(define (enqueue L el)
    ;(println "Enqueue: " L)
    (if (null? (car L))
        (if (null? (car (cdr L)))
            (list (list el) (list))
            (list (list el) (car (cdr L)))
        )
        (if (null? (car (cdr L)))
            (list (insert (car L) el 1) (list))
            (list (insert (car L) el 1) (car (cdr L)))
        )
    )
)
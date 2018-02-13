(define (append listOne listTwo)
  (cond
    ((null? listOne) listTwo)
    (else (cons (car listOne) (append (cdr listOne) listTwo)))))

(define (merge listOne listTwo)
  (cond
    ((null? listOne) listTwo)
    ((null? listTwo) listOne)
    ((< (car listOne) (car listTwo))
     (append (cons (car listOne) '())
             (merge (cdr listOne) listTwo)))
    ((= (car listOne) (car listTwo))
     (append (cons (car listOne) '())
             (merge (cdr listOne) listTwo)))
    (else (append (cons (car listTwo) '())
                  (merge listOne (cdr listTwo))))))

(define (mergesort lis)
  (cond
    ((null? lis) '())
    ((null? (cdr lis)) lis)
    (else (merge (cons (car lis) '())
                 (mergesort (cdr lis))))))

(mergesort '(99 77 88 66 44 55 33 11 22 0))

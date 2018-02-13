
(define (mergesort L)
  (define tmp (map list L))
  (define (iter newL)
    (if (null? (cdr newL))
	(car newL)
	(iter1 (go newL '() merge))))
  
   (define (iter1 newL)
     (if (null? (cdr newL))
	 (car newL)
	 (iter (go newL '() merge1))))
   (if (odd? (floor (/ (log (length L)) (log 2))))
       (iter tmp)
       (iter1 tmp)))

      
(define (sort2 a b)
  (if (< a b)
      (list a b)
      (list b a)))

(define (mergeL a b)
  (cond ((null? a) b)
	((null? b) a)
	((< (car a) (car b)) (cons (car a) (mergeL (cdr a) b)))
	(else (cons (car b) (mergeL a (cdr b))))))

(define (go wait-list finish-list merge)
  (if (null? wait-list)
      finish-list
      (if (null? (cdr wait-list))
	  (cons (merge (car wait-list) (car finish-list)) (cdr finish-list))
	  (go (cddr wait-list) (cons (merge (car wait-list)
					    (cadr wait-list))
				     finish-list) merge))))
					    

(define (merge a b)
  (define (iter tmp a b)
    (cond ((null? a) (append (reverse b) tmp))
	  ((null? b) (append (reverse a) tmp))
	  ((< (car a) (car b)) (iter (cons (car a) tmp) (cdr a) b))
	  (else (iter (cons (car b) tmp) a (cdr b)))))
  (iter '() a b))

(define (merge1 a b)
  (define (iter tmp a b)
    (cond ((null? a) (append (reverse b) tmp))
	  ((null? b) (append (reverse a) tmp))
	  ((< (car a) (car b)) (iter (cons (car b) tmp) a (cdr b)))
	  (else (iter (cons (car a) tmp ) (cdr a) b))))
  (iter '() a b))

(define (enumerate a b tmp)
  (if (= a b) tmp (enumerate a (- b 1) (cons b tmp))))

(define test (enumerate 0 100000 '()))

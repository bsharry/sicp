(define (split L)
  (define (right L a b)
    (if (null? L)
	(cons a b)
	(left (cdr L) a (cons (car L) b))))
  (define (left L a b)
    (if (null? L)
	(cons a b)
	(right (cdr L) (cons (car L) a) b)))
  (left L '() '()))
    

(define (merge-sort L)
  (if (< (length L) 2) 
      L
      (merge (merge-sort (car (split L))) (merge-sort (cdr (split L))))))

(define (sort2 L)
  (if (= (length L) 1)
      L
      (if (< (car L) (cadr L))
	  L
	  (list (cadr L) (car L)))))

(define (merge p q)
  (cond ((null? p) q)
	((null? q) p)
	((< (car p) (car q))
	 (cons (car p) (merge (cdr p) q)))
	(else (cons (car q) (merge p (cdr q))))))
     

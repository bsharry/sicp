(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
	  (accumulate op init (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (a b) (+ (* a x) b)) 0 coefficient-sequence))
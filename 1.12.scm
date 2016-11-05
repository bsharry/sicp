(define (element x y)
	(cond ((or (= y 1) (= x y)) 1)
		(else (+ (element (- x 1) (- y 1)) (element (- x 1) y)))))

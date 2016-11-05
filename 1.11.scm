(define (f-iter a b c i n)
	(if (= i n)
		a
	(f-iter (+ a (* 2 b) (* 3 c)) a b (+ i 1) n)))
(define (f n)
	(cond ((< n 3) n)
	(else (f-iter 2 1 0 2 n))))
(define (f-rec n)
	(if (< n 3)
		n
	(+ (f-rec (- n 1)) (* 2 (f-rec (- n 2))) (* 3 (f-rec (- n 3))))))

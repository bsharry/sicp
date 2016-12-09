(define (make-account password amount)
	(let ((balance amount))		
	(define (withdraw x)
		(set! balance (- balance x))
			balance)
	(define (dispatch passwd method)
                        (if (eq? password passwd)
                                (if (eq? method 'withdraw)
                                        withdraw
                                (error "no such method"))
                                (begin (display password) (display passwd))))
dispatch))
			

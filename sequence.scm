(define (accumulate proc end items)
	(if (null? items)
		end
	    (proc (car items) (accumulate proc end (cdr items)))))
(define (map proc items)
	(if (null? items)
		()
	    (cons (proc (car items)) (map proc (cdr items)))))
(define (emulate-tree items)
		(cond ((null? items) ())
			((not (pair? items)) (list items))
			(else (append (emulate-tree (car items)) (emulate-tree (cdr items))))))

(define (flatmap op l)
  (accumulate append '() (map op l)))


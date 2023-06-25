#lang racket

(provide classify)

(require math/number-theory)

(define (divisors number)
  ; for each value x in the range
  (stream-fold
   ; check if x divides number
   (lambda (acc x)
     (cond
       ; if it divides number
       [(divides? x number)
        (define q (quotient number x))
        (cond
          ; check if the quotient is x himself or number
          [(or
            (= q x)
            (= q number))
           (append acc (list x))]
          ; if it is not, append it to the divisors list
          [else (append acc (list x q))])]
       [else acc]))
   empty
   (in-range 1 (sqrt number))))

(define (classify number)
  (define aliquot-sum (apply + (divisors number)))
  (cond
    [(< aliquot-sum number) 'deficient]
    [(> aliquot-sum number) 'abundant]
    [else 'perfect]))

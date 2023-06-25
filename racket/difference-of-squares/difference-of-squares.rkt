#lang racket

(provide sum-of-squares square-of-sum difference)

(define (sum-of-squares number)
  (for/sum ([x (in-inclusive-range 1 number)]) (expt x 2)))

(define (square-of-sum number)
  (expt (for/sum ([x (in-inclusive-range 1 number)]) x) 2))

(define (difference number)
  (- (square-of-sum number) (sum-of-squares number)))

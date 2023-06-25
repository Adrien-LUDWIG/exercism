#lang racket

(provide sum-of-squares square-of-sum difference)

; Σn² = n(n+1)(2n+1) / 6
(define (sum-of-squares number)
  (/ (* number (add1 number) (add1 (* 2 number))) 6))

; (Σn)² = n(n+1) / 2 
(define (square-of-sum number)
  (expt (/ (* number (add1 number)) 2) 2))

(define (difference number)
  (- (square-of-sum number) (sum-of-squares number)))

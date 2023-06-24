#lang racket

(provide armstrong-number?)

; `foldr-digits` applies a procedure to the digits of a natural number,
; from the right to the left.
(define (foldr-digits proc init n)
  (cond
    [(zero? n) init]
    [else (foldr-digits proc (proc (modulo n 10) init) (quotient n 10))]))

(define (get-nb-of-digits n)
  (foldr-digits (lambda (digit acc) (add1 acc)) 0 n))

; `sum-of-powers` returns the sum of digits the digits of `n`,
; each to the power of `nb-of-digits`.
(define (sum-of-powers n nb-of-digits)
  (foldr-digits (lambda (digit acc) (+ acc (expt digit nb-of-digits))) 0 n))

(define (armstrong-number? n)
  (= n (sum-of-powers n (get-nb-of-digits n))))
  
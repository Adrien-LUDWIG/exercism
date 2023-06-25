#lang racket

(provide classify)

(require math/number-theory)

; aliquot sum does not include the number itself as a divisor
(define (aliquot-divisors n)
  (drop-right (divisors n) 1))

(define (classify number)
  (define aliquot-sum (apply + (aliquot-divisors number)))
  (cond
    [(< aliquot-sum number) 'deficient]
    [(> aliquot-sum number) 'abundant]
    [else 'perfect]))

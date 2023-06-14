#lang racket

(provide armstrong-number?)

(define (get-nb-of-digits n)
  (cond
    [(zero? n) 0]
    [else (add1 (get-nb-of-digits (quotient n 10)))]))

; `sum-of-powers` returns the sum of digits the digits of `n`,
; each to the power of `nb-of-digits`.
(define (sum-of-powers n nb-of-digits)
  (cond
    [(zero? n) 0]
    [else (+ (expt (modulo n 10) nb-of-digits)
             (sum-of-powers (quotient n 10) nb-of-digits))]))

(define (armstrong-number? n)
  (= n (sum-of-powers n (get-nb-of-digits n))))
  
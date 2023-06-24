#lang racket

(provide armstrong-number?)

(define (get-nb-of-digits n [count 0])
  (cond
    [(zero? n) count]
    [else (get-nb-of-digits (quotient n 10) (add1 count))]))

; `sum-of-powers` returns the sum of digits the digits of `n`,
; each to the power of `nb-of-digits`.
(define (sum-of-powers n nb-of-digits [total 0])
  (cond
    [(zero? n) total]
    [else (sum-of-powers (quotient n 10)
                         nb-of-digits
                         (+ total (expt (modulo n 10) nb-of-digits)))]))

(define (armstrong-number? n)
  (= n (sum-of-powers n (get-nb-of-digits n))))
  
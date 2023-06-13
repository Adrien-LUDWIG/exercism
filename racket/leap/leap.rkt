#lang racket

(require math/number-theory)

(provide leap-year?)

(define (leap-year? year)
  (cond
    [(divides? 400 year)]
    [(divides? 100 year) #f]
    [(divides? 4 year)]
    [else #f]))

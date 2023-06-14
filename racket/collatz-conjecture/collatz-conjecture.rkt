#lang racket

(provide collatz)

(define (collatz num)
  (cond
    [(<= num 0) (error "The number should be a strictly positive integer, but got :" num)]
    [(= num 1) 0]
    [(even? num) (add1 (collatz (/ num 2)))]
    [(odd? num) (add1 (collatz (add1 (* num 3))))]))

#lang racket

(provide square total)

; `square` returns the number of grains on the `a-square`th square.
(define (square a-square)
  (expt 2 (sub1 a-square)))

; `sum-square-grains` returns the total number of grains on the chessboard.
(define (sum-square-grains grains remaining-squares)
  (cond
    [(zero? remaining-squares) 0]
    [else (+ grains (sum-square-grains (* grains 2) (sub1 remaining-squares)))]))

; `total` return the total number of grains on the chessboard.
(define (total)
 (sum-square-grains 1 64))

#lang racket

(provide score)

; `score` returns the dart throw score given the dart's coordinates (x, y).
(define (score x y)
  (let ([distance (sqrt (+ (* x x) (* y y)))])
    (cond
      [(<= distance 1) 10]
      [(<= distance 5) 5]
      [(<= distance 10) 1]
      [else 0])))

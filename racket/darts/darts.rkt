#lang racket

(provide score)

; `score` returns the dart throw score given the dart's coordinates (x, y).
(define (score x y)
  (let* ([distance (sqrt (+ (* x x) (* y y)))]
        [in (lambda (r) (<= distance r))])
    (cond
      [(in 1) 10]
      [(in 5) 5]
      [(in 10) 1]
      [else 0])))

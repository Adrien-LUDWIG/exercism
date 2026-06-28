#lang racket

(provide balanced?)

(define (balanced? str)
  (define (rec characters [round_count 0] [square_count 0] [curly_count 0])
  (cond
    [(not (and (<= 0 round_count) (<= 0 square_count) (<= 0 curly_count))) false]
    [(empty? characters) (= 0 round_count square_count curly_count)]
    [else
     (cond 
       [(equal? (car characters) #\() (rec (cdr characters) (add1 round_count) square_count curly_count)]
       [(equal? (car characters) #\)) (rec (cdr characters) (sub1 round_count) square_count curly_count)]
       [(equal? (car characters) #\[) (rec (cdr characters) round_count (add1 square_count) curly_count)]
       [(equal? (car characters) #\]) (rec (cdr characters) round_count (sub1 square_count) curly_count)]
       [(equal? (car characters) #\{) (rec (cdr characters) round_count square_count (add1 curly_count))]
       [(equal? (car characters) #\}) (rec (cdr characters) round_count square_count (sub1 curly_count))]
       [else (rec (cdr characters) round_count square_count curly_count)])]))
  (rec (string->list str))
  )


(balanced? "(42)" )
#lang racket/base

(require racket/set)
(require racket/file)
(require lens/common)
(require lens/data/struct)
(provide (all-defined-out))

(define left-char #\<)
(define right-char #\>)
(define down-char #\v)
(define up-char #\^)

(struct/lens point (x y) #:transparent)

(define (move char pos)
  (cond
    ((eqv? left-char char)
     (lens-transform point-x-lens pos (λ (x) (- x 1))))
    ((eqv? right-char char)
     (lens-transform point-x-lens pos (λ (x) (+ x 1))))
    ((eqv? down-char char)
     (lens-transform point-y-lens pos (λ (y) (- y 1))))
    ((eqv? up-char char)
     (lens-transform point-y-lens pos (λ (y) (+ y 1))))
    (#t pos)))

(define (part-1 str)
  (define chars (string->list str))
  (struct acc (position houses) #:transparent)
  (define (f a b)
    (define pos (move a (acc-position b)))
    (acc pos (set-add (acc-houses b) pos)))
  (define result (foldl f (acc (point 0 0) (set (point 0 0))) chars))
  (set-count (acc-houses result)))

(define (part-2 str)
  (define chars (string->list str))
  (struct acc (positions houses) #:transparent)
  (define (f a b)
    (define pos (move a (car (acc-positions b))))
    (acc
     (append (cdr (acc-positions b)) (list pos))
     (set-add (acc-houses b) pos)))
  (define result
    (foldl
     f
     (acc
      (list (point 0 0) (point 0 0))
      (set (point 0 0)))
     chars))
  (set-count (acc-houses result)))

(define input (file->string "input.txt"))

(list
  (part-1 input)
  (part-2 input)
)

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

(define (part-1 str)
  (define chars (string->list str))
  (struct acc (position houses))
  (define (f a b)
    (define new-pos
      (cond
        ((eqv? left-char a)
         (lens-transform point-x-lens (acc-position b) (λ (x) (- x 1))))
        ((eqv? right-char a)
         (lens-transform point-x-lens (acc-position b) (λ (x) (+ x 1))))
        ((eqv? down-char a)
         (lens-transform point-y-lens (acc-position b) (λ (y) (- y 1))))
        ((eqv? up-char a)
         (lens-transform point-y-lens (acc-position b) (λ (y) (+ y 1))))
        (#t b)))
    (acc new-pos (set-add (acc-houses b) new-pos)))
  (define result (foldl f (acc (point 0 0) (set (point 0 0))) chars))
  (set-count (acc-houses result)))

(define (part-2 str)
  (part-1 str))

(define input (file->string "input.txt"))

(list
  (part-1 input)
  ;(part-2 input)
)

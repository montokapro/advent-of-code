#lang racket/base

(require racket/set)
(require racket/file)
(provide (all-defined-out))

(define left-char #\<)
(define right-char #\>)
(define down-char #\v)
(define up-char #\^)

(struct point (x y) #:transparent)

(define (part-1 str)
  (define chars (string->list str))
  (struct acc (position houses))
  (define (f a b)
    (define new-pos
      (cond
        ((eqv? left-char a) (point (- (point-x (acc-position b)) 1) (point-y (acc-position b))))
        ((eqv? right-char a) (point (+ (point-x (acc-position b)) 1) (point-y (acc-position b))))
        ((eqv? down-char a) (point (point-x (acc-position b)) (- (point-y (acc-position b)) 1)))
        ((eqv? up-char a) (point (point-x (acc-position b)) (+ (point-y (acc-position b)) 1)))
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

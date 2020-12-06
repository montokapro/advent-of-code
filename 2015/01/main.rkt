#lang racket/base

(require racket/file)
(provide (all-defined-out))

(define up-char #\()
(define down-char #\))

(define (part-1 str)
  (define (count-char c str) (length (regexp-match* (regexp (format "\\~a" c)) str)))
  (- (count-char up-char str) (count-char down-char str)))

(define (part-2 str)
  (define chars (string->list str))
  (struct acc (index height))
  (define (f a b)
    (if (< (acc-height b) 0)
        b
        (acc
         (+ (acc-index b) 1)
         (cond
           ((eqv? up-char a) (+ (acc-height b) 1))
           ((eqv? down-char a) (- (acc-height b) 1))
           (#t a)))))
  (define result (foldl f (acc 0 0) chars))
  (acc-index result))

(define input (file->string "input.txt"))

(list
  (part-1 input)
  (part-2 input))

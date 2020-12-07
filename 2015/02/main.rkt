#lang racket

(require racket/file)
(require csv-reading)
(provide (all-defined-out))

(define (dimension str) '(1 1 1))

(define (sides dimensions)
  (list
   (* (list-ref dimensions 0) (list-ref dimensions 1))
   (* (list-ref dimensions 1) (list-ref dimensions 2))
   (* (list-ref dimensions 2) (list-ref dimensions 0))))

(define (smallest-side sides)
  (apply min sides))

(define (size dimensions)
  (define a (sides dimensions))
  (define b (smallest-side a))
  (+ b (* (foldr + 0 a) 2)))

(define (total dimensions-list)
  (foldr + 0 (map (λ (a) (size a)) dimensions-list)))

(define (smallest-perimeter dimensions)
  (* 2 (foldr + 0 (take (sort dimensions <) 2))))

(define (volume dimensions)
  (foldr * 1 dimensions))

(define (ribbon dimensions)
  (+ (smallest-perimeter dimensions) (volume dimensions)))

(define (ribbon-total dimensions-list)
  (foldr + 0 (map (λ (a) (ribbon a)) dimensions-list)))

(define make-dimensions-csv-reader
  (make-csv-reader-maker
   '((separator-chars #\x))))

(define dimensions-list
 (map
  (λ (a) (map string->number a))
  (csv->list (make-dimensions-csv-reader (open-input-file "input.txt")))))

(list
 (total dimensions-list)
 (ribbon-total dimensions-list))

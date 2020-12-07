#lang racket

(require rackunit "main.rkt")

(test-case "sides - unofficial"
  (check-equal? (sides '(1 1 1)) '(1 1 1)))

(test-case "sides - official"
  (check-equal? (sides '(2 3 4)) '(6 12 8))
  (check-equal? (sides '(1 1 10)) '(1 10 10)))

(test-case "smallest side - unofficial"
  (check-equal? (smallest-side '(1 1 1)) 1))

(test-case "smallest side - official"
  (check-equal? (smallest-side '(6 12 8)) 6)
  (check-equal? (smallest-side '(1 10 10)) 1))

(test-case "size - unofficial"
  (check-equal? (size '(1 1 1)) 7))

(test-case "size - official"
  (check-equal? (size '(2 3 4)) 58)
  (check-equal? (size '(1 1 10)) 43))

(test-case "total - unofficial"
  (check-equal?
   (total '((1 1 1) (2 3 4) (1 1 10)))
   108))

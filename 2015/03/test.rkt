#lang racket/base

(require rackunit "main.rkt")

(test-case "part 1 - unofficial"
  (check-equal? (part-1 "") 1)
  (check-equal? (part-1 "^") 2))

(test-case "part 1 - official"
  (check-equal? (part-1 ">") 2)
  (check-equal? (part-1 "^>v<") 4)
  (check-equal? (part-1 "^v^v^v^v^v") 2))

;; (test-case "part 2 - official"
;;   (check-equal? (part-2 ">") 3)
;;   (check-equal? (part-2 "^>v<") 3)
;;   (check-equal? (part-2 "^v^v^v^v^v") 11))

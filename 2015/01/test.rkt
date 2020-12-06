#lang racket

(require rackunit "main.rkt")

(test-case "part 1 - unofficial"
  (check-equal? (part-1 "(") 1)
  (check-equal? (part-1 ")") -1)
  (check-equal? (part-1 ")(") 0))

(test-case "part 1 - official"
  (check-equal? (part-1 "(())") 0)
  (check-equal? (part-1 "()()") 0)
  (check-equal? (part-1 "(((") 3)
  (check-equal? (part-1 "(()(()(") 3)
  (check-equal? (part-1 "))(((((") 3)
  (check-equal? (part-1 "())") -1)
  (check-equal? (part-1 "))(") -1)
  (check-equal? (part-1 ")))") -3)
  (check-equal? (part-1 ")())())") -3))

(test-case "part 2 - unofficial"
  (check-equal? (part-2 "(") 1)
  (check-equal? (part-2 "))") 1)
  (check-equal? (part-2 ")(") 1)
  (check-equal? (part-2 "()") 2)
  (check-equal? (part-2 "()))") 3))

(test-case "part 2 - official"
  (check-equal? (part-2 ")") 1)
  (check-equal? (part-2 "()())") 5))

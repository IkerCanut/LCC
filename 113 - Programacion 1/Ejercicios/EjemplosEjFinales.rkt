(define (shortest l) (if (empty? (rest l) )
                         (first l)
                         (if (< (string-length (first l)) (string-length (first (rest l))))
                             (shortest (cons (first l) (rest (rest l))))
                             (shortest (rest l)))))

(define (longest l) (if (empty? (rest l) )
                         (first l)
                         (if (> (string-length (first l)) (string-length (first (rest l))))
                             (longest (cons (first l) (rest (rest l))))
                             (longest (rest l)))))

(check-expect (shortest-longest (list "a" "acb" "b" "xf" "asdf" "xf")) (make-posn "b" "asdf"))

(define (shortest-longest l) (make-posn (shortest l) (longest l)))

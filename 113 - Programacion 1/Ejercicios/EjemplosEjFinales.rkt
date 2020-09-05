;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname EjemplosEjFinales) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 23 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define ANCHO 300)
(define ALTO 300)
(define (dibujarelipsen n) (rotate (* 2 n) (ellipse (* 10 n) (* 5 n) "outline" "blue")))
(define (dibujar-elipses n) (cond [(zero? n) (empty-scene ANCHO ALTO "white")]
                                  [(positive? n) (place-image (dibujarelipsen n) (/ ANCHO 2) (/ ALTO 2) (dibujar-elipses (sub1 n)))]))

(dibujar-elipses 30)
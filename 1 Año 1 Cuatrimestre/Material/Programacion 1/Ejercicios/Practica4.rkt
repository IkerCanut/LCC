;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Practica4) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 1 ;;;;;;;;;;;;;;;;;;;;;;;;

(define p (make-posn 3 4))
(define q (make-posn -2 0.5))


; (posn-x p)
#|
== definicion de p
(posn-x (make-posn 3 4))
== (ley 1)
3
|#
(check-expect (posn-x p) 3)

; (- (posn-y p) (posn-y q))
#|
(- (posn-y p) (posn-y q))
== definicion de p
(- (posn-y (make-posn 3 4)) (posn-y q))
== (ley 2)
(- 4 (posn-y q))
== definicion de q
(- 4 (posn-y (make-posn -2 0.5)))
== (ley 2)
(- 4 0.5)
== (-)
3.5
|#
(check-expect (- (posn-y p) (posn-y q)) 3.5)

; (posn-y (make-posn (posn-x p) (posn-x q)))
#|
== definicion p
(posn-y (make-posn (posn-x (make-posn 3 4)) (posn-x q)))
== (ley 1)
(posn-y (make-posn 3 (posn-x q)))
== definicion q
(posn-y (make-posn 3 (posn-x (make-posn -2 0.5))))
== (ley 1)
(posn-y (make-posn 3 -2))
== (ley 2)
-2
|#
(check-expect (posn-y (make-posn (posn-x p) (posn-x q))) -2)

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 2 ;;;;;;;;;;;;;;;;;;;;;;;;

; Dado un punto, representado con una estructura posn,
; calcula la distancia al origen de dicho punto.
; dist-origen : posn -> Number
(check-expect (dist-origen (make-posn 0 0)) 0)
(check-expect (dist-origen (make-posn 2 0)) 2)
(check-expect (dist-origen (make-posn 0 2)) 2)
(check-expect (dist-origen (make-posn 3 4)) 5)
(define (dist-origen p)
  (sqrt (+ (expt (posn-x p) 2) (expt (posn-y p) 2))))

(check-expect (dist-origen (make-posn (/ 6 2) 4)) 5)
(check-expect (+ (dist-origen (make-posn 12 5)) 4) 17)

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 3 ;;;;;;;;;;;;;;;;;;;;;;;;

; Dado un punto, representado con una estructura posn,
; nos devuelva su simétrico respecto del origen.
; simetrico : posn -> posn
(check-expect (simetrico (make-posn 0 0)) (make-posn 0 0))
(check-expect (simetrico (make-posn 2 2)) (make-posn -2 -2))
(define (simetrico p)
  (make-posn (- (posn-x p)) (- (posn-y p))))

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 4 ;;;;;;;;;;;;;;;;;;;;;;;;

; Dados dos puntos, representados con estructuras posn,
; nos devuelve la distancia entre si.
; distancia : posn posn -> Number
(check-expect (distancia (make-posn 2 2) (make-posn 2 2)) 0)
(check-expect (distancia (make-posn 4 5) (make-posn 1 1)) 5)
(define (distancia p q)
  (sqrt (+ (expt (- (posn-x q) (posn-x p)) 2)
           (expt (- (posn-y q) (posn-y p)) 2))))

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 5 ;;;;;;;;;;;;;;;;;;;;;;;;

; Y si terminas la practica 3?

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 6 ;;;;;;;;;;;;;;;;;;;;;;;;

(define ANCHO 200)
(define ALTO 200)

(define (dibujar-mosca p)
  (place-image (circle 2 "solid" "blue") (posn-x p) (posn-y p)
               (empty-scene ANCHO ALTO "white")))
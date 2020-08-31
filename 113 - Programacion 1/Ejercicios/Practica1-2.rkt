;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Practica1-2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 1

(define (sgn2 x)
  (cond [(< x 0) -1] 
        [(= x 0) 0]
        [(> x 0) 1]))

; (sgn2 (- 2 3))
; == ley -
; (sgn2 -1)
; == definicion cond, reemplazando x por -1
; (cond [(< -1 0) -1] 
;       [(= -1 0) 0]
;       [(> -1 0) 1]))
; == (< -1 0) evalua a #true
; (cond [#true -1] 
;       [(= -1 0) 0]
;       [(> -1 0) 1]))
; == definicion de cond, ley 1
; -1
(check-expect (sgn2 (- 2 3)) -1)

; (sgn2 6)
; == definicion cond, reemplazando x por 6
; (cond [(< 6 0) -1] 
;       [(= 6 0) 0]
;       [(> 6 0) 1]))
; == (< 6 0) evalua a #false
; (cond [#false -1] 
;       [(= 6 0) 0]
;       [(> 6 0) 1]))
; == definición de cond, ley 2
; (cond [(= 6 0) 0]
;       [(> 6 0) 1]))
; == (= 6 0) evalua a #false
; (cond [#false 0]
;       [(> 6 0) 1]))
; == definicion de cond, ley 2
; (cond [(> 6 0) 1]))
; == (> 6 0) evalua a #true
; (cond [#true 1]))s
; == definicion de cond, ley 1
; 1
(check-expect (sgn2 6) 1)

(check-expect (sgn2 0) 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 2

(define
  (g x)
  (cond [(> (image-height x) (image-width x)) "Flaca"]
        [(= (image-height x) (image-width x)) "Cuadrada"]
        [(< (image-height x) (image-width x)) "Gorda"]))
(check-expect (g (empty-scene 50 100)) "Flaca")
(check-expect (g (empty-scene 50 50)) "Cuadrada")
(check-expect (g (empty-scene 100 50)) "Gorda")


(define (clasTriangulo2 x y z)
  (if (= (+ x y z) 180)
    (cond [(= x y z) "Equilatero"]
          [(or (= x y) (= x z) (= y z)) "Isoceles"]
          [#true "Escaleno"])
    "Error"))
(check-expect (clasTriangulo2 60 60 60) "Equilatero")
(check-expect (clasTriangulo2 45 45 90) "Isoceles")
(check-expect (clasTriangulo2 20 100 60) "Escaleno")
(check-expect (clasTriangulo2 50 50 50) "Error")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 4

(define
  (h x)
  (cond [(> (image-height x) (* (image-width x) 2)) "Muy flaca"]
        [(> (image-height x) (image-width x)) "Flaca"]
        [(= (image-height x) (image-width x)) "Cuadrada"]
        [(< (* (image-height x) 2) (image-width x)) "Muy gorda"]
        [(< (image-height x) (image-width x)) "Gorda"]))
(check-expect (h (empty-scene 20 100)) "Muy flaca")
(check-expect (h (empty-scene 50 100)) "Flaca")
(check-expect (h (empty-scene 50 50)) "Cuadrada")
(check-expect (h (empty-scene 100 50)) "Gorda")
(check-expect (h (empty-scene 100 20)) "Muy gorda")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 5
(define (clasificar t) (cond [(< t 0) "No Olvidar Bufanda (NOB)"]
                             [(< t 15) "Frío (F)"]
                             [(< t 25) "Agradable (A)"]
                             [#true "Realmente Caluroso (RC)"]))
(check-expect (clasificar -3) "No Olvidar Bufanda (NOB)")
(check-expect (clasificar 8) "Frío (F)")
(check-expect (clasificar 15) "Agradable (A)")
(check-expect (clasificar 28) "Realmente Caluroso (RC)")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 6, 7, 8, 9
(define (boolean->number b) (if b 1 0))
(define (sgn3 x) (cond [(number? x) (sgn2 x)]
                       [(string? x) (if (number? (string->number x)) (sgn (string->number x))
                                        "La cadena no se puede convertir a un número")]
                       [(boolean? x) (sgn2 (boolean->number x))]
                       [(image? x) (cond [(string=? (g x) "Flaca") -1]
                                         [(string=? (g x) "Cuadrada") 0]
                                         [(string=? (g x) "Gorda") 1])]
                       [#true "Clase no soportada por la función."]))
(check-expect (sgn3 -10) -1)
(check-expect (sgn3 #true) 1)
(check-expect (sgn3 #false) 0)
(check-expect (sgn3 "10") 1)
(check-expect (sgn3 "10a") "La cadena no se puede convertir a un número")
(check-expect (sgn3 (empty-scene 50 100)) -1)
(check-expect (sgn3 (empty-scene 50 50)) 0)
(check-expect (sgn3 (empty-scene 100 50)) 1)
(check-expect (sgn3 (make-posn 1 3)) "Clase no soportada por la función.")









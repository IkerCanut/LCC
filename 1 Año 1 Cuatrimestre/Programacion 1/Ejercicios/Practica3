;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Practica3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 1 ;;;;;;;;;;;;;;;;;;;;;;;;
; Estado es un string, que representa el color del círculo a
; dibujar en pantalla.
; Posibles valores: "blue", "red" y "green"

;interpretar: Estado -> Image
(define (interpretar s)
  (place-image (circle 10 "solid" s) 100 100
               (empty-scene 200 200)))

;manejarTeclado: Estado String -> Estado
(define (manejarTeclado s k)
  (cond[(key=? k "a") "blue"]
       [(key=? k "r") "red"]
       [(key=? k "v") "green"]
       [else s]))

(big-bang "blue"
  [to-draw interpretar]
  [on-key manejarTeclado])

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 2 ;;;;;;;;;;;;;;;;;;;;;;;;

;pantalla : Number -> Image
;transforma el estado del sistema en una imagen a mostrar
; a través de la cláusula to-draw
(define (pantalla n)
  (place-image (circle n "solid" "blue") 150 150
               (empty-scene 300 300)))

; decrementar : Number -> Number
; Devuelve el predecesor de un número positivo.
; Si el número es 0, devuelve 100.
(define(decrementar n)
  (if (= n 0) 100 (- n 1)))

(big-bang 100
  [to-draw pantalla]
  [on-tick decrementar])

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 3 ;;;;;;;;;;;;;;;;;;;;;;;;

; incrementar : Number -> Number
; suma uno a su argumento
(define (incrementar n)
  (if (> n 212) 0 (+ n 1)))

(define (dibujar n color)
  (place-image (circle n "solid" color) 150 150
               (empty-scene 300 300)))

(define (pantalla3 n)
  (cond[(<= n 50) (dibujar n "yellow")]
       [(<= n 100) (dibujar n "red")]
       [else (dibujar n "green")]))

(define (manejarTeclado3 s k)
  (if (number? (string->number k)) (* 10 (string->number k)) s))

(define (condicion3? s)
  (or (< s 10) (> s 110)))

(big-bang 40
  [to-draw pantalla3]
  [on-tick incrementar]
  [on-key manejarTeclado3]
  [stop-when condicion3?])

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 4 ;;;;;;;;;;;;;;;;;;;;;;;;









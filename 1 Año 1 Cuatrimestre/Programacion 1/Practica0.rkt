;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Practica0) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 1 (NUMBERS)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 12*5 - 7*6
(- (* 12 5) (* 7 6)) ; 18

; 3*5 - 7*4/14 + 3/1
(+(-(* 3 5) (/ (* 7 4) 14)) (/ 3 1)) ; 16

; cos(0.8) + 1/5 + sen(0.5)*3.5
(+ (cos 0.8) (/ 1 5) (* (sin 0.5) 3.5)) ; 2.574696094461876

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 12*5 - 7*6
; 60 - 42
; 18

; 3*5 - 7*4/14 + 3/1
; 15 - 2 + 3
; 16

; cos(0.8) + 1/5 + sen(0.5)*3.5
; 0.6967067093471654 + 0.2 + 0.479425538604203 * 3.5
; 2.574696094461876

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(/ 1 (sin (sqrt 3))) ; 1.0131438751684085
(* (sqrt 2) (sin pi)) ; 1.7319121124709868e-16
(+ 3 (sqrt(- 4))) ; 3+2i
(* (sqrt 5) (sqrt (/ 3 (cos pi)))) ; 0+3.872983346207417i
; (/ (sqrt 5) (sin (* 3 0))) ; error, division by zero
; (/ (+ 3) (* 2 4)) ; expects at least 2 arguments, but found only 1
(* 1 2 3 4 5 6 7 8) ; 40320
(/ 120 2 3 2 2 5) ; 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(log 10) ; 2.302585092994046 ; Es log_e
(log e) ; 1.0
(tan (/ pi 2)) ; 1.633123935319537e+16 ; esa precision
(expt 10 3) ; 1000
(random 10) ; [0,10)
(max 10 4 100) ; 100
(min 10 4 100) ; 4
(floor 10.4) ; 10
(ceiling 10.4) ; 11
(- (abs 5) (abs -5)) ; 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 1 (STRINGS)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(string-append "Hola" "mundo") ; "Holamundo"
(string-append "Pro" "gra" "ma.") ; "Programa."
(number->string 1357) ; "1357"
; (string-append "La respuesta es " (+ 21 21)) ; string-append: expects a string as 2nd argument, given 42
(string-append "La respuesta es " (number->string (+ 21 21))) ; "La respuesta es 42"
(* (string-length "Hola") (string-length "Chau")) ; 16

(string-ith "Hola mundo" 5) ; "m"
(substring "Hola mundo" 3 6)  ; "a m"
; (substring "Hola mundo" 6 3)  ; substring: ending index is smaller than starting index
(substring "Hola mundo" 3 3)  ; ""

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 1 (BOOLEANS)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(not #t) ; #false
(or #t #f) ; #true
(and #t #f) ; #false
(and #t (or #f (not #f)) (not #t)) ; #false
(not (= 2 (* 1 3))) ; #true
(or (= 2 (* 1 3)) (< 4 (+ 3 2))) ; #true

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(> (cos 0) 0) ; #true
(= (string-length "Hola, mundo") 14) ; #false
(and (> pi 3) (< pi 4)) ; #true
(= (expt 5 2) (sqrt 625)) ; #true

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 1 (IMAGES)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(circle 10 "solid" "red")
(rectangle 10 20 "solid" "blue")
(rectangle 10 12 "outline" "magenta")
(overlay (rectangle 20 20 "solid" "blue") (circle 15 "solid" "green"))
(empty-scene 50 50)
(place-image (circle 10 "solid" "blue") 40 80 (empty-scene 100 100))
(+ (image-width (circle 10 "solid" "red")) (image-height (rectangle 10 20 "solid" "blue")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INTRO (FUNCTIONS)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define P "Neptuno")
(define 1TRES 3)
(define CINCO (+ 1 (* 2 2)))
(define VERDADERO #true)
(define PUNTOROJO (circle 3 "solid" "red"))

(define (sucesor x) (+ x 1)) ; Sucesor de x
(define (doble x) (* x 2)) ; Doble de x
(define (menorDoble x y) (< x (* 2 y))) ; Menor que el doble de otro
(define (cuad-azul x) (square x "solid" "blue"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cuad-azul (doble 10))
(and (menorDoble 2 3) (menorDoble 3 4))
(= (sucesor 1) (doble 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (distanciaAlOrigen x y) (sqrt (+ (expt x 2) (expt y 2))))
(distanciaAlOrigen 1 1) ; sqrt(2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (distanciaPuntos x1 y1 x2 y2) (sqrt (+ (abs (- x1 x2)) (abs (- y1 y2)) )))
(distanciaPuntos 1 1 2 2) ; sqrt(2)
(distanciaPuntos 2 2 1 1) ; sqrt(2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (vol-cubo x) (* x x x))
(vol-cubo 5) ; 125

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (area-cubo x) (* 6 x x))
(area-cubo 5) ; 150

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (metro-pie x) (* x 3.28))
(metro-pie 2) ; 6.56

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cel-far x) (+ (* x 1.8) 32))
(cel-far 24) ; 75.2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (posible? a b c) (and (> (+ a b) c) (> (+ a c)  b) (> (+ b c) a)))
(posible? 1 2 5) ; #false
(posible? 3 4 5) ; #true
(posible? 5 5 5) ; #true

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 9
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (pitagorica a b c) (or
                            (= (+ (expt a 2) (expt b 2) ) (expt c 2) )
                            (= (+ (expt b 2) (expt c 2) ) (expt a 2) )
                            (= (+ (expt c 2) (expt a 2) ) (expt b 2) ) ))
(pitagorica 3 4 5) ; #true
(pitagorica 3 5 5) ; #false

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 0 (FINAL)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (suma-long a b) (+ (string-length a) (string-length b)))
(suma-long "Hola" "Mundo") ; 9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (comienzaA str) (string=? (string-ith str 0) "A"))
(comienzaA "Arbol") ; #true
(comienzaA "Pepe") ; #false


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (poner- str pos) (string-append (substring str 0 pos) "-" (substring str (+ pos 1) )) )
(poner- "Hola mundo" 4) ; "Hola-mundo"
(poner- "Hola mundo" 0) ; "-ola mundo"
(poner- "Hola mundo" 9) ; "Hola mund-"

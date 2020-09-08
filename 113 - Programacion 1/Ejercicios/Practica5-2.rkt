;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Practica5-2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 1 - 12 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

; par? : Number -> Boolean
(define (par? n) (= (modulo n 2) 0))

; pares : 
(check-expect (pares '()) '())
(check-expect (pares (list 4 6 3 7 5 0)) '(4 6 0))
(define (pares l) (filter par? l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 1 - 13 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (corta? s) (< (string-length s) 5))

(check-expect (cortas '( "Lista" "de" "palabras" "sin" "sentido")) (list "de" "sin"))
(define (cortas l) (filter corta? l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 1 - 15 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define MAX 5)
(define (cerca? p)  (< (sqrt (+ (expt (posn-x p) 2) (expt (posn-y p) 2))) MAX))

(check-expect (cerca (list (make-posn 3 5) (make-posn 1 2) (make-posn 0 1) (make-posn 5 6)))
              (list (make-posn 1 2) (make-posn 0 1)))
(define (cerca l) (filter cerca? l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 1 - 16 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (positivo? n) (> n 0))

(check-expect (positivos (list -5 37 -23 0 12)) (list 37 12))
(define (positivos l) (filter positivo? l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 2 - 18 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (raices (list 9 16 4)) '(3 4 2))
(define (raices l) (map sqrt l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 2 - 19 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (distancia p) (sqrt (+ (expt (posn-x p) 2) (expt (posn-y p) 2))))

(check-expect (distancias (list (make-posn 3 4) (make-posn 0 4) (make-posn 12 5))) (list 5 4 13))
(define (distancias l) (map distancia l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 2 - 20 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (anchos (list (circle 30 "solid" "red") (rectangle 10 30 "outline" "blue"))) (list 60 10))
(define (anchos l) (map image-width l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 2 - 21 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (signos '(1 -1 2 -2 0)) '(1 -1 1 -1 0))
(define (signos l) (map sgn l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 2 - 22 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (cuadrados (list 1 2 3)) (list 1 4 9))
(define (cuadrados l) (map (lambda (x) (expt x 2)) l))
; o bien
(check-expect (cuadrados2 (list 1 2 3)) (list 1 4 9))
(define (cuadrados2 l) (map sqr l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 2 - 23 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (longitudes(list "hola" "cómo" "estás?")) (list 4 4 6))
(define (longitudes l) (map string-length l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 2 - 24 ;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 3 - 9 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (fand p q) (and p q))
(check-expect (todos-verdaderos '(#true #true #true #true)) #true)
(check-expect (todos-verdaderos '()) #true)
(check-expect (todos-verdaderos '(#true #true #true #false)) #false)
(check-expect (todos-verdaderos '(#false #false)) #false)
(define (todos-verdaderos l) (foldr fand #true l))

(define (for p q) (or p q))
(check-expect (uno-verdadero '(#true #true #true #true)) #true)
(check-expect (uno-verdadero '()) #false)
(check-expect (uno-verdadero '(#false #false #true)) #true)
(check-expect (uno-verdadero '(#false #false)) #false)
(define (uno-verdadero l) (foldr for #false l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 3 - 10 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (todo-a-uno x) 1)

(check-expect (cant-elementos '()) 0)
(check-expect (cant-elementos '("Hola" "Andas" "Como")) 3)
(define (cant-elementos l) (foldr + 0 (map todo-a-uno l)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 3 - 25 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (prod '(1 2 3 4 5)) 120)
(define (prod l) (foldr * 1 l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 3 - 26 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (pegar (list "Las " "lis" "tas " "son " "complicadas" "."))
 "Las listas son complicadas.")
(define (pegar l) (foldr string-append "" l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 3 - 27 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (maximo (list 23 543 325 0 75)) 543)
(define (maximo l) (foldr max 0 l))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 4 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define CIRCULOS (list (circle 10 "solid" "blue")
(circle 20 "solid" "yellow")
(circle 30 "solid" "blue")
(circle 40 "solid" "yellow")
(circle 50 "solid" "blue")
(circle 60 "solid" "yellow")))
(define FONDO (empty-scene 200 200))

(foldr overlay FONDO CIRCULOS)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 5 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; cuadr : ListN -> ListN
; calcula los cuadrados de todos los elementos de una lista de números
(check-expect (cuadr (list 1 2 3 4 5)) (list 1 4 9 16 25))
(check-expect (cuadr empty) empty)
(check-expect (cuadr (list 11 13 9)) (list 121 169 81))
(define (cuadr l) (map sqr l))

; suma : ListN -> Number
; suma todos los elementos de una lista de números
(check-expect (suma (list 1 2 3 4 5)) 15)
(check-expect (suma empty) 0)
(check-expect (suma (list 11 13 9)) 33)
(define (suma l) (foldr + 0 l))

; sumcuad : ListN -> Number
; suma los cuadrados de una lista de números
(check-expect (sumcuad (list 1 2 3 4 5)) 55)
(check-expect (sumcuad empty) 0)
(check-expect (sumcuad (list 11 13 9)) 371)
(define (sumcuad l) (suma (cuadr l)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 6 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (distanc p) (sqrt (+ (sqr (posn-x p)) (sqr (posn-y p)))))

(check-expect (sumdist (list (make-posn 3 4) (make-posn 0 3))) 8)
(define (sumdist l) (suma (map distanc l)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 7 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (multPos (list 3 -2 4 0 1 -5)) 12)
(define (multPos l) (foldr * 1 (filter positive? l)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 8 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (sumAbs (list 3 -2 4 0 1 -5)) 15)
(define (sumAbs l) (foldr + 0 (map abs l)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 9 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (no-negativo? x) (not (negative? x)))

(check-expect (raices9 (list 16 -4 9 0)) (list 4 3 0))
(define (raices9 l) (map sqrt (filter no-negativo? l)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 10 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 11 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; suma-lista-positivo : List(Number) -> Boolean
(define (suma-lista-positivo l) (positive? (suma l)))

(check-expect (algun-pos (list (list 1 3 -4 -2) (list 1 2 3 -5) (list 4 -9 -7 8 -3))) #true)
(check-expect (algun-pos (list empty (list 1 2 3))) #true)
(check-expect (algun-pos (list (list -1 2 -3 4 -5) empty (list -3 -4))) #false)
(define (algun-pos ll) (ormap identity (map suma-lista-positivo ll)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 12 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (lista-larga? l) (> (length l) 4))

(check-expect (long-lists (list (list 1 2 3 4 5) (list 1 2 3 4 5 6) (list 87 73 78 83 33))) #true)
(check-expect (long-lists (list '() '() (list 1 2 3))) #false)
(check-expect (long-lists (list (list 1 2 3 4 5) empty)) #false)

(define (long-lists ll) (andmap identity (map lista-larga? ll)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 13 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (todos-true (list 5 #true "abc" #true "def")) #true)
(check-expect (todos-true (list 1 #true (circle 10 "solid" "red") -12 #false)) #false)

(define (todos-true l) (andmap identity (filter boolean? l)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 14 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct alumno [nombre nota faltas])
; alumno (String, Number, Natural). Interpretación
; - nombre representa el nombre del alumno.
; - nota representa la calificación obtenida por el alumno (entre 0 y 10).
; - faltas: número de clases a las el alumno no asistió.

(define (promedio-alto? a) (>= (alumno-nota a) 9))
(define (mostrar-nombre a) (alumno-nombre a))

(check-expect (destacados (list (make-alumno "Ada Lovelace" 10 20)
                                (make-alumno "Carlos Software" 3.5 12)))
              (list "Ada Lovelace"))
(define (destacados l) (map mostrar-nombre (filter promedio-alto? l)))

(define (condicion a) (cond [(>= (alumno-nota a) 8) "promovido"]
                            [(>= (alumno-nota a) 6) "regular"]
                            [else "libre"]))

(check-expect (exito (list (make-alumno "Juan Computación" 5 13)
                           (make-alumno "Carlos Software" 3.5 12)
                           (make-alumno "Ada Lovelace" 10 20)))
              #false)
(check-expect (exito (list (make-alumno "Juan Computación" 7 13)
                           (make-alumno "Ada Lovelace" 10 20)))
              #true)

(define (no-libre condicion) (not (string=? condicion "libre")))

(define (exito l) (andmap no-libre (map condicion l)))

(define (faltas-si-regular a) (if (string=? (condicion a) "regular") (alumno-faltas a) 0))

(check-expect (faltas-regulares (list (make-alumno "Juan Computación" 7 2)
                                      (make-alumno "Carlos Software" 3.5 4)
                                      (make-alumno "Ada Lovelace" 10 1)))
              2)
(define (faltas-regulares l) (foldr + 0 (map faltas-si-regular l)))

(check-expect (promovidos-ausentes (list (make-alumno "Juan Computación" 9 3)
                                         (make-alumno "Carlos Software" 3.5 2)
                                         (make-alumno "Ada Lovelace" 10 1)))
              (list "Juan Computación"))

(define (promovido-ausente? a) (and (string=? (condicion a) "promovido")
                                    (>= (alumno-faltas a) 3)))

(define (promovidos-ausentes l) (map mostrar-nombre (filter promovido-ausente? l)))
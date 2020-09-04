;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Practica5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cons "Kepa" (cons "Ander" (cons "Maite" (cons "Amaia" (cons "Iker" '())))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cons 2 '())
; No es una lista de Contactos porque no cumple con la definicion.
; Especificamente, no es un string.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Lista-de-booleanos es:
;    - Una lista vacia
;    - Una expresion del tipo (cons valor-booleano Lista-de-booleanos)
; Es decir, es una lista vacia o una lista-de-booleanos encabezada por
; el valor booleano valor-booleano.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 4 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; contiene-Marcos? : Contactos -> Booleano
; dada una lista de Contactos, determina si "Marcos" es un elemento de la misma
(check-expect (contiene-Marcos? '()) #false)
(check-expect (contiene-Marcos? (cons "Sara" (cons "Pedro"  (cons "Esteban" '())))) #false)
(check-expect (contiene-Marcos? (cons "A" (cons "Marcos" (cons "C" '())))) #true)
(check-expect (contiene-Marcos? (cons "Juan" '())) #false)
(check-expect (contiene-Marcos? (cons "Marcos" '())) #true)
(define (contiene-Marcos? l) (cond [(empty? l) #false]
                                   [(cons? l) (if (string=? (first l) "Marcos")
                                                  #true (contiene-Marcos? (rest l)))]))

(check-expect (contiene-Marcos? (cons "Eugenia"
  (cons "Lucía"
    (cons "Dante"
      (cons "Federico"
        (cons "Marcos"
          (cons "Gabina"
            (cons "Laura"
              (cons "Pamela" '()))))))))) #t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 5 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (contiene? "Marcos" (cons "Juan" '())) #false)
(check-expect (contiene? "Marcos" (cons "Eugenia"
  (cons "Lucía"
    (cons "Dante"
      (cons "Federico"
        (cons "Marcos"
          (cons "Gabina"
            (cons "Laura"
              (cons "Pamela" '()))))))))) #t)
(define (contiene? x l) (cond [(empty? l) #f]
                              [(cons? l) (if (string=? (first l) x) #t
                                             (contiene? x (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 6 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(contiene-Marcos? (cons "Marcos" (cons "C" '())))
; (cond [(empty? (cons "Marcos" (cons "C" '()))) #false]
;       [(cons? (cons "Marcos" (cons "C" '()))) (if (string=? (first (cons "Marcos" (cons "C" '()))) "Marcos") #true (contiene-Marcos? (rest (cons "Marcos" (cons "C" '())))))])
; (cond [#false #false]
;       [(cons? (cons "Marcos" (cons "C" '()))) (if (string=? (first (cons "Marcos" (cons "C" '()))) "Marcos") #true (contiene-Marcos? (rest (cons "Marcos" (cons "C" '())))))])
; (cond [(cons? (cons "Marcos" (cons "C" '()))) (if (string=? (first (cons "Marcos" (cons "C" '()))) "Marcos") #true (contiene-Marcos? (rest (cons "Marcos" (cons "C" '())))))])
; (cond [#true (if (string=? (first (cons "Marcos" (cons "C" '()))) "Marcos") #true (contiene-Marcos? (rest (cons "Marcos" (cons "C" '())))))])
; (if (string=? (first (cons "Marcos" (cons "C" '()))) "Marcos") #true (contiene-Marcos? (rest (cons "Marcos" (cons "C" '())))))
; (if (string=? "Marcos" "Marcos") #true (contiene-Marcos? (rest (cons "Marcos" (cons "C" '())))))
; (if #true #true (contiene-Marcos? (rest (cons "Marcos" (cons "C" '())))))
; #true

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 7 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 8 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 9 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(check-expect (todos-verdaderos '(#true #true #true #true)) #true)
(check-expect (todos-verdaderos '()) #true)
(check-expect (todos-verdaderos '(#true #true #true #false)) #false)
(check-expect (todos-verdaderos '(#false #false)) #false)
(define (todos-verdaderos l) (cond [(empty? l) #true]
                                   [(cons? l) (if (first l) (todos-verdaderos (rest l)) #false)]))
(check-expect (uno-verdadero '(#true #true #true #true)) #true)
(check-expect (uno-verdadero '()) #false)
(check-expect (uno-verdadero '(#false #false #true)) #true)
(check-expect (uno-verdadero '(#false #false)) #false)
(define (uno-verdadero l) (cond [(empty? l) #false]
                                [(cons? l) (if (first l) #true (uno-verdadero (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 10 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (cant-elementos '()) 0)
(check-expect (cant-elementos '(1 2 3)) 3)
(define (cant-elementos l) (cond [(empty? l) 0]
                                 [(cons? l) (+ 1 (cant-elementos (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 11 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (suma '()) 0)
(check-expect (suma '(1 2 3)) 6)
(define (suma l) (cond [(empty? l) 0]
                       [(cons? l) (+ (first l) (suma (rest l)))]))

(check-expect (promedio '(2)) 2)
(check-expect (promedio '(5 6 7)) 6)
(define (promedio l) (/ (suma l) (cant-elementos l)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 12 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (pares '()) '())
(check-expect (pares (list 4 6 3 7 5 0)) '(4 6 0))

(define (pares l) (cond [(empty? l) '()]
                        [(cons? l) (if (= (modulo (first l) 2) 0)
                                       (cons (first l) (pares (rest l)))
                                       (pares (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 13 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (cortas '( "Lista" "de" "palabras" "sin" "sentido")) (list "de" "sin"))
(define (cortas l) (cond [(empty? l) '()]
                         [(cons? l) (if (< (string-length (first l)) 5)
                                        (cons (first l) (cortas (rest l)))
                                        (cortas (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 14 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (mayores '( "Lista" "de" "palabras" "sin" "sentido") 5) (list "palabras" "sentido"))
(define (mayores l n) (cond [(empty? l) '()]
                            [(cons? l) (if (> (string-length (first l)) n)
                                           (cons (first l) (mayores (rest l) n))
                                           (mayores (rest l) n))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 15 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect
 (cerca (list (make-posn 3 5) (make-posn 1 2) (make-posn 0 1) (make-posn 5 6)))
 (list (make-posn 1 2) (make-posn 0 1)))
(define MAX 5)
(define (cerca l) (cond [(empty? l) '()]
                        [(cons? l) (if (< (sqrt (+ (expt (posn-x (first l)) 2) (expt (posn-y (first l)) 2))) MAX)
                                       (cons (first l) (cerca (rest l)))
                                       (cerca (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 16 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (positivos (list -5 37 -23 0 12)) (list 37 12))
(define (positivos l) (cond [(empty? l) '()]
                            [(cons? l) (if (> (first l) 0)
                                           (cons (first l) (positivos (rest l)))
                                           (positivos (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 17 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (eliminar (list 1 2 3 2 7 6) 2) (list 1 3 7 6))
(check-expect (eliminar (list 1 2 3 2 7 6) 0) (list 1 2 3 2 7 6))
(define (eliminar l n) (cond [(empty? l) '()]
                             [(cons? l) (if (= (first l) n)
                                            (eliminar (rest l) n)
                                            (cons (first l) (eliminar (rest l) n)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 18 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (raices (list 9 16 4)) '(3 4 2))
(define (raices l) (cond [(empty? l) '()]
                         [(cons? l) (cons (sqrt (first l)) (raices (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 19 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (distancias (list (make-posn 3 4) (make-posn 0 4) (make-posn 12 5))) (list 5 4 13))
(define (distancias l) (cond [(empty? l) '()]
                             [(cons? l) (cons
                                          (sqrt (+ (expt (posn-x (first l)) 2) (expt (posn-y (first l)) 2)))
                                          (distancias (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 20 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (anchos (list (circle 30 "solid" "red") (rectangle 10 30 "outline" "blue"))) (list 60 10))
(define (anchos l) (cond [(empty? l) '()]
                         [(cons? l) (cons
                                     (image-width (first l))
                                     (anchos (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 21 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 22 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 23 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 24 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 25 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (prod '(1 2 3 4 5)) 120)
(define (prod l) (cond [(empty? l) 1]
                       [(cons? l) (* (first l) (prod (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 26 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (pegar (list "Las " "lis" "tas " "son " "complicadas" "."))
 "Las listas son complicadas.")
(define (pegar l) (cond [(empty? l) ""]
                        [(cons? l) (string-append (first l) (pegar (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 27 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (maximo (list 23 543 325 0 75)) 543)
(define (maximo l) (cond [(empty? l) 0]
                         [(empty? (rest l)) (first l)]
                         [(cons? l) (max (first l) (maximo (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 28 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (sumdist (list (make-posn 3 4) (make-posn 0 4) (make-posn 12 5))) 22)
(define (sumdist l) (cond [(empty? l) 0]
                          [(cons? l) (+
                                      (sqrt (+ (expt (posn-x (first l)) 2) (expt (posn-y (first l)) 2)))
                                      (sumdist (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 29 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (sumcuad (list 1 2 3)) 14)
(define (sumcuad l) (cond [(empty? l) 0]
                          [(cons? l) (+
                                      (expt (first l) 2)
                                      (sumcuad (rest l)))]))



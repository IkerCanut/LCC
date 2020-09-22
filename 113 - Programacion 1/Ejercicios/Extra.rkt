;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Extra) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Dados dos predicados 'p' y 'q' y una lista 'l', la funcion 'filter-and' se
; queda con aquellos elementos que cumplas con ambos requisitos.
; filter-and : (X -> Boolean) (X->Boolean) List(X) -> List(X)
(check-expect (filter-and-filter even? integer? (list 1 2 3 4 4.2)) (list 2 4))
(check-expect (filter-and-a-mano even? integer? (list 1 2 3 4 4.2)) (list 2 4))
(check-expect (filter-and-filter even? odd? (list 1 2 3 4 5)) empty)
(check-expect (filter-and-a-mano even? odd? (list 1 2 3 4 5)) empty)
(check-expect (filter-and-filter (lambda (x) (>= x 5)) odd? (list 3 4 5 6 7)) (list 5 7))
(check-expect (filter-and-a-mano (lambda (x) (>= x 5)) odd? (list 3 4 5 6 7)) (list 5 7))

(define (filter-and-filter p q l) (filter p (filter q l)))

(define (filter-and-a-mano p q l) (cond [(empty? l) empty]
                                        [(and (q (first l)) (p (first l))) (cons (first l) (filter-and-a-mano p q (rest l)))]
                                        [else (filter-and-a-mano p q (rest l))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Dado el struct Par(primero, segundo) donde primero es una llave y segundo un valor
(define-struct Par [primero segundo])

; Hacer una función recolectar-llaves que dada una lista de pares de números
; retorne una lista de pares, donde a cada llave le corresponde una lista con
; todos los valores asociados en la lista original

; remove-dups : List(x) -> List(x)
; Dada una lista, devuelve una lista sin elementos duplicados,
; priorizando elementos a la derecha, conservando orden relativo.
(check-expect (remove-dups (list 1 2 3 1 2)) (list 3 1 2))
(check-expect (remove-dups empty) empty)
(define (remove-dups l) (cond [(empty? l) empty]
                              [(empty? (rest l)) l]
                              [else (if (member (first l) (rest l))
                                        (remove-dups (rest l))
                                        (cons (first l) (remove-dups (rest l))))]))

; claves-unicas : List(Par) -> List(Number)
(check-expect (claves-unicas (list (make-Par 1 2) (make-Par 1 3) (make-Par 2 4))) (list 1 2))
(define (claves-unicas l) (remove-dups (map Par-primero l)))

; juntar-valores-de-llave Number List(Par) -> List(Number)
(check-expect (juntar-valores-de-llave 1 (list (make-Par 1 2) (make-Par 1 3) (make-Par 2 4))) (list 2 3))
(define (juntar-valores-de-llave x l) (cond [(empty? l) '()]
                                            [(= (Par-primero (first l)) x) (cons (Par-segundo (first l)) (juntar-valores-de-llave x (rest l)))]
                                            [else (juntar-valores-de-llave x (rest l))]))

; recolectar-llaves : List(Par) -> List(Par)
(check-expect (recolectar-llaves (list (make-Par 1 2) (make-Par 1 3) (make-Par 2 4))) (list (make-Par 1 (list 2 3)) (make-Par 2 (list 4))))
(define (recolectar-llaves l) (map (lambda (x) (make-Par x (juntar-valores-de-llave x l))) (claves-unicas l)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; descomponer : Number -> List(Number)
; Dado un numero entero 'n', se lo descompone en una lista
(check-expect (descomponer 1234) '(1 2 3 4))
(define (descomponer n) (if (= n (modulo n 10))
                            (list n)
                            (append (descomponer (floor (/ n 10))) (list (modulo n 10)) )))







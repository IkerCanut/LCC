;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Practica6) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(check-expect (copiar 2 "hola") (list "hola" "hola"))
(check-expect (copiar 0 "hola") '())
(check-expect (copiar 4 "abc") (list "abc" "abc" "abc" "abc"))
(define (copiar n s) (cond [(zero? n) '()]
                           [(positive? n) (cons s (copiar (sub1 n) s))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (sumanat 3 2) 5)
(define (sumanat a b) (cond [(zero? b) a]
                            [(positive? b) (sumanat (add1 a) (sub1 b))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (multiplicar 3 2) 6)
(check-expect (multiplicar 3 0) 0)
(check-expect (multiplicar 0 2) 0)
(check-expect (multiplicar 4 6) 24)

(define (multiplicar a b) (cond [(zero? b) 0]
                                [else (sumanat a (multiplicar a (sub1 b)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (powernat 4 2) 16)
(check-expect (powernat 3 0) 1)
(check-expect (powernat 0 2) 0)
(check-expect (powernat 2 5) 32)

(define (powernat a b) (cond [(zero? b) 1]
                             [else (multiplicar a (powernat a (sub1 b)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 4 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (sigma 4 sqr) 30)
(check-expect (sigma 10 identity) 55)

(define (sigma n f) (cond [(zero? n) (f n)]
                          [(positive? n) (+ (f n) (sigma (sub1 n) f))]))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 5 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-within (R 5) 1.96 0.01)
(define (Raux n) (/ 1 (expt 2 n)))
(define (R n) (sigma 5 Raux))

(check-expect (S 5) 3.55)
(define (Saux n) (/ n (+ 1 n)))
(define (S n) (sigma 5 Saux))

(check-expect (T 5) 2.45)
(define (Taux n) (/ 1 (+ 1 n)))
(define (T n) (sigma 5 Taux))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 6 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (intervalo 4) (list 1 2 3 4))
(define (intervalo n) (cond [(zero? n) '()]
                            [(positive? n) (sort (cons n (intervalo (- n 1))) <)]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 7 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (factnat 5) 120)
(define (factnat n) (cond [(zero? n) 1]
                          [(positive? n) (multiplicar n (factnat (sub1 n)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 8 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (fibnat 0) 0)
(check-expect (fibnat 1) 1)
(check-expect (fibnat 2) 1)
(check-expect (fibnat 3) 2)
(check-expect (fibnat 4) 3)
(check-expect (fibnat 5) 5)
(define (fibnat n) (cond [(zero? n) 0]
                         [(= (add1 0) n) 1]
                         [(positive? n)
                          (+ (fibnat (sub1 (sub1 n))) (fibnat (sub1 n)))]))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 9 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (list-fibonacci 4) (list 0 1 1 2 3))
(define (list-fibonacci n) (sort (cond [(zero? n) (list (fibnat 0))]
                                 [else (cons (fibnat n) (list-fibonacci (sub1 n)))]) < ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 10 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (g n) (cond [(= n 0) 1]
                    [(= n 1) 2]
                    [(= n 2) 3]
                    [else (* (g (sub1 n)) (g (sub1 (sub1 n))) (g (sub1 (sub1 (sub1 n)))) )]))

(check-expect (list-g 4) (list 36 6 3 2 1))
(check-expect (list-g 0) (list 1))
(define (list-g n) (cond [(zero? n) (list (g n))]
                         [else (cons (g n) (list-g (sub1 n)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 11 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (componer sqr 2 5) 625)
(check-expect (componer add1 5 13) 18)
(define (componer f n x) (cond [(zero? n) x]
                               [else (f (componer f (sub1 n) x))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 12 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (multiplos 4 7) (list 28 21 14 7))
(check-expect (multiplos 0 11) '())
(define (multiplos n m) (cond [(zero? n) '()]
                              [else (cons (* n m) (multiplos (sub1 n) m))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 13 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (g13 3 negative?) #false)
(check-expect (g13 7 even?) #true)
(define (g13 n f) (cond [(zero? n) (f n)]
                        [else (if (f n) #true (g13 (sub1 n) f))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 14 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (circulo m) (circle (expt m 2) "outline" "blue"))

(define (circulosAUX m M) (cond [(zero? m) (empty-scene (* (expt M 2) 2) (* (expt M 2) 2) "white")]
                                [(positive? m) (place-image (circulo m) (expt M 2) (expt M 2) (circulosAUX (sub1 m) M))]))

(define (circulos m) (circulosAUX m m))

(circulos 10)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 15 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cuadradom m ang) (rotate ang (square (expt m 2) "outline" "blue")))

(define (cuadrados m ang) (cond [(zero? m) (empty-scene 200 200)]
                                [else (place-image (cuadradom m ang) 100 100 (cuadrados (sub1 m) (+ ang 20)))]))

(cuadrados 10 70)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 16 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (cuotas 10000 0 18) '())
(check-expect (cuotas 10000 1 12) (list 10100))
(check-expect (cuotas 30000 3 12) (list 10100 10200 10300))
(check-expect (cuotas 100000 4 18) (list 25375 25750 26125 26500))

(define (devoluciones dev n) (cond [(zero? n) '()]
                                   [(positive? n) (cons dev (devoluciones dev (sub1 n)))]))

(define (agregarintereses l i contador) (cond [(empty? l) '()]
                                              [else (cons
                                                     (+ (first l) (* (first l) (/ i 100 12) contador))
                                                     (agregarintereses (rest l) i (add1 contador)))]))

(define (cuotas total n i) (agregarintereses (devoluciones (if (= n 0) 0 (/ total n)) n) i 1))
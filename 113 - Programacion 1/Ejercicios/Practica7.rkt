;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Practica7) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (intervalo 4) (list 1 2 3 4))
(define (intervalo n) (cond [(zero? n) '()]
                            [(positive? n) (sort (cons n (intervalo (- n 1))) <)]))

(define CARAS 6)
(define MAX 200)
(define VALORES (rest (intervalo (* 2 CARAS))))
(define (simular-dado n) (cond [(zero? n) '()]
                               [else (cons (+ (random 1 (+ CARAS 1)) (random 1 (+ CARAS 1))) (simular-dado (sub1 n)))]))
(define EXPERIMENTO (simular-dado MAX))

(check-expect (frecuencia 3 '(1 2 3 3 3 3 2 1)) 4)
(define (frecuencia n l) (cond [(empty? l) 0]
                               [else (if (= n (first l))
                                         (+ 1 (frecuencia n (rest l)))
                                         (frecuencia n (rest l)))]))

(check-expect (frecuencia-relativa 3 '(1 2 3 3 3 3 2 1)) .50)
(define (frecuencia-relativa n l) (/  (frecuencia n l) (length l)))

(define (frec-rel-exp n) (frecuencia-relativa n EXPERIMENTO))
(define FRECUENCIAS-RELATIVAS (map frec-rel-exp VALORES))

FRECUENCIAS-RELATIVAS
; Se esperan valores cercanos a 1/6, que se aproxima a 0.16666...
; Con 2 dados, los valores recibidos son los siguientes:
; (list
;     0.02812 0.05564 0.08334 0.10996 0.13698 0.16746
;             0.13974 0.10972 0.08504 0.05568 0.02832)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define RAND-MAX 4294967087) ; numero maximo para valores aleatorios

; aleatorio : Number Number -> Number
; dados dos numero a y b, devuleve un numero aleatorio en el intervalo [a,b].
(define (aleatorio a b) (+ a (* (- b a) (/  (+ 1 (random RAND-MAX)) (* 1.0 RAND-MAX)))))

(define RADIO 3.0) ; radio del circulo
(define CENTRO (make-posn -1 -0.5)) ; coordenadas del centro del ci­rculo

; generar-puntos : Natural -> List(posn)
; Dado un natural n, devuelve una lista con n puntos aleatorios,
; con ambas componentes en el intervalo [-RADIO, RADIO]. Es decir, dentro del cuadrado.
(define (generar-puntos n)
  (cond [(zero? n) empty]
        [else (cons (make-posn (aleatorio (- RADIO) RADIO) (aleatorio (- RADIO) RADIO) )
                    (generar-puntos (- n 1)))]
        ))

; distancia : posn posn -> Number
; dados dos puntos, devuelve su distancia
(check-expect (distancia (make-posn 15 0) (make-posn 3 0)) 12)
(check-expect (distancia (make-posn 2 1) (make-posn 6 4)) 5)
(check-expect (distancia (make-posn 0 16) (make-posn 0 0)) 16)
(define (distancia p q)
  (sqrt (+ (sqr (abs (- (posn-x p) (posn-x q)))) (sqr (abs (- (posn-y p) (posn-y q)))))))

; adentro? : posn -> Boolean
; dada una posicion, determina si cae en el circulo centrado en CENTRO y cuyo radio es RADIO
(check-expect (adentro? (make-posn 0 0)) #t)
(check-expect (adentro? (make-posn RADIO (* 2 RADIO))) #f)
(check-expect (adentro? (make-posn RADIO RADIO)) #f)
(define (adentro? p)
  (and (<= (distancia p CENTRO) RADIO) (>= (posn-x p) 0) (>= (posn-y p) 0))) 


; generamos una lista con muchos puntos aleatorios
(define LISTA (generar-puntos MAX))

; nos quedamos con aquellos que estan dentro del circulo 
(define ADENTRO (filter adentro? LISTA))

; aproximamos el area del circulo a partir de la proporcion de puntos que
; caen dentro del circulo:
(define AREA (* 36.0 (/ (length ADENTRO) (length LISTA))))

(string-append "Nuesta aproximacion de pi es: " (number->string  (exact->inexact AREA)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; generar-criba : Number -> List(Number)
(check-expect (generar-criba 10) (list 2 3 4 5 6 7 8 9 10))
(define (generar-criba n) (rest (intervalo n)))

; borrar-multiplos : Number List(Number) -> List(Number)
(check-expect (borrar-multiplos 2 (generar-criba 10)) '(3 5 7 9))
(define (borrar-multiplos x l) (cond [(empty? l) empty]
                                     [else (if (zero? (modulo (first l) x))
                                               (borrar-multiplos x (rest l))
                                               (cons (first l) (borrar-multiplos x (rest l))))]))

; eratostenes : List(Number) -> List(Number)
(define (eratostenes l) (cond [(empty? l) empty]
                              [else (cons (first l) (eratostenes (borrar-multiplos (first l) (rest l))))]))

; criba-eratostenes : Number -> List(Number)
(check-expect (criba-eratostenes 10) (list 2 3 5 7))
(check-expect (criba-eratostenes 2) (list 2))
(check-expect (criba-eratostenes 20) (list 2 3 5 7 11 13 17 19))
(define (criba-eratostenes n) (eratostenes (generar-criba n)))

(check-expect (lista->string '(1 2 3)) "1\n2\n3\n")
(define (lista->string l) (cond [(empty? l) ""]
                                [else (string-append
                                       (number->string (first l))
                                       "\n"
                                       (lista->string (rest l)))]))

; (write-file "primos.txt" (lista->string (criba-eratostenes 10000)))|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 4 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
;(define LISTA-DE-PRIMOS (read-lines "primos.txt"))

; primo : Number List(Number) -> Boolean
(define (primo m l) (if (< (string->number (first l)) (sqrt m))
                        (if (zero? (modulo m (string->number (first l))))
                           #false
                            (primo m (rest l)))
                        #true))

; es-primo? : Number -> Boolean
(check-expect (es-primo? 10492302) #false)
(check-expect (es-primo? 49987168) #false)
(check-expect (es-primo? 86077909) #true)
(check-expect (es-primo? 96928157) #true)
(check-expect (es-primo? 49987169) #true)
(check-expect (es-primo? 54257153) #true)
(define (es-primo? m) (primo m LISTA-DE-PRIMOS))|#



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 5 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; tomar : List(Number) Number -> List(Number)
(check-expect (tomar '(1 2 3) 1) '(1))
(check-expect (tomar '(1 2 3) 3) '(1 2 3))
(check-expect (tomar '(1 2 3) 0) '())
(define (tomar l n) (cond [(zero? n) '()]
                          [else (cons (first l) (tomar (rest l) (sub1 n)))]))

; tirar : List(Number) Number -> List(Number)
(check-expect (tirar '(1 2 3) 1) '(2 3))
(check-expect (tirar '(1 2 3) 3) '())
(check-expect (tirar '(1 2 3) 0) '(1 2 3))
(define (tirar l n) (cond [(zero? n) l]
                          [else (tirar (rest l) (sub1 n))]))

; partir : String -> List(String)
; dado un string, devuele una lista de strings con cada simbolo separado
(check-expect (partir "ABC") (list "A" "B" "C"))
(check-expect (partir "12345") (list "1" "2" "3" "4" "5"))
(define (partir s) (cond [(string=? s "") '()]
                         [else (cons (string-ith s 0) (partir (substring s 1 (string-length s))))]))

; emparejar : List List -> List
; dadas dos listas [a0,..., an] y [b0, ...., bn] de la misma longitud, devuelve una lista
; de posn con parejas tomadas de ambas listas: [(make-posn a0 b0), ...., (make-posn an bn)]
(check-expect (emparejar (list 1 2) (list "a" "b")) (list (make-posn 1 "a") (make-posn 2 "b")))
(check-expect (emparejar (list #t #f) (list 1 0)) (list (make-posn #t 1) (make-posn #f 0)))
(define (emparejar l m) (cond [(empty? l) '()]
                              [else (cons (make-posn (first l) (first m))
                                          (emparejar (rest l) (rest m)))]))

; cifrado : N string -> List(posn)
(check-expect (cifrado 5 "ABC") (list (make-posn "A" "C") (make-posn "B" "A") (make-posn "C" "B"))) 
(check-expect (cifrado 1 "ABC") (list (make-posn "A" "B") (make-posn "B" "C") (make-posn "C" "A")))
(define (cifrado n s) (emparejar (partir s)
                                 (append
                                  (tirar (partir s) (modulo n (string-length s)))
                                  (tomar (partir s) (modulo n (string-length s))))))

; encriptar-simbolo : String List(posn) -> String
(check-expect (encriptar-simbolo "B" (cifrado 5 "ABC")) "A")
(check-expect (encriptar-simbolo "A" (cifrado 1 "ABC")) "B")
(define (encriptar-simbolo c l) (cond [(empty? l) (error "No se encuentra la clave")]
                                      [(string=? (posn-x (first l)) c) (posn-y (first l))]
                                      [else (encriptar-simbolo c (rest l))]))

; encriptar-mensaje : String String Number -> String
(check-expect (encriptar-mensaje "ABC" "ABCDEF" 3) "DEF")
(check-expect (encriptar-mensaje "ABC" "ABCDEF" 4) "EFA")
(define (encriptar-mensaje s a n) (cond [(string=? s "") ""]
                                        [else (string-append
                                               (encriptar-simbolo (string-ith s 0) (cifrado n a))
                                               (encriptar-mensaje (substring s 1 (string-length s)) a n))]))

; desencriptar-simbolo : String List(posn) -> String
(check-expect (desencriptar-simbolo "A" (cifrado 2 "ABC")) "B")
(check-expect (desencriptar-simbolo "A" (cifrado 1 "ABC")) "C")
(define (desencriptar-simbolo c l) (cond [(empty? l) (error "No se encuentra la clave")]
                                         [(string=? (posn-y (first l)) c) (posn-x (first l))]
                                         [else (desencriptar-simbolo c (rest l))]))

; desencriptar-mensaje : String String Number -> String
(check-expect (desencriptar-mensaje "DEF" "ABCDEF" 3) "ABC")
(check-expect (desencriptar-mensaje "EFA" "ABCDEF" 4) "ABC")
(define (desencriptar-mensaje s a n) (cond [(string=? s "") ""]
                                        [else (string-append
                                               (desencriptar-simbolo (string-ith s 0) (cifrado n a))
                                               (desencriptar-mensaje (substring s 1 (string-length s)) a n))]))


(define ALFABETO "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ 0123456789")
(define CLAVE 3)
(define CODIGO-DEL-CESAR (cifrado CLAVE ALFABETO))
(check-expect (encriptar-mensaje "HOLA" ALFABETO CLAVE) "KRÑD")
(check-expect (encriptar-mensaje "ATACAR A LAS 18" ALFABETO CLAVE) "DWDFDU2D2ÑDV24B")
(check-expect (encriptar-mensaje "LA OPERACION ES REVERSIBLE" ALFABETO CLAVE) "ÑD2RSHUDFLRP2HV2UHYHUVLEÑH")
(check-expect (desencriptar-mensaje (encriptar-mensaje "LA OPERACION ES REVERSIBLE" ALFABETO CLAVE) ALFABETO CLAVE) "LA OPERACION ES REVERSIBLE")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 6 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; juego-valido : list(Number) Number -> Boolean
(check-expect (juego-valido '(3 6 7 1 5 4 2) 1) #false)
(check-expect (juego-valido '(5 4 1 7 6 2 3) 1) #true)
(define (juego-valido l pos) (cond [(empty? l) #true]
                                   [(= (first l) pos) #false]
                                   [else (juego-valido (rest l) (add1 pos))]))



(define (shuffle l) (cond [(empty? l) '()]
                          [else (let ([r (list-ref l (random 0 (length l)))])
                                  (cons r (shuffle (remove r l))))]))
(define (crear-cartas n) (cond [(zero? n) '()]
                               [else (append (crear-cartas (sub1 n)) (list n))]))

; FUNCION AUXILIAR
(define (a-ver) (let ([juego (shuffle (crear-cartas 7))]) (make-posn juego (juego-valido juego 1))))

; simular-juego : Natural -> Natural 
(define (simular-juego n) (cond [(zero? n) 0]
                                [else (if (juego-valido (shuffle (crear-cartas 7)) 1)
                                          (+ 1 (simular-juego (sub1 n)))
                                          (simular-juego (sub1 n)))]))
(define INTENTOS-JUEGO 1000)
; (simular-juego INTENTOS-JUEGO) -> 36920
; (simular-juego INTENTOS-JUEGO) -> 36674
(define PORCENTAJE-JUEGO-VALIDO (/ (* (simular-juego INTENTOS-JUEGO) 100) INTENTOS-JUEGO))
PORCENTAJE-JUEGO-VALIDO
; Por lo tanto, las posibilidades de que sea un juego valido son de aproximadamente
; un 37%, i.e le conviene jugar a Rocio porque tiene mas posibilidades de que el juego
; no sea valido.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 7 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (implica #f #f) #t)
(check-expect (implica #f #t) #t)
(check-expect (implica #t #f) #f)
(check-expect (implica #t #t) #t)
(define (implica p q) (or (not p) q))

(check-expect (equivalente #f #f) #t)
(check-expect (equivalente #f #t) #f)
(check-expect (equivalente #t #f) #f)
(check-expect (equivalente #t #t) #t)
(define (equivalente p q) (and (implica p q) (implica q p)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 8 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; agregar-true : List(Boolean) -> List(Boolean)
(define (agregar-true l) (cons #t l))

; agregar-false : List(Boolean) -> List(Boolean)
(define (agregar-false l) (cons #f l))

; valuaciones : Natural -> List(Boolean)
(define (valuaciones n) (cond [(zero? n) '()]
                              [(= n 1) (list (list #false) (list #true))]
                              [else (append (map agregar-false (valuaciones (sub1 n)))
                                            (map agregar-true (valuaciones (sub1 n))))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 9 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (A l) (let ([p1 (first l)]
                    [p2 (second l)]
                    [p3 (third l)])
                (equivalente (and (implica p1 p3)
                                  (implica p2 p3))
                             (implica (or p1 p2)
                                      p3))))

(define (B l) (let ([p1 (first l)]
                    [p2 (second l)]
                    [p3 (third l)])
                (equivalente (implica (and p1 p2)
                                      p3)
                             (and (implica p1 p3)
                                  (implica p2 p3)))))

(define (C l) (let ([p1 (first l)]
                    [p2 (second l)])
                (equivalente (or (not p1) (not p2))
                             (and p1 p2))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 10 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; evaluar (List(Boolean) -> Boolean) Natural -> List(Boolean)
(define (evaluar P n) (map P (valuaciones n)))

(check-expect (evaluar A 3) (list #true #true #true #true #true #true #true #true))
(check-expect (evaluar B 3) (list #true #true #false #true #false #true #true #true))
(check-expect (evaluar C 2) (list #false #false #false #false))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 11 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; tautologia? (List(Boolean)->Boolean) Natural -> Boolean
(check-expect (tautologia? A 3) #true)
(check-expect (tautologia? B 3) #false)
(check-expect (tautologia? C 2) #false)
(define (tautologia? P n) (andmap identity (evaluar P n)))

; satisfactible? (List(Boolean)->Boolean) Natural -> Boolean
(check-expect (satisfactible? A 3) #true)
(check-expect (satisfactible? B 3) #true)
(check-expect (satisfactible? C 2) #false)
(define (satisfactible? P n) (ormap identity (evaluar P n)))

; contradiccion? (List(Boolean)->Boolean) Natural -> Boolean
(check-expect (contradiccion? A 3) #false)
(check-expect (contradiccion? B 3) #false)
(check-expect (contradiccion? C 2) #true)
(define (contradiccion? P n) (not (ormap identity (evaluar P n))))

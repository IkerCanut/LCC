;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname EjemplosEjFinales) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (fun x y z) (cond [(> z (expt x y)) (+ x y z)]
                          [(< (expt x z) y) (* x y z)]
                          [else x]))
(fun 2 1 4)
; == defincion fun
; (cond [(> 4 (expt 2 1)) (+ 2 1 4)]
;       [(< (expt 2 4) 1) (* 2 1 4)]
;       [else 2])
; == ley expt
; (cond [(> 4 2) (+ 2 1 4)]
;       [(< (expt 2 4) 1) (* 2 1 4)]
;       [else 2])
; == como 4 > 2 es verdadero, entonces evalua a #true
; (cond [#true (+ 2 1 4)]
;       [(< (expt 2 4) 1) (* 2 1 4)]
;       [else 2])
; == definicion de cond (ley 1)
; (+ 2 1 4)
; == definicion +
; 7

(fun 6 1 4)
; == definicion fun
; (cond [(> 4 (expt 6 4)) (+ 6 1 4)]
;       [(< (expt 6 4) 1) (* 6 1 4)]
;       [else 6]))
; == ley expt
; (cond [(> 4 1296) (+ 6 1 4)]
;       [(< (expt 6 4) 1) (* 6 1 4)]
;       [else 6]))
; == como 4 no es mayor que 1296, (> 4 1296) evalua a #false
; (cond [#false (+ 6 1 4)]
;       [(< (expt 6 4) 1) (* 6 1 4)]
;       [else 6]))
; == definicion de cond, ley 2
; (cond [(< (expt 6 4) 1) (* 6 1 4)]
;       [else 6]))
; == ley expt
; (cond [(< 1296 1) (* 6 1 4)]
;       [else 6]))
; == como 1296 no es menor que 1, (< 1296 1) evalua a #false 
; (cond [#false (* 6 1 4)]
;       [else 6]))
; == definicion de cond, ley 2
; (cond [else 6]))
; == definicion de cond, ley 1
; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(= (* 25 5) 60) ; #false
(string=? (string-ith (string-append "aBC" "dEf" "GhI") (sub1 6)) "F") ; #false
(string? (fourth (list #t 5 "hola" #f "mundo"))) ; #false

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; f : Number Number Boolean -> Number 
(define (f n m b) (cond [(= n (+ m 2)) (+ n m)]
                        [(and (< n m) b) (+ n m 3)]
                        [else (* 2 n)]))
(f 4 2 #t)
; == definicion de f
; (cond [(= 4 (+ 2 2)) (+ 4 2)]
;       [(and (< 4 2) #t) (+ 4 2 3)]
;       [else (* 2 4)])
; == ley +
; (cond [(= 4 4) (+ 4 2)]
;       [(and (< 4 2) #t) (+ 4 2 3)]
;       [else (* 2 4)])
; == como 4 es igual a 4, (= 4 4) evalua a true
; (cond [#true (+ 4 2)]
;       [(and (< 4 2) #t) (+ 4 2 3)]
;       [else (* 2 4)])
; == definicion cond, ley 1
; (+ 4 2)
; == ley +
; 6

(f 5 6 #f)
; == definicion de f
; (cond [(= 5 (+ 6 2)) (+ 5 6)]
;       [(and (< 5 6) #f) (+ 5 6 3)]
;       [else (* 2 5)])
; == ley +
; (cond [(= 5 8) (+ 5 6)]
;       [(and (< 5 6) #f) (+ 5 6 3)]
;       [else (* 2 5)])
; == ley =
; (cond [#false (+ 5 6)]
;       [(and (< 5 6) #f) (+ 5 6 3)]
;       [else (* 2 5)])
; == definicion cond, ley 2
; (cond [(and (< 5 6) #f) (+ 5 6 3)]
;       [else (* 2 5)])
; == ley <
; (cond [(and #t #f) (+ 5 6 3)]
;       [else (* 2 5)])
; == ley and
; (cond [#f (+ 5 6 3)]
;       [else (* 2 5)])
; == definicion cond, ley 2
; (cond [else (* 2 5)])
; == definicion cond, ley 1
; (* 2 5)
; == definicion *
; 10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 4 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; f4 : Number String Boolean Image -> Number
(check-expect (f4 0 "hola" #f (circle 10 "solid" "blue")) 27)
(check-expect (f4 0 "hola" #t (circle 10 "solid" "blue")) 24)
(define (f4 a b c d)
          (+ (- 3 a) (if c 1 (string-length b)) (image-width d)))

; g4 : Number String Number -> Number | String
(check-expect (g4 2 "Holas" 20) "Error")
(check-expect (g4 2 "Hola" 20) 20)
(check-expect (g4 8 "Hola" 20) 13)
(check-expect (g4 8 "Hola" 2) 32)
(define (g4 x y z)
        (if (> x (string-length y))
            (if (> 3 z) (+ x 24) 13)
            (if (= (string-length y) 4) z "Error")))


; g4 : Number String Number -> Number | String
(check-expect (g42 2 "Holas" 20) "Error")
(check-expect (g42 2 "Hola" 20) 20)
(check-expect (g42 8 "Hola" 20) 13)
(check-expect (g42 8 "Hola" 2) 32)
(define (g42 x y z) (cond [(and (> x (string-length y)) (> 3 z)) (+ x 24)]
                          [(and (> x (string-length y)) (<= 3 z)) 13]
                          [(and (<= x (string-length y)) (= (string-length y) 4)) z]
                          [else "Error"]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 5 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; replicar-elemento : X Natural -> List(X)
(check-expect (replicar-elemento 1 3) '(1 1 1))
(define (replicar-elemento x n) (cond [(zero? n) '()]
                                      [else (cons x (replicar-elemento x (sub1 n)))]))

; replicar List(X) Natural -> List(X)
(check-expect (replicar (list 4 6 3 9) 3) (list 4 4 4 6 6 6 3 3 3 9 9 9))
(define (replicar l n) (cond [(empty? l) '()]
                             [else (append
                                    (replicar-elemento (first l) n)
                                    (replicar (rest l) n))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 6 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct pedido [nombre menu postre])
(define-struct pedido-final [menu1 menu2 menu3 postre1 postre2])

; pedidos->pedidos-finales : List(pedido)->List(pedido-final)
; dada una lista l de pedidos, la transforma a una lista de pedidos finales,
; donde cada pedido contiene un solo plato.
(check-expect (pedidos->pedidos-finales (list (make-pedido "iker" 1 2) (make-pedido "kepa" 1 1)))
              (list (make-pedido-final 1 0 0 0 0) (make-pedido-final 0 0 0 0 1) (make-pedido-final 1 0 0 0 0) (make-pedido-final 0 0 0 1 0)))
(check-expect (pedidos->pedidos-finales (list (make-pedido "iker" 2 2) (make-pedido "kepa" 2 2) (make-pedido "ander" 2 2)))
              (list (make-pedido-final 0 1 0 0 0) (make-pedido-final 0 0 0 0 1)
                    (make-pedido-final 0 1 0 0 0) (make-pedido-final 0 0 0 0 1)
                    (make-pedido-final 0 1 0 0 0) (make-pedido-final 0 0 0 0 1)))
(check-expect (pedidos->pedidos-finales (list (make-pedido "iker" 3 2)))
              (list (make-pedido-final 0 0 1 0 0) (make-pedido-final 0 0 0 0 1)))
(define (pedidos->pedidos-finales l) (cond [(empty? l) empty]
                                          [else (append (list (cond [(= (pedido-menu (first l)) 1) (make-pedido-final 1 0 0 0 0)]
                                                                    [(= (pedido-menu (first l)) 2) (make-pedido-final 0 1 0 0 0)]
                                                                    [(= (pedido-menu (first l)) 3) (make-pedido-final 0 0 1 0 0)]))
                                                        (list (cond [(= (pedido-postre (first l)) 1) (make-pedido-final 0 0 0 1 0)]
                                                                    [(= (pedido-postre (first l)) 2) (make-pedido-final 0 0 0 0 1)]))
                                                        (pedidos->pedidos-finales (rest l)))]))

; sumar-pedidos-finales : List(pedido-final) -> pedido-final
; dada una lista l de pedidos finales, suma las cantidades de pedidos,
; devolviendo asi un unico pedido-final.
(check-expect (sumar-pedidos-finales empty) (make-pedido-final 0 0 0 0 0))
(check-expect (sumar-pedidos-finales
                 (list (make-pedido-final 1 0 0 0 0)
                       (make-pedido-final 0 0 0 0 1)
                       (make-pedido-final 1 0 0 0 0)
                       (make-pedido-final 0 0 0 1 0)))
              (make-pedido-final 2 0 0 1 1))
(define (sumar-pedidos-finales l) (cond [(empty? l) (make-pedido-final 0 0 0 0 0)]
                                        [(empty? (rest l)) (first l)]
                                        [else
          (sumar-pedidos-finales (cons (make-pedido-final (+ (pedido-final-menu1 (first l)) (pedido-final-menu1 (second l)))
                                                          (+ (pedido-final-menu2 (first l)) (pedido-final-menu2 (second l)))
                                                          (+ (pedido-final-menu3 (first l)) (pedido-final-menu3 (second l)))
                                                          (+ (pedido-final-postre1 (first l)) (pedido-final-postre1 (second l)))
                                                          (+ (pedido-final-postre2 (first l)) (pedido-final-postre2 (second l))))
                                 (rest (rest l))))]))

; armar-pedido-final : List(pedido) -> pedido-final
(check-expect (armar-pedido-final (list (make-pedido "iker" 2 2) (make-pedido "kepa" 2 1) (make-pedido "maite" 3 2) (make-pedido "alaia" 1 2)))
              (make-pedido-final 1 2 1 1 3))
(define (armar-pedido-final l) (sumar-pedidos-finales (pedidos->pedidos-finales l)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 7 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (sublistas-vacias? (list '() '() '())) #true)
(check-expect (sublistas-vacias? (list '() (list 5 7))) #false)
(define (sublistas-vacias? ll) (cond [(empty? ll) #true]
                                     [(not (empty? (first ll))) #false]
                                     [else (sublistas-vacias? (rest ll))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 8 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct trabajador [apellido estado hijos bruto])
(check-expect (impuesto (make-trabajador "Canut" "soltero" 0 15000)) 0)
(check-expect (impuesto (make-trabajador "Canut" "soltero" 0 16000)) 800)
(check-expect (impuesto (make-trabajador "Canut" "soltero" 1 18500)) 925)
(check-expect (impuesto (make-trabajador "Canut" "soltero" 1 16000)) 0)
(check-expect (impuesto (make-trabajador "Canut" "casado" 0 18000)) 0)
(check-expect (impuesto (make-trabajador "Canut" "casado" 0 19000)) 950)
(check-expect (impuesto (make-trabajador "Canut" "casado" 1 19000)) 0)
(check-expect (impuesto (make-trabajador "Canut" "casado" 2 20000)) 0)
(check-expect (impuesto (make-trabajador "Canut" "casado" 2 20000)) 0)
(check-expect (impuesto (make-trabajador "Canut" "casado" 3 200000)) 0)

(define (impuesto t) (cond [(>= (trabajador-hijos t) 3) 0]
                           [(not (trabajador? t)) (error "Tipo de dato inválido")]
                           [(and (string=? (trabajador-estado t) "soltero")
                                 (<= (trabajador-bruto t) (+ 15000 (* 1000 (trabajador-hijos t))))) 0]
                           [(and (string=? (trabajador-estado t) "casado")
                                 (<= (trabajador-bruto t) (+ 18000 (* 1000 (trabajador-hijos t))))) 0]
                           [else (* 0.05 (trabajador-bruto t))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 9 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; subcadena : List(String) String -> List(String)
(check-expect (subcadena? (list "cadena" "Helena" "casa") "ena") (list "cadena" "Helena"))
(check-expect (subcadena? (list "Hola" "mundo") "eso") '())
(check-expect (subcadena? '() "altos") '())
(define (subcadena? l sub) (cond [(empty? l) empty]
                                 [else (if (string-contains? sub (first l))
                                           (cons (first l) (subcadena? (rest l) sub))
                                           (subcadena? (rest l) sub))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 10 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; shortest : List(String)->String
(check-expect (shortest (list "b" "a" "aa" "aaa" "aaaa")) "a")
(check-expect (shortest (list "b" "aaaa" "aaa" "aa" "a")) "a")
(define (shortest l) (cond [(empty? l) (error "Lista vacia")]
                           [(empty? (rest l)) (first l)]
                           [(< (string-length (first l)) (string-length (second l)))
                               (shortest (cons (first l) (rest (rest l))))]
                           [else (shortest (rest l))]))

; longest : List(String)->String
(check-expect (longest (list "bbbb" "a" "aa" "aaa" "aaaa")) "aaaa")
(check-expect (longest (list "bbbb" "aaaa" "aaa" "aa" "a")) "aaaa")
(define (longest l) (cond [(empty? l) (error "Lista vacia")]
                          [(empty? (rest l)) (first l)]
                          [(> (string-length (first l)) (string-length (second l)))
                              (longest (cons (first l) (rest (rest l))))]
                          [else (longest (rest l))]))

; shortest-longest? : List(string)->posn
(check-expect (shortest-longest (list "a" "acb" "b" "xf" "asdf" "xf"))
              (make-posn "b" "asdf"))
(define (shortest-longest l) (cond [(empty? l) (error "Lista vacia")]
                                   [else (make-posn (shortest l) (longest l))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 11 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct pers [peso altura])

; imc-list : List(pers) -> List(Number)
(check-within (imc-list (list (make-pers 72 1.90) (make-pers 80 1.90))) (list 19.94 22.16) 0.01)
(define (imc-list l) (cond [(empty? l) '()]
                           [else (cons
                                  (/ (pers-peso (first l)) (expt (pers-altura (first l)) 2))
                                  (imc-list (rest l)))]))

; suma-list : List(Number) -> Number
(check-expect (suma-list '(1 2 3 2)) 8)
(define (suma-list l) (cond [(empty? l) 0]
                            [else (+ (first l) (suma-list (rest l)))]))

; prom-imc : List(pers) -> Number
(check-within (prom-imc (list (make-pers 44 1.55) (make-pers 50 1.56))) 19.43 0.01)
(define (prom-imc l) (/ (suma-list (imc-list l)) (length l)))

; clasificacion : List(Number) -> List(String)
(define (clasificacion l) (cond [(empty? l) '()]
                                [(< (first l) 18.5) (cons "Bajo Peso" (clasificacion (rest l)))]
                                [(< (first l) 25) (cons "Peso Normal" (clasificacion (rest l)))]
                                [(< (first l) 30) (cons "Sobrepeso" (clasificacion (rest l)))]
                                [else (cons "Obesidad" (clasificacion (rest l)))]))

; clasif : List(pers) -> List String
(check-expect (clasif (list (make-pers 44 1.55) (make-pers 50 1.56) (make-pers 70 1.55) (make-pers 150 1.56))) (list "Bajo Peso" "Peso Normal" "Sobrepeso" "Obesidad"))
(define (clasif l) (clasificacion (imc-list l)))

; contar-peso-normal : List(String) -> Number
(define (contar-peso-normal l) (cond [(empty? l) 0]
                                     [(string=? (first l) "Peso Normal")
                                         (+ 1 (contar-peso-normal (rest l)))]
                                     [else (contar-peso-normal (rest l))]))

(check-expect (poblacion-saludable?
               (list (make-pers 50 1.56) (make-pers 50 1.56) (make-pers 50 1.56)
                     (make-pers 50 1.56) (make-pers 90 1.56)))
              #true)
(check-expect (poblacion-saludable?
               (list (make-pers 50 1.56) (make-pers 50 1.56) (make-pers 50 1.56)
                     (make-pers 110 1.56) (make-pers 90 1.56)))
              #false)
(define (poblacion-saludable? l) (>= (/ (contar-peso-normal (clasif l)) (length l)) .80))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 12 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; estado del sistema:
(define-struct estado [color angulo rotacion])
; estado es (make-estado String Number String).
; Interpretación: El estado del sistema estará compuesto por:
;    - un color, que sera el color correspondiente al cuadrado en el centro de la escena
;    - un angulo que indica la rotacion con la cual se dibuja el cuadrado en el centro de la escena
;    - un string que indica si el cuadrado rota automaticamente con cada tick o no. El string "on"
;      indica una rotacion automatica. El string "off" indica que el cuadrado no se mueve.

; constantes
(define ALTO 300)
(define ANCHO 400)
(define GRADOS-POR-TICK 5)
(define COLOR-FONDO "green")
(define LADO-CUADRADO 50)
(define MODO-CUADRADO "solid")
(define INIT (make-estado "red" 0 "on")) ; estado inicial

; dibujar : estado -> imagen
(define (dibujar s) (place-image (rotate (estado-angulo s) (square LADO-CUADRADO MODO-CUADRADO (estado-color s)))
                                 (/ ANCHO 2) (/ ALTO 2)
                                 (empty-scene ANCHO ALTO COLOR-FONDO)))

; key-handler : estado key -> estado
; maneja las teclas presionadas
(define (key-handler s k) (cond [(key=? k " ") (make-estado
                                                (estado-color s)
                                                (estado-angulo s)
                                                (if (string=? (estado-rotacion s) "off") "on" "off"))]
                                [(key=? k "b") (make-estado
                                                "blue"
                                                (estado-angulo s)
                                                (estado-rotacion s))]
                                [(key=? k "y") (make-estado
                                                "yellow"
                                                (estado-angulo s)
                                                (estado-rotacion s))]
                                [(key=? k "r") (make-estado
                                                "red"
                                                (estado-angulo s)
                                                (estado-rotacion s))]
                                [else s]))

; actualizar-angulo : estado -> estado
; responde al tick del reloj
(define (actualizar-angulo s) (if (string=? "on" (estado-rotacion s))
                                  (make-estado (estado-color s) (modulo (+ (estado-angulo s) 5) 360) "on")
                                  s))

#|(big-bang INIT
          [on-tick actualizar-angulo]
          [on-key  key-handler]
          [to-draw dibujar])|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 13 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; El Estado está compuesto por: una imagen, un numero y un string.
(define-struct estado13 [escena radio color])

;definiciones constantes, COMPLETE si es necesario
(define ANCHO13 500)
(define ALTO13 500)
(define COLOR-FONDO13 "black")
(define COLOR-INICIAL13 "red")
(define RADIO-INICIAL13 20)
  
;Estado inicial. Escena vacía del color del fondo, radio 20, color "red"
(define INIT13 (make-estado13 (empty-scene ANCHO13 ALTO13 COLOR-FONDO13) RADIO-INICIAL13 COLOR-INICIAL13))

;pantalla: Estado -> Image
;Pantalla: dedicado a la cláusula to-draw de la función big-bang
(define (pantalla s) (estado13-escena s))


;mouse-handler: Estado Number Number MouseEvent -> Estado
;mouse-handler es el handler dedicado a la cláusula on-mouse de la función big-bang
(define (mouse-handler13 s x y e) (cond [(string=? e "button-down") (make-estado13 (place-image (circle (estado13-radio s) "outline" (estado13-color s)) x y (estado13-escena s))
                                                                                   (estado13-radio s)
                                                                                   (estado13-color s))]
                                        [else s]))

;key-handler: Estado Key -> Estado
;key-handler es el handler dedicado a la cláusula on-key de la función big-bang
(define (key-handler13 s k) (cond [(key=? k "b") (make-estado13 (estado13-escena s)
                                                                (estado13-radio s)
                                                                "blue")]
                                  [(key=? k "m") (make-estado13 (estado13-escena s)
                                                                (estado13-radio s)
                                                                "magenta")]
                                  [(key=? k "g") (make-estado13 (estado13-escena s)
                                                                (estado13-radio s)
                                                                "green")]
                                  [(key=? k "up") (make-estado13 (estado13-escena s)
                                                                 (* (estado13-radio s) 2)
                                                                 (estado13-color s))]
                                  [(key=? k "down") (make-estado13 (estado13-escena s)
                                                                   (/ (estado13-radio s) 2)
                                                                   (estado13-color s))]
                                  [(key=? k "r") INIT13]
                                  [else s]))


; Expresión big-bang para el programa interactivo.
#|(big-bang INIT13
  [to-draw pantalla]
  [on-mouse mouse-handler13]
  [on-key key-handler13])|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 14 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct s14 [lienzo color figura])

(define INIT14 (make-s14 (empty-scene 500 500 "white") "red" "square"))

; p14 : s14 -> image
(define (p14 s) (s14-lienzo s))

; t14 : s14 Key -> s14
(define (t14 s k) (cond [(key=? k "r") (make-s14 (s14-lienzo s)
                                                 "red"
                                                 (s14-figura s))]
                        [(key=? k "g") (make-s14 (s14-lienzo s)
                                                 "green"
                                                 (s14-figura s))]
                        [(key=? k "b") (make-s14 (s14-lienzo s)
                                                 "blue"
                                                 (s14-figura s))]
                        [(key=? k "s") (make-s14 (s14-lienzo s)
                                                 (s14-color s)
                                                 "square")]
                        [(key=? k "c") (make-s14 (s14-lienzo s)
                                                 (s14-color s)
                                                 "circle")]
                        [else s]))

; m14 : s14 Number Number MouseEvent -> s14
(define (m14 s x y e) (cond [(and (string=? e "button-down") (string=? (s14-figura s) "circle")) (make-s14
                                                                                                  (place-image (circle 40 "outline" (s14-color s)) x y (s14-lienzo s))
                                                                                                  (s14-color s)
                                                                                                  (s14-figura s))]
                            [(and (string=? e "button-down") (string=? (s14-figura s) "square")) (make-s14
                                                                                                  (place-image (square 80 "outline" (s14-color s)) x y (s14-lienzo s))
                                                                                                  (s14-color s)
                                                                                                  (s14-figura s))]
                            [else s]))

#|(big-bang INIT14
  [to-draw p14]
  [on-key t14]
  [on-mouse m14])|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 15 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; El Estado está compuesto por una lista de posn

; constantes
(define W15 500) ; ancho de la escena
(define H15 500) ; alto de la escena
(define FONDO15 "yellow")
(define COLOR15 "black")
(define RADIO15 40)

;Estado inicial: lista vacia
(define INIT15 empty)

;p15: Estado -> Image
;p15: dedicado a la cláusula to-draw de la función big-bang
;Toma un estado y crea la imagen que corresponde agregando al fondo los círculos en las posiciones que indica el estado
(define (p15 l) (cond [(empty? l) (empty-scene W15 H15 FONDO15)]
                           [else (place-image (circle RADIO15 "outline" COLOR15)
                                              (posn-x (first l))
                                              (posn-y (first l))
                                              (p15 (rest l)))]))

;k15: Estado Key -> Estado
;k15 es el handler dedicado a la cláusula on-key de la función big-bang
; - Si se presiona la tecla "b" deberán borrarse todas los círculos y volver a estado inicial.
; - Si se presiona la tecla "u" deberá borrarse la posición del último círculo agregado.
; - Si se presiona la barra espaciadora se agregará una círculo color negro en la escena en coordenadas aleatorias
(define (k15 e k) (cond [(key=? k " ") (cons (make-posn (random RADIO15 (- W15 RADIO15)) (random RADIO15 (- H15 RADIO15))) e)]
                        [(key=? k "u") (rest e)]
                        [(key=? k "b") INIT15]
                        [else e]))

; Expresión big-bang para el programa interactivo.
#|(big-bang INIT15
          [to-draw  p15]
          [on-key   k15])|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 16 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct libro [isbn nombre autor puntaje])
(define iker (list (make-libro 10101023130 "El Lobo Estepario" "Hesse" 10)
                   (make-libro 10101023131 "La Naranja Mecanica" "Burgess" 10)
                   (make-libro 10101023132 "1984" "Orwell" 10)))
(define amaia (list (make-libro 10101023133 "Patria" "Aramburu" 8)
                   (make-libro 10101023131 "La Naranja Mecanica" "Burgess" 7)
                   (make-libro 10101023132 "1984" "Orwell" 9)))

; Dados dos libros, decimos que las lecturas coinciden si la diferencia
; entre los puntajes es menor a 2.
; coincide? libro libro -> Boolean
(check-expect (coincide? (make-libro 10101023132 "1984" "Orwell" 10)
                         (make-libro 10101023132 "1984" "Orwell" 7))
              #false)
(check-expect (coincide? (make-libro 10101023132 "1984" "Orwell" 10)
                         (make-libro 10101023132 "1984" "Orwell" 9))
              #true)
(define (coincide? l1 l2) (if (and (libro? l1) (libro? l2))
                             (<= (abs (- (libro-puntaje l1) (libro-puntaje l2))) 2)
                             #false))

; libro-coincide-en-lista : libro List(libro) -> Boolean
(check-expect (libro-coincide-en-lista (make-libro 10101023132 "1984" "Orwell" 10) (list (make-libro 10101023133 "Patria" "Aramburu" 8)
                                                                                         (make-libro 10101023131 "La Naranja Mecanica" "Burgess" 7)
                                                                                         (make-libro 10101023132 "1984" "Orwell" 9)))
              #true)
(check-expect (libro-coincide-en-lista (make-libro 10101023132 "1984" "Orwell" 10) (list (make-libro 10101023133 "Patria" "Aramburu" 8)
                                                                                         (make-libro 10101023131 "La Naranja Mecanica" "Burgess" 7)
                                                                                         (make-libro 10101023132 "1984" "Orwell" 7)))
              #false)
(define (libro-coincide-en-lista libro l) (cond [(empty? l) #false]
                                                [(= (libro-isbn (first l)) (libro-isbn libro)) (coincide? (first l) libro)]
                                                [else (libro-coincide-en-lista libro (rest l))]))

; Dados dos usuarios a y b, decide si b puede recomendarle libros a a.
; Puede recomendar lecturas si mas del 10% de los libros son coincidentes.
; similares? list(libro) list(libro) -> Boolean
#|(check-expect (similares? (list (make-libro 10101023130 "El Lobo Estepario" "Hesse" 10)
                                (make-libro 10101023131 "La Naranja Mecanica" "Burgess" 10)
                                (make-libro 10101023130 "1984" "Orwell" 10))
                          (list (make-libro 10101023130 "Patria" "Aramburu" 8)
                                (make-libro 10101023131 "La Naranja Mecanica" "Burgess" 7)
                                (make-libro 10101023130 "1984" "Orwell" 9)))
              #true)
(check-expect (similares? (list (make-libro 10101023130 "El Lobo Estepario" "Hesse" 10)
                                (make-libro 10101023131 "La Naranja Mecanica" "Burgess" 10)
                                (make-libro 10101023130 "1984" "Orwell" 10))
                          (list (make-libro 10101023130 "Patria" "Aramburu" 8)
                                (make-libro 10101023131 "La Naranja Mecanica" "Burgess" 7)
                                (make-libro 10101023130 "1984" "Orwell" 6)))
              #false)|#


; (define (juntar-por-isbn a b) )

; libro-en-lista : List(libro) List(libro) -> List(libro)
; (define (posibilidades a b) )

; (define (similares? a b) )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 17 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 18 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 19 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 20 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 21 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 22 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|(define (f22 n) (cond [(zero? n) 0]
                    [(= n 1) 2]
                    [(= n 2) 5]
                    [else (+ (f22 (sub1 n)) (* 2 (f22 (sub1 (sub1 (sub1 n))))))]))

(define (intervalo n) (cond [(zero? n) '(0)]
                            [else (append (intervalo (sub1 n)) (list n))]))

(define (fs l) (cond [(empty? l) '()]
                     [else (cons (f22 (first l)) (Fs (rest l)))]))

(check-expect (Fs 5) (list 0 2 5 5 9 19))
(check-expect (Fs 0) (list 0))
(define (Fs n) (fs (intervalo n)))|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 23 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define ANCHO23 300)
(define ALTO23 300)
(define (dibujarelipsen n) (rotate (* 2 n) (ellipse (* 10 n) (* 5 n) "outline" "blue")))
(define (dibujar-elipses n) (cond [(zero? n) (empty-scene ANCHO23 ALTO23 "white")]
                                  [(positive? n) (place-image (dibujarelipsen n) (/ ANCHO23 2) (/ ALTO23 2) (dibujar-elipses (sub1 n)))]))

; (dibujar-elipses 30)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 24 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 25 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


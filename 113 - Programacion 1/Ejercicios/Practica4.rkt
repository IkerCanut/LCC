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

(define ANCHO5 300)
(define ALTO5 300)
(define RADIO5 15)
(define DELTA5 3)

(define (int5 cc)
  (place-image
   (circle RADIO5 "solid" "blue")
   (posn-x cc) (posn-y cc)
   (empty-scene ANCHO5 ALTO5)))

(define (tec5 s k)
  (cond [(key=? k "up") (if (> (- (posn-y s) DELTA5) (/ RADIO5 2)) (make-posn (posn-x s) (- (posn-y s) DELTA5)) s)]
        [(key=? k "down") (if (< (+ (posn-y s) DELTA5) (- ALTO5 (/ RADIO5 2))) (make-posn (posn-x s) (+ (posn-y s) DELTA5)) s)]
        [(key=? k "left") (if (> (- (posn-x s) DELTA5) (/ RADIO5 2)) (make-posn (- (posn-x s) DELTA5) (posn-y s)) s)]
        [(key=? k "right") (if (< (+ (posn-x s) DELTA5) (- ANCHO5 (/ RADIO5 2))) (make-posn (+ (posn-x s) DELTA5) (posn-y s)) s)]
        [(key=? k " ") (make-posn (/ ANCHO5 2) (/ ALTO5 2))]
        [else s]))

(define (mouse-handler n x y event)
  (cond [(string=? event "button-down") (make-posn x y)]
        [else n]))

#|(big-bang (make-posn (/ ANCHO5 2) (/ ALTO5 2))
  [to-draw int5]
  [on-key tec5]
  [on-mouse mouse-handler])|#

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 6 ;;;;;;;;;;;;;;;;;;;;;;;;

(define ANCHO6 200)
(define ALTO6 200)
(define DELTA6 3)
(define GAMMA6 5)

(define (int6 p)
  (if (= (posn-x p) -1)
      (place-image/align (text "Has atrapado la mosca" 10 "black") (/ ANCHO6 2) (/ ALTO6 2) "center" "center" (empty-scene ANCHO6 ALTO6 "white"))
      (place-image (circle 2 "solid" "blue") (posn-x p) (posn-y p) (empty-scene ANCHO6 ALTO6 "white"))))

(define (elegir-random a b) (if (= (random 2) 1) a b))

(define (entra6 x y dx dy) (and (< 0 (+ x dx) ANCHO6) (< 0 (+ y dy) ALTO6)))

(define (tick6 s)
  (if (= (posn-x s) -1) s
  (if (string=? (elegir-random "up" "down") "up")
      (if (string=? (elegir-random "left" "right") "left")
          (if (entra6 (posn-x s) (posn-y s) (- DELTA6) (- DELTA6)) (make-posn (- (posn-x s) DELTA6) (- (posn-y s) DELTA6)) s)
          (if (entra6 (posn-x s) (posn-y s) (+ DELTA6) (- DELTA6)) (make-posn (+ (posn-x s) DELTA6) (- (posn-y s) DELTA6)) s))
      (if (string=? (elegir-random "left" "right") "left")
          (if (entra6 (posn-x s) (posn-y s) (- DELTA6) DELTA6) (make-posn (- (posn-x s) DELTA6) (+ (posn-y s) DELTA6)) s)
          (if (entra6 (posn-x s) (posn-y s) DELTA6 DELTA6) (make-posn (+ (posn-x s) DELTA6) (+ (posn-y s) DELTA6)) s)))))

(define (mouse6 s x y e)
  (if (< (sqrt (+ (expt (- (posn-x s) x) 2) (expt (- (posn-y s) y) 2))) GAMMA6)
  (make-posn -1 -1) s))

#|(big-bang (make-posn (/ ANCHO6 2) (/ ALTO6 2))
  [to-draw int6]
  [on-tick tick6]
  [on-mouse mouse6])|#

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 7 ;;;;;;;;;;;;;;;;;;;;;;;;

(define AUTO (circle 20 "solid" "green"))

(define ANCHO7 400)
(define ALTO7 100)
(define DELTA7 3)
(define SALTO7 20)

(define-struct Auto [hpos vel])
(define DELTA-VEL 1)

(define (int7 x)
  (place-image AUTO
               (Auto-hpos x) (/ ALTO7 2)
               (empty-scene ANCHO7 ALTO7)))

(define (controlador-tick x)
  (if (< (+ (Auto-hpos x) (Auto-vel x)) (- ANCHO7 (/ (image-width AUTO) 2))) (make-Auto (+ (Auto-hpos x) (Auto-vel x)) (Auto-vel x)) x))

(define (controlador-teclado s k)
  (cond [(key=? k " ") (make-Auto (/ (image-width AUTO) 2) (Auto-vel s))]
        [(key=? k "right") (make-Auto (+ (Auto-hpos s) SALTO7) (Auto-vel s))]
        [(key=? k "left") (make-Auto (- (Auto-hpos s) SALTO7) (Auto-vel s))]
        [(key=? k "up") (make-Auto (Auto-hpos s) (+ (Auto-vel s) DELTA-VEL))]
        [(key=? k "down") (make-Auto (Auto-hpos s) (- (Auto-vel s) DELTA-VEL))]
        [else s]))

(define (controlador-mouse s x y e)
  (if (string=? e "button-down") (make-Auto x (Auto-vel s)) s))

#|(big-bang (make-Auto (/ (image-width AUTO) 2) DELTA7)
  [to-draw int7]
  [on-key controlador-teclado]
  [on-tick controlador-tick]
  [on-mouse controlador-mouse])|#

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 8 ;;;;;;;;;;;;;;;;;;;;;;;;

(define ANCHO8 800)
(define ALTO8 60)
(define-struct Texto [texto color tamano])

(define (int8 s)
  (place-image/align (text (Texto-texto s) (Texto-tamano s) (Texto-color s))
  0 0 "left" "top" (empty-scene ANCHO8 ALTO8)))

(define (tec8 s k)
  (cond [(key=? k "\b") (make-Texto (substring (Texto-texto s) 0 (- (string-length (Texto-texto s)) 1)) (Texto-color s) (Texto-tamano s))]
        [(key=? k "f1") (make-Texto (Texto-texto s) "indigo" (Texto-tamano s))]
        [(key=? k "f2") (make-Texto (Texto-texto s) "red" (Texto-tamano s))]
        [(key=? k "f3") (make-Texto (Texto-texto s) "blue" (Texto-tamano s))]
        [(key=? k "f4") (make-Texto (Texto-texto s) "green" (Texto-tamano s))]
        [(key=? k "f5") (make-Texto (Texto-texto s) "pink" (Texto-tamano s))]
        [(key=? k "f6") (make-Texto (Texto-texto s) "purple" (Texto-tamano s))]
        [(key=? k "up") (make-Texto (Texto-texto s) (Texto-color s) (+ (Texto-tamano s) 1))]
        [(key=? k "down") (make-Texto (Texto-texto s) (Texto-color s) (max (- (Texto-tamano s) 1) 1))]
        [(= (string-length k) 1) (make-Texto (string-append (Texto-texto s) k) (Texto-color s) (Texto-tamano s))]
        [else s]))

#|(big-bang (make-Texto "" "indigo" 14)
  [to-draw int8]
  [on-key tec8])|#

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 9 ;;;;;;;;;;;;;;;;;;;;;;;;

; Todas las distancias estan en km y todos los precios en pesos.
(define-struct Auto9 [modelo anio tcombustible rendimiento])
; Dado un valor de tipo Auto y un numero de kilometros a recorrer,
; calcula el costo del viaje, teniendo en cuenta la antiguedad,
; peajes y el precio del combustible.
(define rendimiento1<5 2)
(define rendimiento6<10 6)
(define rendimiento10<15 10)
(define rendimiento15<x 15)
(define peajesdistancia 100)
(define peajeprecio 50)
(define preciolitronafta 19)
(define preciolitrodiesel 17)
(define anio 2020)
; costo-viaje : Auto9 -> Number
(check-expect (costo-viaje (make-Auto9 "Gol" 2016 "Nafta" 13) 458.64) 884)
(define (costo-viaje auto km)
  (+
   (/
    (* 
      km
      (cond [(string=? (Auto9-tcombustible auto) "Nafta") 19]
            [(string=? (Auto9-tcombustible auto) "Diesel") 17]))
    (* (Auto9-rendimiento auto) (cond [(= (- anio (Auto9-anio auto)) 0) (/ 100 100)]
          [(<= (- anio (Auto9-anio auto)) 5) (/ (- 100 rendimiento1<5) 100)]
          [(<= (- anio (Auto9-anio auto)) 10) (/ (- 100 rendimiento6<10) 100)]
          [(<= (- anio (Auto9-anio auto)) 15) (/ (- 100 rendimiento10<15) 100)]
          [else (/ (- 100 rendimiento15<x) 100)])))
   (*
    (floor (/ km peajesdistancia))
    peajeprecio)))

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 10 ;;;;;;;;;;;;;;;;;;;;;;;

(define-struct Alumno [nombre prom asis])

; Representamos alumnos mediante la estructura Alumno
; condicion : Alumno -> String
; Dado un alumno, define su condicion
(check-expect (condicion (make-Alumno "Iker" 1 10)) "Libre")
(check-expect (condicion (make-Alumno "Iker" 1 60)) "Libre")
(check-expect (condicion (make-Alumno "Iker" 6 60)) "Regular")
(check-expect (condicion (make-Alumno "Iker" 10 100)) "Promovido")
(check-expect (condicion 6) "Tipo de dato incorrecto")
(define (condicion a)
  (if (Alumno? a)
      (if (< (Alumno-asis a) 60) "Libre"
          (cond [(< (Alumno-prom a) 6) "Libre"]
                [(< (Alumno-prom a) 8) "Regular"]
                [else "Promovido"]))
      "Tipo de dato incorrecto"))

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 11 ;;;;;;;;;;;;;;;;;;;;;;;

(define-struct Casa [prop dir sup zona])

; Dada una casa de tipo Casa, devuelve los datos de la venta
; de dicha propiedad, dando los datos del propietario, direccion
; monto (luego de los descuentos)
; venta : Casa -> String
(check-expect (venta (make-Casa "Jose Romero" "Rueda 3456" 120 "C"))
  "La persona Jose Romero recibira 1140000 pesos por la venta de su propiedad ubicada en la calle Rueda 3456")
(define (venta casa)
  (string-append "La persona "
                 (Casa-prop casa)
                 " recibira "
                 (number->string (let ([preciobruto (cond [(string=? (Casa-zona casa) "A") (* 20000 (Casa-sup casa))]
                                          [(string=? (Casa-zona casa) "B") (* 15000 (Casa-sup casa))]
                                          [(string=? (Casa-zona casa) "C") (* 10000 (Casa-sup casa))]
                                          [(string=? (Casa-zona casa) "D") (* 5000 (Casa-sup casa))])])
                   (* preciobruto (if (< preciobruto 1000000) 0.97 0.95))))
                 " pesos por la venta de su propiedad ubicada en la calle "
                 (Casa-dir casa)
                 ))

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 12 ;;;;;;;;;;;;;;;;;;;;;;;

(define-struct Persona [nombre peso unidadpeso estatura unidadestatura])

; Se representan personas mediante la estructura Persona.
; IMC : Persona -> Number | String
; Dada una persona, calcula su indice de masa corporal.
(check-expect (IMC (make-Persona "Iker" 72 "kg" 1.90 "m"))
              (IMC (make-Persona "Iker" 72000 "g" 190 "cm")))
(define (IMC p)
  (if (Persona? p)
      (/
       (if (string=? (Persona-unidadpeso p) "kg") (Persona-peso p) (/ (Persona-peso p) 1000))
       (expt (if (string=? (Persona-unidadestatura p) "m") (Persona-estatura p) (/ (Persona-estatura p) 100)) 2))
      "Tipo de dato inválido"))

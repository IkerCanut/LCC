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

#|(big-bang "blue"
  [to-draw interpretar]
  [on-key manejarTeclado])|#

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

#|(big-bang 100
  [to-draw pantalla]
  [on-tick decrementar])|#

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

#|(big-bang 40
  [to-draw pantalla3]
  [on-tick incrementar]
  [on-key manejarTeclado3]
  [stop-when condicion3?])|#

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 4 ;;;;;;;;;;;;;;;;;;;;;;;;

(define ANCHO 300)
(define ALTO 300)
(define RADIO 15)
(define DELTA 3)

(define (int4 n)
  (place-image
   (circle RADIO "solid" "blue")
   (/ ANCHO 2) n
   (empty-scene ANCHO ALTO)))

(define (tec4 s k)
  (cond [(key=? k "up") (if (> (- s DELTA) (/ RADIO 2)) (- s DELTA) s)]
        [(key=? k "down") (if (< (+ s DELTA) (- ALTO (/ RADIO 2))) (+ s DELTA) s)]
        [(key=? k " ") (/ ALTO 2)]
        [else s]))

(define (mouse-handler n x y event)
  (cond [(string=? event "button-down") y]
        [else n]))

#|(big-bang (/ ALTO 2)
  [to-draw int4]
  [on-key tec4]
  [on-mouse mouse-handler])|#

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 5 ;;;;;;;;;;;;;;;;;;;;;;;;

(define ANCHO5 300)
(define ALTO5 300)
(define RADIO5 20)
(define TBTWT 1)

(define (int5 c)
  (place-image (circle RADIO5 "solid" c) (/ ANCHO 2) (/ ALTO 2) (empty-scene ANCHO5 ALTO5 "white")))

(define (ccolor s)
  (cond [(string=? s "yellow") "red"]
        [(string=? s "red") "green"]
        [(string=? s "green") "blue"]
        [(string=? s "blue") "yellow"]))

#|(big-bang "yellow"
  [to-draw int5]
  [on-tick ccolor TBTWT])|#

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 6 ;;;;;;;;;;;;;;;;;;;;;;;;

(define ANCHO6 800)
(define ALTO6 60)

(define (int6 s)
  (place-image/align (text s 20 "indigo")
  0 0 "left" "top" (empty-scene ANCHO6 ALTO6)))

(define (tec6 s k)
  (cond [(key=? k "\b") (substring s 0 (- (string-length s) 1))]
        [(= (string-length k) 1) (string-append s k)]
        [else s]))
  
#|(big-bang ""
  [to-draw int6]
  [on-key tec6])|#

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 7 ;;;;;;;;;;;;;;;;;;;;;;;;

(define AUTO .)

(define ANCHO7 400)
(define ALTO7 100)
(define DELTA7 3)
(define SALTO7 20)

(define (int7 x)
  (place-image AUTO
               x (/ ALTO7 2)
               (empty-scene ANCHO7 ALTO7)))

(define (controlador-tick x)
  (if (< (+ x DELTA7) (- ANCHO7 (/ (image-width AUTO) 2))) (+ x DELTA7) x))

(define (controlador-teclado s k)
  (cond [(key=? k " ") (/ (image-width AUTO) 2)]
        [(key=? k "right") (+ s SALTO7)]
        [(key=? k "left") (- s SALTO7)]
        [else s]))

(define (controlador-mouse s x y e)
  (if (string=? e "button-down") x s))

#|(big-bang (/ (image-width AUTO) 2)
  [to-draw int7]
  [on-key controlador-teclado]
  [on-tick controlador-tick]
  [on-mouse controlador-mouse])|#

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 8 ;;;;;;;;;;;;;;;;;;;;;;;;

(define ANCHO8 800)
(define ALTO8 600)
(define COLORBKG8 "darkblue")
(define COLORSTR8 "white")
(define TAMANOMAX 15)

(define (int8 s) s)

(define (entraenescena x y)
  (and (> (- x (/ (image-width (star (gettamano x) "solid" COLORSTR8)) 2)) 0)
       (< (+ x (/ (image-width (star (gettamano x) "solid" COLORSTR8)) 2)) ANCHO8)
       (> (- y (/ (image-height (star (gettamano x) "solid" COLORSTR8)) 2)) 0)
       (< (+ y (/ (image-height (star (gettamano x) "solid" COLORSTR8)) 2)) ALTO8)))

(define (gettamano x)
  (+ 5 (* (/ x ANCHO8) (- TAMANOMAX 5))))

(define (c-mouse8 s x y e)
  (cond [(and (string=? e "button-down") (entraenescena x y)) (place-image (star (gettamano x) "solid" COLORSTR8) x y s)]
        [else s]))

(define (c-tec8 s k)
  (cond [(key=? k "\b") (empty-scene ANCHO8 ALTO8 COLORBKG8)]
        [else s]))

#|(big-bang (empty-scene ANCHO8 ALTO8 COLORBKG8)
  [to-draw int8]
  [on-key c-tec8]
  [on-mouse c-mouse8])|#

;;;;;;;;;;;;;;;;;;;;;;;; EJERCICIO 9 ;;;;;;;;;;;;;;;;;;;;;;;;

(define ANCHO9 500)
(define ALTO9 500)
(define BKGD "darkyellow")
(define TAMANO 40)
(define INICIAL "tv")

(define (getcolor s)
  (cond [(string=? (string-ith s 1) "v") "green"]
        [(string=? (string-ith s 1) "a") "blue"]))

(define (int9 s)
  (cond [(string=? (string-ith s 0) "c")
         (place-image (circle TAMANO "solid" (getcolor s)) (random 1 ANCHO9) (random 1 ALTO9) (empty-scene ANCHO9 ALTO9))]
        [(string=? (string-ith s 0) "t")
         (place-image (triangle TAMANO "solid" (getcolor s)) (random 1 ANCHO9) (random 1 ALTO9) (empty-scene ANCHO9 ALTO9))]))

(define (tec9 s k)
  (cond [(key=? k "t") (string-append "t" (string-ith s 1))]
        [(key=? k "c") (string-append "c" (string-ith s 1))]
        [else s]))

(define (color9 s)
  (cond [(key=? (string-ith s 1) "v") (string-append (string-ith s 0) "a")]
        [(key=? (string-ith s 1) "a") (string-append (string-ith s 0) "v")]))

#|(big-bang INICIAL
  [to-draw int9]
  [on-key tec9]
  [on-tick color9 1])|#

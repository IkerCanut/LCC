;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ejercicio-plantillaC) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require lang/posn)
(require 2htdp/image)
(require 2htdp/universe)

; El Estado está compuesto por una lista de posn
...


;definiciones constantes, COMPLETE
(define ANCHO 500) ; ancho de la escena
(define ALTO 500) ; alto de la escena
...


;Estado inicial: lista vacia
(define INIT ...)

;pantalla: Estado -> Image
;Pantalla: dedicado a la cláusula to-draw de la función big-bang
;Toma un estado y crea la imagen que corresponde agregando al fondo los círculos en las posiciones que indica el estado
...

;key-handler: Estado Key -> Estado
;key-handler es el handler dedicado a la cláusula on-key de la función big-bang
; - Si se presiona la tecla "b" deberán borrarse todas los círculos y volver a estado inicial.
; - Si se presiona la tecla "u" deberá borrarse la posición del último círculo agregado.
; - Si se presiona la barra espaciadora se volverá al etado inicial
(define (key-handler e k) (cond ...)

; Expresión big-bang para el programa interactivo.
(big-bang ...
          [to-draw  ...]        
          [on-mouse ...]
          [on-key   ...]
)
random
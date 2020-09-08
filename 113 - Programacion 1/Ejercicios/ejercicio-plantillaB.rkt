;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ejercicio-plantillaB) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require lang/posn)
(require 2htdp/image)
(require 2htdp/universe)

; El Estado está compuesto por:
...


;definiciones constantes, COMPLETE si es necesario
...


;Estado inicial. Escena vacía del color del fondo, radio 20, color "red"
...

;pantalla: Estado -> Image
;Pantalla: dedicado a la cláusula to-draw de la función big-bang
...


;mouse-handler: Estado Number Number MouseEvent -> Estado
;mouse-handler es el handler dedicado a la cláusula on-mouse de la función big-bang
...


;key-handler: Estado Key -> Estado
;key-handler es el handler dedicado a la cláusula on-key de la función big-bang
...


; Expresión big-bang para el programa interactivo.
...
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ejercicio-plantillaA) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/image)
(require 2htdp/universe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; estado del sistema:
(define estado [.....])
; estado es (make-estado ......).
; Interpretación: ....

; constantes
(define ALTO 300)
(define ANCHO 300)
(define GRADOS-POR-TICK 5)
(define COLOR-FONDO "green")
(define INIT (make-estado ......)) ; estado inicial
.......


; dibujar : estado -> imagen
....

; key-handler : estado key -> estado
;
(define (key-handler e k) ... )
                       
; actualizar-angulo : estado -> estado
; responde al tick del reloj
(define (actualizar-angulo e k) ...)


(big-bang INIT
          [on-tick actualizar-angulo]
          [on-key  key-handler]
          [to-draw dibujar])
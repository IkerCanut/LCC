;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 1
; (2 + 3 * 4) / 5 + 6

(+ (/ (+ 2 (* 3 4)) 5) 6)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 2
(/ 7 10 2)
(/ (/ 7 10) 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 3
(string-append "3.14" "16")
; (string-append "Estamos en el año" 2020) ; string-append: expects a string as 2nd argument
(string-append "Combatimos "   "el Coronavirus")
; (string-append "Cuidémonos cuidando al otro") ; string-append: expects at least 2 arguments

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 4
; (number->string  "222") ; number->string: expects a number
(number->string 316)
; (number->string 41 7) ; el segundo argumento es la base, tiene que ser 2 8 10 o 16

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 5
(substring "Libertad" 1 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 6
(and #f (or #t (and #t #t)))
; ==
; #f

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 7
(and #t (or #t (and #t #t)))
; ==
; (and #t #t)
; ==
; #t

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 8

; (image-height (square "solid" "blue")) ; square: expects 3 arguments
; (image-height 40) ; image-height: expects an image as first argument, given 40
; (image-height (square 10 "solid" "blue") (circle 20 "solid" "red")) ; image-height: expects only 1 argument

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 9
(image-width (circle (* 10 2) "solid" "blue"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 10
" 3 + 4 "
" ( + 3 4 ) "
; + 3 4 ; expected a function call
( + 3 4 )
"#true"
; (" + 8 9") ; expected a function after the open parenthesis
; (-1) ;  expected a function after the open parenthesis
( -  1 )
; ( "Pandemia" ) ; expected a function after the open parenthesis
#false
; ( +  2  *  3  4 ) ; expected a function call, but there is no open parenthesis
"Trabajamos en casa"
;Virus ; this variable is not defined

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 11
; f : Number -> Number
(define (f x) (* x 10))
; g : Number -> Image
(define (g x) (circle x "solid" "blue"))
; h : Booleano -> Booleano
(define (h x) (and x #t))
; k : Number -> Booleano
(define (k x) (> x 0))

(g (f 2)) ; Devuelve un circulo azul radio 10 x
; (f (g 3)) ; Number -> Image != Number -> Number
; (g (k 3)) ; Number -> Booleano != Numer -> Image
(h (k 3)) ; Si es un numero positivo, imprime #true
; (k (h #t)) ; Booleano -> Booleano != Number -> Boolean

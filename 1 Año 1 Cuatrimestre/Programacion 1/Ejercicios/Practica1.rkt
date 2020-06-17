;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1.3 EJERCICIOS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 1

(define
  (f x)
  (if (>= (image-height x) (image-width x)) "Flaca" "Gorda"))

(f (empty-scene 50 100)) ; Flaca
(f (empty-scene 50 50)) ; Flaca
(f (empty-scene 100 50)) ; Gorda

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 2

(define
  (g x)
  (if (> (image-height x) (image-width x)) "Flaca"
      (if (= (image-height x) (image-width x)) "Cuadrada" "Gorda"))
  )

(g (empty-scene 50 100)) ; Flaca
(g (empty-scene 50 50)) ; Cuadrada
(g (empty-scene 100 50)) ; Gorda

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 3

(define (clasTriangulo x y z)
  (if (= x y z) "Equilatero"
    (if (or (= x y) (= x z) (= y z))
      "Isoceles" "Escaleno"
    )
  )
) 

(clasTriangulo 60 60 60) ; "Equilatero"
(clasTriangulo 45 45 90) ; "Isoceles
(clasTriangulo 20 100 60) ; "Escaleno"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 4

(define (clasTriangulo2 x y z)
  (if (= (+ x y z) 180)
    (if (= x y z) "Equilatero"
      (if (or (= x y) (= x z) (= y z))
        "Isoceles" "Escaleno"
      )
    )
    "Error"
  )
) 

(clasTriangulo2 60 60 60) ; "Equilatero"
(clasTriangulo2 45 45 90) ; "Isoceles
(clasTriangulo2 20 100 60) ; "Escaleno"
(clasTriangulo2 80 80 80) ; "Error"
(clasTriangulo2 50 50 50) ; "Error"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 5

(define PC 60)  ; Precio Cuaderno
(define MC 4)   ; Minimo para descuento en Cuadernos
(define DC .10) ; Descuento en Cuadernos
(define PL 8)   ; Precio Lapiz
(define ML 5)   ; Minimo para descuento en Lapices
(define DL .15) ; Descuento en Lapices

(define
  (preciol l)
  (if (< l ML)  (* PL l)  (* PL l (- 1 DL))))
(define
  (precioc c)
  (if (< c MC)  (* PC c)  (* PC c (- 1 DC))))

(preciol 4) ; 32
(preciol 5) ; 34
(precioc 3) ; 180
(precioc 4) ; 216

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 6
; ABURRIDO

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 7
; ABURRIDO

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 8
; ABURRIDO

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 9

(define (collatz n)
  (if (= (modulo n 2) 0)
    (/ n 2)
    (+ (* 3 n) 1)
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EJERCICIO 10

(define ANCHO 180)
(define ALTO 120)

(define ejemplo
  (place-image (rectangle ANCHO (/ ALTO 2) "solid" "red") (/ ANCHO 2) (/ ALTO 4)
    (place-image (circle (/ ALTO 6) "solid" "blue") (/ ANCHO 2) (* ALTO 3 (/ 1 4))
      (empty-scene ANCHO ALTO)
    )
  )
)
ejemplo

(define Peru
  (place-image (rectangle (/ ANCHO 3) ALTO "solid" "red") (/ ANCHO 6) (/ ALTO 2)
    (place-image (rectangle (/ ANCHO 3) ALTO "solid" "white") (/ ANCHO 2) (/ ALTO 2)
      (place-image (rectangle (/ ANCHO 3) ALTO "solid" "red") (* 5 (/ ANCHO 6)) (/ ALTO 2)
        (empty-scene ANCHO ALTO)
      )
    )
  )
)
Peru

(define Italia
  (place-image (rectangle (/ ANCHO 3) ALTO "solid" "green") (/ ANCHO 6) (/ ALTO 2)
    (place-image (rectangle (/ ANCHO 3) ALTO "solid" "white") (/ ANCHO 2) (/ ALTO 2)
      (place-image (rectangle (/ ANCHO 3) ALTO "solid" "red") (* 5 (/ ANCHO 6)) (/ ALTO 2)
        (empty-scene ANCHO ALTO)
      )
    )
  )
)
Italia

(define (TresBandasVerticales x y z)
  (place-image (rectangle (/ ANCHO 3) ALTO "solid" x) (/ ANCHO 6) (/ ALTO 2)
    (place-image (rectangle (/ ANCHO 3) ALTO "solid" y) (/ ANCHO 2) (/ ALTO 2)
      (place-image (rectangle (/ ANCHO 3) ALTO "solid" z) (* 5 (/ ANCHO 6)) (/ ALTO 2)
        (empty-scene ANCHO ALTO)
      )
    )
  )
)
(TresBandasVerticales "blue" "yellow" "red")

(define Alemania
  (place-image (rectangle ANCHO (/ ALTO 3) "solid" "black") (/ ANCHO 2) (/ ALTO 6)
    (place-image (rectangle ANCHO (/ ALTO 3) "solid" "red") (/ ANCHO 2) (/ ALTO 2)
      (place-image (rectangle ANCHO (/ ALTO 3) "solid" "yellow") (/ ANCHO 2) (* 5 (/ ALTO 6))
        (empty-scene ANCHO ALTO)
      )
    )
  )
)
Alemania

(define Holanda
  (place-image (rectangle ANCHO (/ ALTO 3) "solid" "red") (/ ANCHO 2) (/ ALTO 6)
    (place-image (rectangle ANCHO (/ ALTO 3) "solid" "white") (/ ANCHO 2) (/ ALTO 2)
      (place-image (rectangle ANCHO (/ ALTO 3) "solid" "blue") (/ ANCHO 2) (* 5 (/ ALTO 6))
        (empty-scene ANCHO ALTO)
      )
    )
  )
)
Holanda

(define (TresBandasHorizontales x y z)
  (place-image (rectangle ANCHO (/ ALTO 3) "solid" x) (/ ANCHO 2) (/ ALTO 6)
    (place-image (rectangle ANCHO (/ ALTO 3) "solid" y) (/ ANCHO 2) (/ ALTO 2)
      (place-image (rectangle ANCHO (/ ALTO 3) "solid" z) (/ ANCHO 2) (* 5 (/ ALTO 6))
        (empty-scene ANCHO ALTO)
      )
    )
  )
)
(TresBandasHorizontales "green" "yellow" "blue")

(define (TresBandas x y z sentido)
  (if (equal? sentido "horizontal")
    (TresBandasHorizontales x y z)
    (TresBandasVerticales x y z)
  )
)

(TresBandas "blue" "white" "red" "vertical")

(define Sudan
  (place-image (rotate 270 (triangle ALTO "solid" "green"))
  (/ (sqrt (- (expt ALTO 2) (/ (expt ALTO 2) 4))) 2)
  (/ ALTO 2)
    (place-image (TresBandas "red" "white" "black" "horizontal") (/ ANCHO 2) (/ ALTO 2) 
      (empty-scene ANCHO ALTO)
    )
  )
)
Sudan

(define Argentina
  (place-image (circle (/ ALTO 8) "solid" "yellow") (/ ANCHO 2) (/ ALTO 2)
    (place-image (TresBandas "blue" "white" "blue" "horizontal") (/ ANCHO 2) (/ ALTO 2) 
      (empty-scene ANCHO ALTO)
    )
  )
)
Argentina

(define Camerun
  (place-image (star (/ ALTO 6) "solid" "yellow") (/ ANCHO 2) (/ ALTO 2)
    (place-image (TresBandas "green" "red" "yellow" "vertical") (/ ANCHO 2) (/ ALTO 2) 
      (empty-scene ANCHO ALTO)
    )
  )
)
Camerun

(define Brasil
  (place-image (circle (/ ALTO 6) "solid" "blue") (/ ANCHO 2) (/ ALTO 2)
    (place-image (rhombus (/ ANCHO 2) 120 "solid" "yellow") (/ ANCHO 2) (/ ALTO 2)
      (place-image (rectangle ANCHO ALTO "solid" "green") (/ ANCHO 2) (/ ALTO 2) 
        (empty-scene ANCHO ALTO)
      )
    )
  ) 
)
Brasil

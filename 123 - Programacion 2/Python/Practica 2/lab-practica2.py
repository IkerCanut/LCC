################ BUCLES FOR ################
######## EJERCICIO 1
for n in range(10, 21):
    print(n)

######## EJERCICIO 2
for i in range(0, 7):
    for j in range(0, 7):
        print(i, " ", j)


######## EJERCICIO 3
def juego(n):
    for i in range(0, n + 1):
        for j in range(0, n + 1):
            print(i, " ", j)


juego(4)


######## EJERCICIO 4
def factorial(n):
    factorial = 1
    for numero in range(1, n + 1):
        factorial *= numero
    return factorial


def factoriales(m):
    for _ in range(0, m):
        print(factorial(int(input("Ingrese un numero >> "))))


# factoriales(int(input("Cuantos factoriales quiere calcular? \n >> ")))


######## EJERCICIO 6
def retorno(C, x, n):
    return C * (1 + (x / 100))**n


######## EJERCICIO 7
def triangulares_manual(n):
    suma = 0
    for i in range(1, n + 1):
        suma += i
        print(i, " - ", suma)


def triangulares(n):
    for i in range(1, n + 1):
        print(i, " - ", int((i * (i + 1)) / 2))


triangulares_manual(5)
triangulares(5)

################ BUCLES WHILE ################
######## EJERCICIO 8


def hasta_positivo():
    x = int(input("Por favor ingrese un numero positivo >> "))
    while (x <= 0):
        if (x < 0):
            print("Ingreso un numero negativo...")
        if (x == 0):
            print("Ingreso cero...")
        x = int(input("Por favor ingrese un numero positivo >> "))
    print(x)


# hasta_positivo()


######## EJERCICIO 9
def ingresar_notas():
    x = int(input("Ingrese una nota o -1 para salir \n >> "))
    if (x == -1):
        print("No se ingresaron notas")
    else:
        suma = 0
        contador = 0
        while (x != -1):
            suma += x
            contador += 1
            x = int(input("Ingrese una nota o -1 para salir \n >> "))
        print("El promedio de notas es: ", suma / contador)


# ingresar_notas()


######## EJERCICIO 10
def hasta_mayor():
    x1 = int(input("Ingrese el primer numero >> "))
    x2 = int(input("Ingrese un segundo numero mayor que " + str(x1) + " >> "))
    while (x1 >= x2):
        x2 = int(
            input("Ingrese un segundo numero mayor que " + str(x1) + " >> "))
    print(x1, "es menor que", x2)


# hasta_mayor()

######## EJERCICIO 11


def multiplos(p, q):
    print(len(range(p, q, p)))


multiplos(2, 9)

######## EJERCICIO 12


def login_a():
    password = input("a. Ingrese la contraseña >> ")
    while (password != "qwerty"):
        password = input("a. Ingrese la contraseña >> ")


# login_a()


def login_b():
    password = input("b. Ingrese la contraseña >> ")
    intento = 0
    while (password != "qwerty" and intento < 2):
        password = input("b. Ingrese la contraseña >> ")
        intento += 1


# login_b()


def login(password):
    return password == "qwerty"


######## EJERCICIO 13


def es_primo(n):
    for i in range(2, n):
        if (n % i) == 0:
            return False
    return True


def primos(n):
    for i in range(2, n + 1):
        if es_primo(i):
            print(i)


primos(19)


######## EJERCICIO 14
def es_potencia_de_dos(n):
    return (n & (n - 1) == 0) and n != 0


def potencias_de_dos(n):
    for i in range(1, n + 1):
        if es_potencia_de_dos(i):
            print(i)


potencias_de_dos(513)
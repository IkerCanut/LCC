################ PRIMEROS PROGRAMAS USANDO NUMEROS ################
######## EJERCICIO 1
def primeros25pares(contador=1):
    if contador <= 25:
        print(contador * 2)
        primeros25pares(contador + 1)


primeros25pares()
print("\n")

######## EJERCICIO 2


def primeros100pares(contador=1):
    if contador <= 100:
        print(contador * 2)
        primeros100pares(contador + 1)


primeros100pares()


def primerosnpares(n, contador=1):
    if contador <= n:
        print(contador * 2)
        primerosnpares(n, contador + 1)


primerosnpares(10)
print("\n")

######## EJERCICIO 3


def primerosnparesmayoresquem(n, m, contador=1):
    if contador <= n:
        if (2 * contador) > m:
            print(2 * contador)
        primerosnparesmayoresquem(n, m, contador + 1)


primerosnparesmayoresquem(10, 10)
print("\n")

######## EJERCICIO 4, 5


def sigma(n):
    if n == 0:
        return 0
    else:
        return n + sigma(n - 1)


print(sigma(50))
print("\n")


######## EJERCICIO 6
def sigmaentre(m, n):
    if (m >= n):
        return m
    else:
        return n + sigmaentre(m, n - 1)


print(sigmaentre(5, 10))
print("\n")


################ PRIMEROS PROGRAMAS USANDO CADENAS ################
######## EJERCICIO 7, 8
def duplica(texto, veces=2):
    print(texto * veces)


duplica("Iker")
duplica("Iker", 1)
duplica("Iker", 4)
print("\n")


################ PRIMEROS PROGRAMAS INTERACTIVOS ################
######## EJERCICIO 9
def suma(a, b):
    return a + b


def resta(a, b):
    return a - b


def multiplica(a, b):
    return a * b


def divide(a, b):
    return a / b


def calculadora():
    x = int(
        input(
            "\t 1. Suma \n \t 2. Resta \n \t 3. Multiplica \n \t 4. Divide \n \t 5. Salir \n Ingrese una opcion: "
        ))
    if x == 5:
        return
    a = int(input("Ingrese el primer numero: "))
    b = int(input("Ingrese el segundo numero: "))
    if x == 1:
        print("La suma entre ", a, " y ", b, " es ", suma(a, b))
    elif x == 2:
        print("La resta entre ", a, " y ", b, " es ", resta(a, b))
    elif x == 3:
        print("La multiplicacion entre ", a, " y ", b, " es ",
              multiplica(a, b))
    elif x == 4:
        print("La division entre ", a, " y ", b, " es ", divide(a, b))
    calculadora()


calculadora()
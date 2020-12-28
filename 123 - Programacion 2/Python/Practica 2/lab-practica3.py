################ BUCLES FOR ################
######## EJERCICIO 1
# Dado un n, que por default es 100, devuelve en un string
# n, n-5, n-10... hasta que dicho valor sea menor que 20.
def ejercicio1(n=100):
    h = ''
    while n >= 20:
        h += '' + str(n)
        n -= 5
    return h


assert ejercicio1(20) == '20'
assert ejercicio1(25) == '2520'


######## EJERCICIO 2
# Si a/b es mayor que 30, devuelve a/c * b^3
# caso contrario, ...
def ejercicio2(a, b, c):
    n = 2
    suma = 0
    sumas = 0
    if a / b > 30:
        suma = a / c * b**3
        return suma
    if a / b <= 30:
        while n <= 30:
            sumas += n**2
            n += 2
        return sumas


######## EJERCICIO 3 ...
######## EJERCICIO 4 ...
######## EJERCICIO 5 ...
#
def ejercicio5(s):
    for x in s:
        for z in x:
            print(z)
        print('***************')



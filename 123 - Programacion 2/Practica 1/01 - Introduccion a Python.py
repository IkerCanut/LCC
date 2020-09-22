from math import *

mensaje = "Hello world"
print(type(mensaje))
print(mensaje)

entero = 15
print(type(entero))
print(entero)

numerolindo = sqrt(2)
print(type(numerolindo))
print(numerolindo)

print("La letra 0 de la cadena " + mensaje + " es: " + mensaje[0])

def mi_primera_funcion(param1, param2):
	"""Esto es una docstring (cadena de documentacion)"""
	print("\n")
	print(param1)
	print(param2)
mi_primera_funcion(mensaje, entero)

def repetir(texto, veces = 2):
	print(texto * veces)

repetir("hola")
repetir("hola", 4)
repetir(veces=4, texto="hola")

def saludo():
	nombre = input("Cual es tu nombre? ")
	print("Encantado, " + nombre)
saludo()

def tipoNumero(n):
	if n < 0:
		print("negativo")
	elif n == 0:
		print("Cero")
	else:
		print("Positivo")

def tipoNumero2(n):
	if n < 0:
		print("negativo")
	elif n == 0:
		print("Cero")
	elif n > 0:
		print("Positivo")

def tipoNumero3(n):
	if n < 0:
		print("negativo")
	else:
		if n == 0:
			print("Cero")
		else:
			print("Positivo")

def factorial(n):
	if n == 0:
		return 1
	else:
		return n * factorial(n-1)
factorial(5)

def sumaNumeros(suma = 0, contador = 0):
	n = int(input("Ingrese un numero o 0 para finalizar: "))
	if n == 0:
		print("La suma es ", suma, " y se ingresaron ", contador, "numeros")
	else:
		sumaNumeros(suma+n, contador+1)
sumaNumeros()


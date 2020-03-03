'''input
11
10
5
5
17
3
8
11
28
6
55
7
'''
import sys
import math

arg=input()
n = int(raw_input())
lista =[]
diff = 1000
for i in range(n):
    pi = int(raw_input())
    lista.append(pi)
lista = sorted(lista)
for i in range(len(lista)-1):
	if lista[i+1] - lista[i] < diff:
		diff = lista[i+1] - lista[i]
print(lista)
print(diff)

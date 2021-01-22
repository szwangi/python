import sys
import math

n = int(input("Length of Fibonacci sequence: "))
if (n >= 1) and (abs(int(n)) == n):	
	a, b = 1, 2
	for _ in range(n - 1):
	    a, b = b, a + b
	    print(a)


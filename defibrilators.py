'''input
7
3,8740542
43,606779
3
107;Caisse Primaire d'Assurance Maladie;29 cours Gambetta 34000 MONTPELLIER;04 99 52 54 49;3,87110915929521;43,6065196099402
108;Caisse Primaire d'Assurance Maladie;90 allee Almicare Calvetti 34000 Montpellier;04 99 52 54 49;3,82126953167633;43,6322018829039
109;Caisse d'assurance retraite et de la Sante au travail;29 cours Gambetta 34000 MONTPELLIER;04 67 12 94 72;3,87064343057042;43,6068847626242
1
'''
import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.
def count_distance(longitude_A,latitude_A,longitude_B,latitude_B):
	x = abs(longitude_B - longitude_A) * math.cos((latitude_A + latitude_B) / 2)
	y = abs(latitude_B - latitude_A)
	d =  math.sqrt((x**2) + (y**2)) * 6371
	return d

def deg_to_rad(degree):
	return degree * math.pi / 180

a=input()
lon = raw_input().replace(",", ".")
lat = raw_input().replace(",", ".")
n = int(raw_input())
tmp=100000
answer=""
for i in range(n):
    defib = raw_input().split(";")
    distance = count_distance(
								deg_to_rad(float(lon)),
								deg_to_rad(float(lat)),
								deg_to_rad(float(defib[4].replace(",", "."))),
								deg_to_rad(float(defib[5].replace(",", "."))))
    if distance < tmp:
    	answer=defib[1]
    	tmp=distance

print(answer)

#
import math

from matplotlib import pyplot as plt
X = [23.8, 16.3, 27.2, 7.1, 25.1, 27.5, 19.4, 19.8, 32.2, 20.7]
Y = [115.4, 76.3, 113.8, 81.6, 115.5, 125, 83.6, 75.2, 136.8, 102.8]

aInit = 2.3
bInit = 2
L = 0.001
nbrIteration = 100

# Dérivée de la MSE par rapport à a


def dMSEda(x, y, yb):
    sum = 0
    n = len(x)
    for i in range(n):
        sum += x[i]*(y[i] - yb[i])
    return -(2/n) * sum

# Dérivée de la MSE par rapport à b


def dMSEdb(x, y, yb):
    sum = 0
    n = len(x)
    for i in range(n):
        sum += (y[i] - yb[i])
    return -(2/n) * sum


def calculYb(x):
    return a*x+b


a = aInit
b = bInit
atab = []
for i in range(nbrIteration):
    Yb = list(map(calculYb, X))
    print(Yb)
    a = a - L * dMSEda(X, Y, Yb)
    b = b - L * dMSEdb(X, Y, Yb)
    #print("a = " + str(a) + " b = " + str(b))


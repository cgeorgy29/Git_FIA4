from matplotlib import pyplot as plt


a = 2
b = 2
x = [23.8, 16.3, 27.2, 7.1, 25.1, 27.5, 19.4, 19.8, 32.2, 20.7]
y = [115.4, 76.3, 113.8, 81.6, 115.4, 125, 83.6, 75.2, 136.8, 102.8]
graph = []
n = 50
alpha = 0.001

def dmsesurdacalc(x, y, yb):
    sum = 0
    n = len(x)
    for i in range(n):
        sum += x[i]*(y[i] - yb[i])
    return -(2/n) * sum

def dmsesurdbcalc(x, y, yb):
    sum = 0
    n = len(x)
    for i in range(n):
        sum += (y[i] - yb[i])
    return -(2/n) * sum

def calculy(x):
    return a*x+b

atab = []
btab = []
for i in range(n):
    yb = list(map(calculy, x))
    a = a-alpha*(dmsesurdacalc(x,y,yb))
    b = b-alpha*(dmsesurdbcalc(x,y,yb))
    if(i % 5 == 0):
        plt.plot(x,yb, label="itération "+str(i))
        print("a = " + str(a) + " b = " + str(b))

plt.scatter(x,y)
plt.show()
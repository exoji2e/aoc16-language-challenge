import sys
inp = sys.stdin.read()
dragon = inp.split()[0]
dragon = [x is '1' for x in dragon]
n = int(inp.split()[1])
while(len(dragon)<=n):
    inv = list(map(lambda x: not x, dragon))
    dragon += [False] + inv[::-1]
dragon = dragon[0:n]

while(not len(dragon)%2):
    tuples = list(zip(dragon[::2], dragon[1::2]))
    dragon = list(map(lambda t: t[0]==t[1], tuples))

dragon = ''.join(map(lambda x: '1' if x else '0', dragon))
    
print(dragon)

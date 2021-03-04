def helper(a, b):
    a = str(a) 
    b = str(b)
    if int(a)%10!=0 and int(b)%10 != 0 and  set(a) & set(b):
        A = list(set(a) - set(b))
        B = list(set(b) - set(a))
        if A and B:
            return int(A[0])/int(B[0])
        else:
            return -1
    else:
        return -1 
n = []
d = []
for a in range(10, 100):
    for b in range(a+1, 100):
        if a/b == helper(a,b):
            n.append(a)
            d.append(b)

a = n.pop(0)
while n:
    a*=n.pop(0)
b = d.pop(0)
while d:
    b*=d.pop(0)

def gcd(a, b):
    while b != 0:
        t = a % b
        a = b
        b = t
    return a

print(a)
print(b)

b/gcd(a,b)

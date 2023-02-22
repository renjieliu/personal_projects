def gcd(n1, n2):
    while n2!=0:
        n1, n2 = n2, n1%n2
    return n1

print(gcd(24,16))


x = lambda y,z : y if z==0 else x(min(y,z),y%z)

print(x(198236472146210946329417235,121312342134165))





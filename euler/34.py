fact = lambda x: 1 if x in (0, 1) else x * fact(x-1)
output = []
for i in range(3, 100000):
    if i == sum(fact(int(_)) for _ in list(str(i))):
        output.append(i)

print(sum(output))
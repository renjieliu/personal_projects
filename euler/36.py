output = []
for i in range(1000000):
    b = bin(i).replace('0b','')
    if str(i) == str(i)[::-1] and b == b[::-1]:
        output.append(i)
print(sum(output))
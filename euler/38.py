def isPandigit(s):
    dedup = set(s)
    return '0' not in dedup and len(dedup) == 9

output = ""
for i in range(1,10000): # len() concat(10000*1, 10000*2)) > 9
    curr = ""
    for j in range(1, 10):
        curr += str(i*j)
        if len(curr) == 9:
            if isPandigit(curr):
                #print(output)
                output = max(output,curr)
        elif len(curr) > 9:
            break
output
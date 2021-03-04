curr = ""
i = 1
output = 1
while len(curr) <= 1000000:
    curr += str(i)
    i+=1
    
# print(curr[12])
print( int(curr[0])* int(curr[9])* int(curr[99])* int(curr[999])* int(curr[9999])* int(curr[99999])* int(curr[999999]))

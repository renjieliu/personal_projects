def main(v):
    return str(int(str(v).replace('4', '3'))) + " " + str(v - int(str(v).replace('4', '3')))
    

t = int(input())
for i in range(1, t + 1):
    m = int(input())
    print("Case #{}: {}".format(i, main(m)))
    

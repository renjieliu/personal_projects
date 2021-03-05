def helper(n):
    output = [1, n]
    for i in range(2, int(n**0.5)+1):
        if n%i == 0 :
            output.append(i)
            output.append(n//i)
    return output

def isPrime(n):
    for i in range(2, int(n**0.5)+1):
        if n % i == 0:
            return False
    return True


output = []
limit = 100000000
for i in range(1, limit+1):
    if i%100000==0:
        print(i)
    arr = helper(i)
    cnt = 0
    for a in arr:
        if isPrime(a+i/a):
            cnt +=1
        else:
            break
    if cnt == len(arr):
        output.append(i)
		
#print(output)
print(sum(output))

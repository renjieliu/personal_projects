def is_prime(n):
	prime = 1
	for i in range(2, int((n**0.5)//1)+1):
		if n%i == 0:
			prime =0
			break
	return prime

sum = 0
end = 2000000
for i in range(2, end):
	if is_prime(i)==1:
		sum+=i
print(sum)
def is_prime(n):
	prime = 1
	for i in range(2,int(n**0.5//1)+1):
		if n%i==0:
			prime=0
			break
	return prime

max_len = 0 
max_a = 0
max_b = 0	
for a in range(-999, 1000):
	for b in range(-1000, 1001):
		print(f"a: {a}")
		n = 0
		count = 0
		while n**2+a*n+b >=0 and is_prime(n**2+a*n+b) == 1:
			print(n)
			count = count+1
			n=n+1
		
		if count>max_len:
			max_len = count
			max_a = a
			max_b = b
	
print(max_len)
print(max_a)
print(max_b)
print(max_a*max_b)
		
		
		

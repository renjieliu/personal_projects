factor = []

i = 2
target = 600851475143

def is_prime(n):
	prime = 1
	#print(int(n**0.5//1+1))
	for i in range(2, int(n**0.5//1+1)):
		if n%i == 0:
			prime = 0
	
	return prime


while i<=target ** 0.5:
	if target%i==0 and is_prime(i) == 1:
		factor.append(i)
	i+=1

print(factor[-1])

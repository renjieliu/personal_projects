def triangle_num(n):
	return int((1+n)*n/2)
	
#print (triangle_num(1))


def is_prime(n):
	prime = 1
	for i in range(2, int((n**0.5)//1)+1):
		if n%i == 0:
			prime =0
			break
	return prime


count = 0;
i = 1
while True: 
	if i%20 == 0:
		print(i)
	t = triangle_num(i)
	
	if is_prime(t) == 1:
		i+=1
		continue	
	else:
		for j in range(1, int(t**0.5//1)):
			if t%j == 0:
				count+=1
		print(f"number {t} - count: {count}")
		if count > 250:
			#print(t)
			break;
		else:
			i+=1
			count = 0 






















def d(n):
	sum =0 
	for i in range(1,n):
		if n%i==0:
			sum+=i
	return sum

total = 0

for i in range(1,10001):
	if i%100==0:	
		print(i)
	t = d(i)
	if d(t) == i and i!=t:
		total+=i
		
print(total)
		
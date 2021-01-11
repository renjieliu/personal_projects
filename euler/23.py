def abd(n):
	sum = 0
	abd = 0
	for i in range(1, n):
		if n%i==0:
			sum+=i
		if sum>n:
			break
			
	if sum>n:
		abd = 1
	else:
		abd = 0
	return abd

# print(abd(28123))

set0 = set()
for n in range(1, 28124):
	if n%5 ==0 :
		print (n)
	brk = 0
	for i in range(1, int(n/2//1)+1):
	
		if brk == 1:
			break
		else:
			t = abd(i)
			
		if t == 0:
			continue
			
		elif t == 1:
			for j in range (int(n/2//1)-1, n):
				if i+j!=n or abd(j) == 0:
					continue				
				else:
					set0.add(n)
					brk = 1
					break
		

set1 = set(range(1,28124)) - set0

final = 0
for x in set1:
	final+=int(x)

print(final)




















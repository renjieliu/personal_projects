
max_length = 0
number =1
for i in range(1,1000000):
	if i%1000 ==0:
		print(i)
	length = 0
	t=i
	while t>1:
		if t%2==0:
			t=t/2
			length+=1
		else:
			t=3*t+1
			length+=1
			
	if length > max_length:
		max_length = length
		number = i
		
print(f"length: {max_length+1}")		
print(f"number: {number}")



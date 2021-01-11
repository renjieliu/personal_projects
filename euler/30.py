set = set()
total =0
for i in range(2, 2000000):
	input = str(i)
	sum = 0
	for j in range(0, len(input)):
		sum+=int(input[j])**5
	if sum==int(input):
		print(input)
		total += int(input)

print(total)

	

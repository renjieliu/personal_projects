sum = 1

for i in range(1,101):
	sum*=i

sum = str(sum)

total = 0

for j in range(0, len(sum)):
	total+=int(sum[j])
	print(total)

print(total)



set0= set() 

for i in range(2,101):
	for j in range(2,101):
		set0.add(i**j)

print(len(set0))
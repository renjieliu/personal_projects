fib = [1,1]
i=2 # This is the real ordinal index
now = 0
while now<10**999:
	now = fib[i-2]+fib[i-1]
	#print(f"i: {i} now: {now}")
	fib.append(now)
	i+=1

print(i) # This is the real ordinal index

	

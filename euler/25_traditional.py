# This approach is using the traditional recursive way to compute Fibonacci sequence, it's not working.
# As it will take forever to run.

def fib(n):
	if n<=2:
		return 1
	else:
		return fib(n-2)+fib(n-1)
		
i = 1
while fib(i)<10**999:
	print(f"i: {i} fib:{fib(i)}")
	i+=1

print(i)

